import 'dart:async';
import 'dart:ui';

import 'package:cron/cron.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health/health.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:pedometer/pedometer.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:sqflite/sqflite.dart';
import 'package:start_up_project/controllers/initialDataController.dart';
import 'package:start_up_project/controllers/notification_controller.dart';
import 'package:start_up_project/models/step_saver_model.dart';

import '../../constants.dart';
import '../../controllers/box_controller.dart';
import '../../helper/dependencies.dart' as dep;
import '../../models/notification_model.dart';
import '../../models/response_model.dart';
import '../../utils/assets.gen.dart';
import '../../utils/colors.dart';
import '../../utils/colors.gen.dart';

late Stream<StepCount> _stepCountStream;
late Stream<PedestrianStatus> _pedestrianStatusStream;
String _status = '?', _steps = '?',_statusTimeStamp="unknown",
    _stepsTimeStamps="unknown";

int FetchingDay=DateTime.now().day;

int feetLimit=8000;


String stp="?";

fetchHealthKit() async {
  HealthFactory health = HealthFactory();

  // define the types to get
  var types = [
    HealthDataType.STEPS,
    HealthDataType.BLOOD_GLUCOSE,
  ];

  // requesting access to the data types before reading them
  bool requested = await health.requestAuthorization(types);

  var now = DateTime.now();

  // fetch health data from the last 24 hours
  List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
      now.subtract(Duration(days: 1)), now, types);

  // request permissions to write steps and blood glucose
  types = [HealthDataType.ACTIVE_ENERGY_BURNED];
  var permissions = [
    HealthDataAccess.READ_WRITE,
  ];
  await health.requestAuthorization(types, permissions: permissions);
  var x=await health.getHealthDataFromTypes(now.subtract(Duration(days: 1)), now, types);
  try{
    print("xxx="+x[0].value.toString());
    GetStorage().write("cal", x[0].value.toString());
  }catch(e){

  }
  types = [HealthDataType.HEART_RATE];
  var permissions1 = [
    HealthDataAccess.READ_WRITE,
  ];
  await health.requestAuthorization(types, permissions: permissions);
  var y=await health.getHealthDataFromTypes(now.subtract(Duration(days: 1)), now, types);
  print("yyyy="+y.toString());
  try{
    GetStorage().write("heartRate", y[0].value.toString());
  }catch(e){
  }
  types = [HealthDataType.SLEEP_IN_BED];
  var permissions2 = [
    HealthDataAccess.READ_WRITE,
  ];
  await health.requestAuthorization(types, permissions: permissions);
  var z=await health.getHealthDataFromTypes(now.subtract(Duration(days: 1)), now, types);
  print("zzzz="+z.toString());
  try{
    GetStorage().write("sleep", z[0].value);
  }catch(e){

  }


}




initDataBase(int steps) async{
// Get a location using getDatabasesPath
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'stepsDb.db');

// open the database
  Database database = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
            'CREATE TABLE dailySteps (id INTEGER PRIMARY KEY, steps String,day INTEGER,hour INTEGER,totalStepsToday INTEGER)');
      });
  var totalSteps=await GetStorage().read(Constants.initialStepCounterValue+DateTime.now().day.toString());



  var count = Sqflite
      .firstIntValue(await database.rawQuery('SELECT COUNT(*) FROM dailySteps WHERE hour==${DateTime.now().hour}'));
  print('the count result is ${count}');
  if (count!>0) {
    int upd = await database.rawUpdate(
        'UPDATE dailySteps SET steps = $steps, day =  ${DateTime.now().day},hour = ${DateTime.now().hour} ,totalStepsToday =$totalSteps WHERE hour = ${DateTime.now().hour}');
    print('updated: $upd');

  }else{
    await database.transaction((txn) async {
      int id1 = await txn.rawInsert(
          'INSERT INTO dailySteps(steps, day, hour,totalStepsToday) VALUES($steps, ${DateTime.now().day}, ${DateTime.now().hour},$totalSteps)');
      print('inserted1: $id1');
    });
  }
  fetchDataBase(FetchingDay);



}

fetchDataBase(int fetchDay) async {

  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'stepsDb.db');

// open the database
  Database database = await openDatabase(path, version: 1);

  List<Map> list = await database.rawQuery('SELECT steps FROM dailySteps WHERE day=${fetchDay}');
  if (list.isNotEmpty) {

    stp=list.last['steps'].toString();


  }  else{
    stp="___";
  }
  List<Map> b = await database.rawQuery('SELECT * FROM dailySteps WHERE day=${fetchDay}');
  print(b);

}

void onStepCount(StepCount event) {
    _steps = event.steps.toString();
    _stepsTimeStamps=event.timeStamp .toIso8601String();
  if ( GetStorage().hasData(Constants.initialStepCounterValue+DateTime.now().day.toString())
   ) {
     //service already executedToday
    int val= GetStorage().read(Constants.initialStepCounterValue+DateTime.now().day.toString());
    int res=event.steps-val;
    initDataBase(res);
  }  else{
     GetStorage().write(Constants.initialStepCounterValue+DateTime.now().day.toString(), event.steps);
     int val= GetStorage().read(Constants.initialStepCounterValue+DateTime.now().day.toString());
     int res=event.steps-val;
     initDataBase(res);

   }



}


void onPedestrianStatusChanged(PedestrianStatus event) {
  print(event);

    _status = event.status;
    GetStorage().write("pedestrianStatus", _status);
    _statusTimeStamp = event.timeStamp.toIso8601String();
    GetStorage().write("pedestrianStatusTimeStamp", _statusTimeStamp);

}

void onPedestrianStatusError(error) {
  print('onPedestrianStatusError: $error');

    _status = 'Pedestrian Status not available';

  print(_status);

}

void onStepCountError(error) {
  print('onStepCountError: $error');
  stp="Your device don't have a pedometer ";



}


getNotification() async {
 return await Get.find<NotificationController>().getNotification();
}

void initPlatformState() {
  try {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);
  }catch(e){

  }

}

 const notificationChannelId = 'my_foreground';

// this will be used for notification id, So you can update your custom notification with this id.
 const notificationId = 9999999;

showNotification(FlutterLocalNotificationsPlugin fln,NotificationModel model) async {
  AndroidNotificationDetails androidNotificationDetails=
  new AndroidNotificationDetails("home", "Notification Channel",importance: Importance.max,
      priority: Priority.high);

  var not=NotificationDetails(android: androidNotificationDetails,iOS: DarwinNotificationDetails());

  await fln.show(model.id!, model.name, model.subtitle,not );
}

@pragma('vm:entry-point')
Future<void> onStart(ServiceInstance service) async {
  // Only available for flutter 3.0.0 and later
  DartPluginRegistrant.ensureInitialized();
  service.on('stopService').listen((event) {
    service.stopSelf();
  });
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  service.on('stopService').listen((event) {
    print("commanded");
    service.stopSelf();
  });
  // bring to foreground
  Timer.periodic(const Duration(seconds:10 ), (timer) async {
    service.on('stopService').listen((event) {
      print("commanded");

      service.stopSelf();
    });
    initPlatformState();
    await GetStorage.init();
    await dep.init();
    NotificationModel? notificationModel=await Get.find<NotificationController>().getNotification();
    if(notificationModel!=null){
showNotification(flutterLocalNotificationsPlugin,notificationModel);
      }




    if (true) {
      if (true) {
        flutterLocalNotificationsPlugin.show(
          notificationId,
          'STEP TRACKER',
          'current steps: ${stp} ',
          const NotificationDetails(
            android: AndroidNotificationDetails(
              notificationChannelId,
              'MY FOREGROUND SERVICE',
              icon: 'ic_bg_service_small',
              ongoing: true,
            ),
          ),
        );
      }
    }
  });
}

class TrackerMainScreen extends StatefulWidget {
  const TrackerMainScreen({Key? key}) : super(key: key);
  //
  //
  //
  //
  //
  //
  //
  //



  static Future<void> initializeService() async {

    final service = FlutterBackgroundService();

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      notificationChannelId, // id
      'MY FOREGROUND SERVICE', // title
      description:
      'This channel is used for important notifications.', // description
      importance: Importance.max, // importance must be at low or higher level
    );

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await service.configure(
        androidConfiguration: AndroidConfiguration(
          // this will be executed when app is in foreground or background in separated isolate
          onStart: onStart,

          // auto start service
          autoStart: true,
          isForegroundMode: true,


          notificationChannelId: notificationChannelId, // this must match with notification channel you created above.
          initialNotificationTitle: 'STEP TRACKER',
          initialNotificationContent: 'Initializing ',
          foregroundServiceNotificationId: notificationId,
        ), iosConfiguration: IosConfiguration(autoStart: true
    ));}

  //
  //
  //
  //
  //
  //
  //


  @override
  State<TrackerMainScreen> createState() => _TrackerMainScreenState();
}

class _TrackerMainScreenState extends State<TrackerMainScreen> {


  @override
  void initState() {
    super.initState();

    getTrackerStatus();
    initPlatformState();
  }


  bool status=false;



  getTrackerStatus() async{
    status=GetStorage().read(Constants.counterActivationSwitcherKey)??false;
  }



  @override
  Widget build(BuildContext context) {
    List days = [ DateTime.now().subtract(Duration(days: 6)),  DateTime.now().subtract(Duration(days: 5)),  DateTime.now().subtract(Duration(days: 4)), DateTime.now().subtract(Duration(days: 3)),  DateTime.now().subtract(Duration(days: 2)), DateTime.now().subtract(Duration(days: 1)), DateTime.now()];
    Size size = MediaQuery.of(context).size;
    String? x,y,k,z;
    int val=0;
    try{
    val=  int.parse(stp);
    }catch(e){
      val=0;
    }


    return Scaffold(

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 22.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Mon, Jun 24th, 2021',
                          style: TextStyle(
                            fontFamily: GoogleFonts.workSans().fontFamily,
                          ),
                        ),
                        Text(
                          'Daily activity',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: GoogleFonts.workSans().fontFamily,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.h,
                        decoration: BoxDecoration(
                          color: ColorName.grayC4,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                height: 90.h,
                width: size.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 20),
                      ListView.separated(
                        itemCount: days.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 10);
                        },
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: GestureDetector(
                              onTap: (){
                                setState(() {

FetchingDay=days[index].day;
initPlatformState();
                                });

                              },
                              child: Container(
                                height: 80.h,
                                // width: 75.h,
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                  color: ColorName.grayC4,
                                  borderRadius: BorderRadius.circular(8.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade50,
                                      spreadRadius: 1,
                                      blurRadius: 0,
                                      offset: Offset(0, 0),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      DateFormat('EEEE').format(days[index]),
                                      style: TextStyle(
                                        fontFamily: GoogleFonts.workSans().fontFamily,
                                      ),
                                    ),
                                    Text(
                                      days[index].day.toString(),
                                      style: TextStyle(
                                        fontSize: 24.sp,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: GoogleFonts.workSans().fontFamily,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 0.1.sw),
                child: Container(

                  child: Column(
                    children: [
                      GestureDetector(
                      onTap: () async {
                print("touched");
                final service = FlutterBackgroundService();
                var isRunning = await service.isRunning();
                if (isRunning) {
                  print('isRunning');


                } else {
                  print('isNotRunning');
                  service.startService();
                }


               // fetchHealthKit();

                setState(() {
                  status=!status;
                  service.invoke("stopService");
                  GetStorage().write(Constants.counterActivationSwitcherKey, status);

                });
                },
                        child: Container(
                          width: 0.39.sh,
                          height: 0.39.sh,
                          padding:EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color:status? Colors.red.shade200:
                            AppColors.darkGreen.withAlpha(100),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 13.h,
                              ),
                              Assets.png.m26.start.image(),
                            ],
                          )
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                      ),
                      Text(
                        stp,
                        style: GoogleFonts.outfit(
                          color: AppColors.purpleColor,
                          fontSize: 0.05.sh,

                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                "0",
                                  //  '0 Steps'.toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Text(
                                  feetLimit.toString()+" feet".toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            LinearPercentIndicator(
                              lineHeight: 8.0,
                              percent: (val/feetLimit),
                              backgroundColor:
                              Colors.black.withAlpha(30),
                              progressColor: AppColors.mainColor,
                              barRadius: Radius.circular(30),

                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 30),
                            ),
                            Text(
                              'Steps Taken'.toUpperCase(),
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Bebas',
                                fontSize: 0.025.sh,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'You walked 165 min today',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 0.015.sh,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 25,
                        color: Colors.grey[300],
                      ),

                      Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'STATUS',
                                    style: TextStyle(
                                      color: AppColors.purpleColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: _status,
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'CALORIES',
                                    style: TextStyle(
                                      color: AppColors.purpleColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:  GetStorage().read("cal").toString()??"___",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' cal',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    'POSITION',
                                    style: TextStyle(
                                      color: AppColors.purpleColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Tataouine",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        height: 25,
                        color: Colors.grey[300],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Jogging',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.workSans().fontFamily,
                  ),
                ),
              ),
              SizedBox(height: 11.h),
              Container(
                width: size.width,
                height: 0.15.sh,
                padding: EdgeInsets.symmetric(vertical: 30.sp),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xFF262626),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    JoggingItem(
                      icon: Iconsax.heart,
                      value:GetStorage().read("heartRate")??"___" ,
                      measure: 'BPM',
                    ),
                    JoggingItem(
                      icon: Iconsax.moon,
                      value: GetStorage().read("sleep")??"___",
                      measure: 'Min',
                    ),
                    JoggingItem(
                      icon: Icons.directions_run,
                      value: '5.20',
                      measure: 'Speed',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Health Status',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.workSans().fontFamily,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                width: size.width,
                height: 210.h,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorName.grayC4,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(CupertinoIcons.heart),
                                  SizedBox(height: 10),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        GetStorage().read("heartRate").toString()??"_ _ _",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        'bpm',
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Assets.png.m28.graph.image(),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      flex: 2,
                      child: Container(
                        // color: Colors.grey,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorName.grayC4,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                     GetStorage().read(Constants.stepsCounterValue).toString()??"___",
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: GoogleFonts.workSans().fontFamily,
                                          ),
                                        ),
                                        Text(
                                          'total steps',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontFamily: GoogleFonts.workSans().fontFamily,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Assets.png.m28.bar.image(
                                      width: 50.w,
                                      height: 50.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorName.grayC4,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                     GetStorage().read("cal").toString()??"___",
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: GoogleFonts.workSans().fontFamily,
                                          ),
                                        ),
                                        Text(
                                          'Calories',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontFamily: GoogleFonts.workSans().fontFamily,
                                          ),
                                        ),
                                      ],
                                    ),
                                    CircleAvatar(
                                      radius: 25.r,
                                      backgroundColor: Colors.black,
                                      child: CircleAvatar(
                                        radius: 23.r,
                                        backgroundColor: ColorName.grayC4,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20.w),
            ],
          ),
        ),
      ),

    );
  }
}

class JoggingItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String measure;

  const JoggingItem({
    Key? key,
    required this.icon,
    required this.value,
    required this.measure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          icon,
          color: Colors.white,
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontFamily: GoogleFonts.workSans().fontFamily,
          ),
        ),
        Text(
          measure,
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.white,
            fontFamily: GoogleFonts.workSans().fontFamily,
          ),
        ),
      ],
    );
  }
}

class GoalCard extends StatelessWidget {
  final int goalNumber;

  const GoalCard({
    Key? key,
    required this.goalNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      // height: 100,
      padding: EdgeInsets.all(25.w),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: ColorName.grayC4.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 30.r,
            backgroundColor: ColorName.grayC4,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Goals #$goalNumber',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: GoogleFonts.workSans().fontFamily,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Container(
                    height: 5,
                    width: 100,
                    decoration: BoxDecoration(
                      color: ColorName.grayC4,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 5,
                          width: 20,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '20% completed',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontFamily: GoogleFonts.workSans().fontFamily,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.more_vert),
              Icon(Icons.more_vert),
            ],
          )
        ],
      ),
    );
  }
}
