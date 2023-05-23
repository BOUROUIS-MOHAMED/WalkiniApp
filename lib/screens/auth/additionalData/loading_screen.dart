import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:start_up_project/controllers/auth_controller.dart';

import 'package:start_up_project/models/normal_user_model.dart';
import 'package:start_up_project/screens/auth/additionalData/trial_version_screen.dart';
import 'package:start_up_project/utils/colors.dart';
import 'package:start_up_project/widgets/showAwesomeSnackBar.dart';
class LoadingScreen extends StatefulWidget {
   LoadingScreen({Key? key,required this.profileModel,this.file}) : super(key: key);
  NormalUserModel profileModel = NormalUserModel();
  File? file;


  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}
class _LoadingScreenState extends State<LoadingScreen> {

  Future registerUser() async {
    var Im= await Get.find<AuthController>().uploadProfileImage(widget.file!,"94970082");
    if(Im.thereIsAnError!){
      showAwesomeSnackBar(context, "Error", Im.message!, Colors.cyan, Colors.cyanAccent);
    }else{
      showAwesomeSnackBar(context, "Error", Im.message!, Colors.cyan, Colors.cyanAccent);
      widget.profileModel.adBlocker=false;
      widget.profileModel.emeraldBalance=0.0;
      widget.profileModel.receivedNotification="";
      widget.profileModel.totalSteps="0";
      widget.profileModel.image=Im.message;
      widget.profileModel.inbox="";
      widget.profileModel.places="";
      final deviceInfoPlugin = DeviceInfoPlugin();
      final deviceInfo = await deviceInfoPlugin.deviceInfo;
      final allInfo = deviceInfo.data;
      widget.profileModel.phoneType=allInfo['product']??"unknown";
      widget.profileModel.score="5";
      widget.profileModel.seenInbox="";
      widget.profileModel.longitude=null;
      widget.profileModel.latitude=null;
      widget.profileModel.lastMembershipActivationDate="";
      widget.profileModel.logs="";
      widget.profileModel.membership=null;
      widget.profileModel.workouts="";
      widget.profileModel.completedWorkouts="";
      widget.profileModel.coinBalance=0.0;
      widget.profileModel.createdAt=DateTime.now().toString();
      widget.profileModel.coupons="";
      widget.profileModel.badges="";
      widget.profileModel.banInfo=null;
      widget.profileModel.banInfo=null;
      widget.profileModel.banned=false;
      widget.profileModel.badges="";
      widget.profileModel.boosts="";
      print(widget.profileModel.toJson());
      var conn = await Get.find<AuthController>().registration(widget.profileModel);
      if (conn.thereIsAnError==false) {


          Navigator.of(context).push(MaterialPageRoute(builder: (context) => TrialVersionScreen(),));
          print("user registered successfully");





      }else{
        print("there is a problem");
      }

    }
/*


    var Im= await Get.find<AuthController>().uploadProfileImage(widget.file!, widget.profileModel.phoneNumber!);
    if (true) {


    }


*/

  }

  @override
  Widget build(BuildContext context) {
    registerUser();
    return Scaffold(
        body: Center(
          child: LoadingAnimationWidget.halfTriangleDot(
          size: 0.2.sh, color: AppColors.mainColor,
          ),
        )
    );
  }

}