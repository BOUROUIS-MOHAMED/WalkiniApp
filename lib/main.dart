
import 'dart:convert';
import 'dart:ui';

import 'package:background_fetch/background_fetch.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:json_theme/json_theme.dart';
import 'package:pedometer/pedometer.dart';
import 'package:provider/provider.dart';
import 'package:start_up_project/PartnerWalletPage.dart';
import 'package:start_up_project/firebase_options.dart';

import 'package:start_up_project/models/normal_user_model.dart';
import 'package:start_up_project/noti.dart';
import 'package:start_up_project/screens/auth/additionalData/image_picker_screen.dart';
import 'package:start_up_project/screens/auth/signup_screen.dart';
import 'package:start_up_project/screens/box_screen.dart';
import 'package:start_up_project/screens/home%20Page/home_page.dart';
import 'package:start_up_project/screens/settings/setting_main_page.dart';
import 'package:start_up_project/screens/tab%20Bar/mainScreen.dart';
import 'package:start_up_project/screens/tracker/TrackerMainScreen.dart';
import 'package:start_up_project/screens/tracker/WorkoutStartScreen.dart';
import 'package:start_up_project/screens/tracker/page_24.dart';
import 'package:start_up_project/screens/tracker/page_27.dart';
import 'package:start_up_project/screens/white_screen.dart';
import 'package:start_up_project/utils/model_theme.dart';
import 'BranchScreen.dart';
import 'helper/dependencies.dart' as dep;

import 'constants.dart';


@pragma('vm:entry-point')
void backgroundFetchHeadlessTask(HeadlessTask task) async {
  String taskId = task.taskId;
  bool isTimeout = task.timeout;
  if (isTimeout) {
    print("[BackgroundFetch] Headless task timed-out: $taskId");
    BackgroundFetch.finish(taskId);
    return;
  }
  print('[BackgroundFetch] Headless event received.');
  // Do your work here...
  BackgroundFetch.finish(taskId);
}


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final themeL=await rootBundle.loadString('assets/lightThemeMode.json');
  final themeJsonL =jsonDecode(themeL) ;
  final themeD=await rootBundle.loadString('assets/darkThemeMode.json');
  final themeJsonD =jsonDecode(themeD) ;
  final darkTheme=ThemeDecoder.decodeThemeData(themeJsonD);
  final lightTheme=ThemeDecoder.decodeThemeData(themeJsonL);
  BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform) ;
  await dep.init();
  await GetStorage.init();

  await Notifi.initialise(flutterLocalNotificationsPlugin);
  await TrackerMainScreen.initializeService();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    FlutterNativeSplash.remove();

    runApp( MyApp(darkTheme: darkTheme!,lightTheme: lightTheme!,));
  });





}
class MyApp extends StatefulWidget {
  final ThemeData darkTheme;
  final ThemeData lightTheme;

  const MyApp({super.key, required this.darkTheme, required this.lightTheme, });
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
 /* permissionHandler();*/
    return ScreenUtilInit(
        designSize: const Size(423, 925),
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (context, child) {
        {

          return ChangeNotifierProvider(
              create: (_) => ModelTheme(),
            child: Consumer<ModelTheme>(
              builder: (context, ModelTheme themeNotifier, child) {
                return GetMaterialApp(
                  title: 'Auth Screen 1',
                  debugShowCheckedModeBanner: false,
                    theme: themeNotifier.isDark
                        ? widget.darkTheme
                        : widget.lightTheme,
                 // initialRoute: RouteHelper.getOnBoardingScreen(),
                //  getPages: RouteHelper.routes,
                  home: BottomTabBarScreen()
                  //BoxMainScreen()

                  //AuthMainScreen(),
                );
              }
            ),
          );
        }
      });
  }
}
