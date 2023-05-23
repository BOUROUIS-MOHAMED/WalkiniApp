import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:start_up_project/screens/on_boarding_screens/on_boarding_screen.dart';
import 'package:start_up_project/screens/tab%20Bar/mainScreen.dart';
import 'package:start_up_project/widgets/showAwesomeSnackBar.dart';

import '../constants.dart';
import '../utils/colors.dart';

class MainRouteDetectorScreen extends StatefulWidget {
   MainRouteDetectorScreen({Key? key,required this.waitingDuration}) : super(key: key);
Duration waitingDuration=Duration(seconds: 0);
  @override
  State<MainRouteDetectorScreen> createState() => _MainRouteDetectorScreenState();
}

class _MainRouteDetectorScreenState extends State<MainRouteDetectorScreen> {

  searchRoute() async{
    print("waiting");
   await Future.delayed(widget.waitingDuration);
    final onBoarding=GetStorage().hasData(Constants.userAlreadyOpenTheAppForTheFirstTimeKey);
    if(onBoarding){
      final userLoggedIn=GetStorage().hasData(Constants.TOKEN);
      if(userLoggedIn){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => BottomTabBarScreen(),));
      }else{
        showNormalSnackBar(context, "you need to log in first", Colors.blueGrey, Colors.white);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnBoardingScreen(),));
      }
    }else{
Navigator.of(context).push(MaterialPageRoute(builder: (context) => OnBoardingScreen(),));
    }
  }


  @override
  Widget build(BuildContext context) {
searchRoute();
    return Scaffold(
        body: GestureDetector(
          onTap: ()=>showNormalSnackBar(context, "you need to log in first", Colors.blueGrey, Colors.white),
          child: Center(
          child: LoadingAnimationWidget.discreteCircle(
          size: 0.2.sh, color: AppColors.mainColor,
    ),
    ),
        ));
  }
}
