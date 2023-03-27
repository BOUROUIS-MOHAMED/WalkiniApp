
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:start_up_project/screens/auth/forgot_password_screen.dart';
import 'package:start_up_project/screens/auth/otpSender.dart';
import 'package:start_up_project/screens/checkout/checkout_screen.dart';
import 'package:start_up_project/screens/home.dart';
import 'package:start_up_project/screens/on_boarding_screens/on_boarding_screen.dart';
import 'package:start_up_project/screens/permissions/permission%20widgets/activity_tracker_permission_widget.dart';


import 'package:start_up_project/screens/tab%20Bar/mainScreen.dart';
import 'package:start_up_project/subscription_reminder_screen.dart';


import 'constants.dart';

void main() async{
  await GetStorage.init();



  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp( MyApp());
  });
}
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';

  @override
  void initState() {
    super.initState();
   /* initPlatformState();*/
  }

/*
  void onStepCount(StepCount event) {
    print(event);
    setState(() {
      _steps = event.steps.toString();
      GetStorage().write("steps", _steps);
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    print(event);
    setState(() {
      _status = event.status;
      GetStorage().write("pedestrianStatus", _status);
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
  }*/
  @override
  Widget build(BuildContext context) {
 /* permissionHandler();*/
    return ScreenUtilInit(
        designSize: const Size(423, 925),
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (context, child) {
        {

          return MaterialApp(
            title: 'Auth Screen 1',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.light,
              primaryColor: kPrimaryColor,

              textTheme: TextTheme(

                button: TextStyle(color: kPrimaryColor),
                headline1:
                TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
              ),
              inputDecorationTheme: InputDecorationTheme(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white.withOpacity(.2),
                  ),
                ),
              ),
            ),
            home:SubscriptionReminderScreen()

            //AuthMainScreen(),
          );
        }
      });
  }
}
