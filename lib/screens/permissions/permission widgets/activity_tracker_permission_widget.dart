import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health/health.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:start_up_project/screens/permissions/permission%20widgets/location_permission_widget.dart';

import '../../../utils/colors.dart';

class ActivityTrackerPermissionWidget extends StatefulWidget {
  const ActivityTrackerPermissionWidget({
    super.key,
  });


  @override
  State<ActivityTrackerPermissionWidget> createState() => _ActivityTrackerPermissionWidgetState();
}

class _ActivityTrackerPermissionWidgetState extends State<ActivityTrackerPermissionWidget> {
  HealthFactory health = HealthFactory();
  var types = [
    HealthDataType.STEPS,
    HealthDataType.BLOOD_GLUCOSE,

  ];
  var v=[
    HealthDataType.ACTIVE_ENERGY_BURNED
  ];
  request() async {
    types = [
      HealthDataType.STEPS,
      HealthDataType.BLOOD_GLUCOSE,
      HealthDataType.ACTIVE_ENERGY_BURNED,
      HealthDataType.BLOOD_OXYGEN,
      HealthDataType.BODY_MASS_INDEX,
      HealthDataType.HEIGHT,
      HealthDataType.WEIGHT,
      HealthDataType.SLEEP_ASLEEP,
      HealthDataType.SLEEP_AWAKE,
      HealthDataType.SLEEP_IN_BED,
      HealthDataType.HEART_RATE
    ];

    var permissions = [
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE,
      HealthDataAccess.READ_WRITE,
    ];

    await health.requestAuthorization(types,permissions: permissions);
checkGoogleFitPermissionStatus();
  }
  var now = DateTime.now();

init() async {
  sensorPermissionStatus= await getMotionPermission().status.isGranted;
  checkGoogleFitPermissionStatus();
}
@override
  void initState()  {
init();
    super.initState();
  }
  bool  googleFitPermissionStatus=false;
  bool  sensorPermissionStatus=false;

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: init(),
      builder: (context, snapshot)
       {
        return SafeArea(

          child: Scaffold(

            backgroundColor: AppColors.appWhite,
            body: Container(
              height: 1.sh,
              width: 1.sw,
              child: Stack(

                children: [
                  LinearProgressBar(
                    maxSteps: 3,
                    progressType: LinearProgressBar.progressTypeLinear,
                    // Use Linear progress
                    currentStep: 1,
                    progressColor: AppColors.appGreen,
                    minHeight: 0.01.sh,
                    backgroundColor: Colors.grey,
                  ),
              Stack(
                children: [
                  Positioned(
                    top: 0.2.sh,
                    child: Container(
                      height: 0.5.sh,
                      width: 1.sw,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.directions_run_rounded,
                            color: Colors.deepOrangeAccent,
                            size: 0.12.sh,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'We need \nActivity Tracker Permission',
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.outfit(
                                    color: Color(0xFF090F13),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text(
                                    'We need this permission to track your steps!\n'
                                        'or just give us the ability to access \n \nGoogle Fit Data '
                                    ,
                                    textAlign: TextAlign.center,
                                    style:
                                    GoogleFonts.outfit(
                                      color: Color(0xFF7C8791),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.05.sh,
                    left: 20,
                    right: 20,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Container(
                        width: 0.4.sw,
                        height: 0.07.sh,
                        child: OutlinedButton(
                          child: Text("Continue",style:  GoogleFonts.lexendDeca(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),),
                          style: ButtonStyle(
                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25)))),
                            backgroundColor:MaterialStatePropertyAll(AppColors.mainColor),



                          ),
                          onPressed: () async {

                            String msg=(sensorPermissionStatus==false && googleFitPermissionStatus==false)?
                            "you cant use the full version of our application if you don't accept this permission":
                            (sensorPermissionStatus==false && googleFitPermissionStatus==true)?
                            "we need to get access to your perimeter sensor":
                            (sensorPermissionStatus==true && googleFitPermissionStatus==false)?
                            "for more details we need the access of your Google Fit data":
                            "";

                            if(sensorPermissionStatus==true && googleFitPermissionStatus==true){
                              print('heh');
Navigator.of(context).push(MaterialPageRoute(builder: (context) => LocationPermissionWidget(),));
                            }else{
                              showAlertDialog(context,msg);
                            }


                          },



                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0.13.sh,
                    left: 20,
                    right: 20,
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 0.4.sw,
                            height: 0.07.sh,
                            child: OutlinedButton(
                              child: Text("Google fit",style:  GoogleFonts.lexendDeca(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),),
                              style: ButtonStyle(
                                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25)))),
                                backgroundColor:MaterialStatePropertyAll(googleFitPermissionStatus?AppColors.darkGreen: Colors.redAccent),
                              ),
                              onPressed: () {
                                request();
                                print('Button pressed ...');
                              },


                            ),
                          ),
                          Container(
                            width: 0.4.sw,
                            height: 0.07.sh,
                            child: OutlinedButton(
                              child: Text("Feet Sensor",style:  GoogleFonts.lexendDeca(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),),
                              style: ButtonStyle(
                                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25)))),
                                backgroundColor:MaterialStatePropertyAll( sensorPermissionStatus?AppColors.darkGreen: Colors.redAccent),
                              ),
                              onPressed: () async {
                                permissionHandler();

                              },


                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              )
                ],
              ),
            ),
          ),
        );
      }
    );


  }

  Permission getMotionPermission() {
    if(Platform.isAndroid /** Also check if SDK >= 29 **/){
      return Permission.activityRecognition;
    } else if(Platform.isIOS) {
      return Permission.sensors;
    }
    return Permission.activityRecognition;
  }

  Future<void> permissionHandler() async {
    var status = await getMotionPermission().status;
    if (status.isGranted) {
      setState(() {
        sensorPermissionStatus=true;
      });
    }else{
      setState(() async {
        sensorPermissionStatus=false;
        await getMotionPermission().request();
        openAppSettings();
      });
    }

// You can can also directly ask the permission about its status.

  }
  Future<void> checkGoogleFitPermissionStatus()async {


      List<HealthDataPoint> healthData= await health.getHealthDataFromTypes(now.subtract(Duration(days: 1)), now,types);
    if(healthData.isEmpty){
      setState(() {
        googleFitPermissionStatus=false;
      });
    }else{
      setState(() {
        googleFitPermissionStatus=true;
      });

    }
  }
  showAlertDialog(BuildContext context,String msg) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Skip",style: GoogleFonts.outfit(
        fontSize: 0.013.sh
      ),),
      onPressed:  () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = Container(

      child: Container(
        width: 0.6.sw,
        
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.green),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))
            ))
          ),
          child: Text("Continue"),
          onPressed:  () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(

      title: Text("Warning"),
      content: Text(msg),

      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}