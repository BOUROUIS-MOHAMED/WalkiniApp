import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:start_up_project/controllers/auth_controller.dart';
import 'package:start_up_project/models/profile_additional_information_model.dart';
import 'package:start_up_project/models/profile_model.dart';
import 'package:start_up_project/screens/auth/additionalData/trial_version_screen.dart';
import 'package:start_up_project/utils/colors.dart';
import 'package:start_up_project/widgets/showAwesomeSnackBar.dart';
class LoadingScreen extends StatefulWidget {
   LoadingScreen({Key? key,required this.profileModel,required this.profileAdditionalInformationModel}) : super(key: key);
  ProfileModel profileModel = ProfileModel();
  ProfileAdditionalInformationModel profileAdditionalInformationModel=ProfileAdditionalInformationModel();

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}
class _LoadingScreenState extends State<LoadingScreen> {

  Future registerUser() async {
    print(widget.profileAdditionalInformationModel.toJson());
    var pAI = await Get.find<AuthController>().registrationTheAdditionalInformation(widget.profileAdditionalInformationModel);
    if (pAI.thereIsAnError==false) {
      int id=int.parse( pAI.message!);
      widget.profileModel.banDetails="";
      widget.profileModel.banned=false;
      widget.profileModel.banDuration=Duration.zero;
      widget.profileModel.boosts="";
      widget.profileModel.boxes="";
      widget.profileModel.coinBalance="";
      widget.profileModel.coupons="";
      widget.profileModel.emeraldBalance="";
      widget.profileModel.inbox="";
      widget.profileModel.lastMembershipActivationDate=null;
      widget.profileModel.latitude=00.00;
      widget.profileModel.longitude=00.00;
      widget.profileModel.partner=false;
      widget.profileModel.places="";
      widget.profileModel.reviewsId="";
      widget.profileModel.totalSteps="";
      widget.profileModel.secretKey="";
      widget.profileModel.score="5";
      widget.profileModel.additionalInformationId=id;
      widget.profileModel.createdAt=DateTime.now();
      widget.profileModel.modifiedAt=DateTime.now();
      print(widget.profileModel.toJson());
      var conn = await Get.find<AuthController>().registration(widget.profileModel);
      if (conn.thereIsAnError==false) {
        showAwesomeSnackBar(context, "Done", "User Created", AppColors.mainColor, AppColors.darkGreen);
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => TrialVersionScreen(),));
        print("user registered successfully");
      }else{
        print("there is a problem");
      }
    }



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