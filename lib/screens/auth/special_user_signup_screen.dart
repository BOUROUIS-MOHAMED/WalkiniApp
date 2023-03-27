import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import '../../utils/colors.dart';
import '../../widgets/appText.dart';
import '../../widgets/socialMediaCircle.dart';
import 'login_screen.dart';

class SpecialUserSignUpScreen extends StatefulWidget {
  const SpecialUserSignUpScreen({Key? key}) : super(key: key);

  @override
  State<SpecialUserSignUpScreen> createState() => _SpecialUserSignUpScreenState();
}

class _SpecialUserSignUpScreenState extends State<SpecialUserSignUpScreen> {
  bool passwordHideShowToggle = false;
  bool conditionChecker = false;


  TextEditingController LastNameFieldController = TextEditingController();
  TextEditingController FirstNameFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController phoneNumberFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  TextEditingController phoneNumberPrefixFieldController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  _showDevInformationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Center(child: Text('Dev information')),
            alignment: Alignment.center,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32.0))),
            content: SingleChildScrollView(
              child: Container(
                width: 0.9.sw,
                height: 0.5.sh,
                child: Container(),
              ),
            ));
      },
    );
  }
  bool isChart=false;
  @override
  Widget build(BuildContext context) {
    double safeArea = MediaQuery.of(context).padding.top;

    return   Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            children: [
              SizedBox(
                height: safeArea + 0.03.sh,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 0.05.sw),
                height: 1.sh - 0.04.sh - safeArea,
                width: 1.sw,
                child: Stack(
                  children: [
                    Positioned(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ////
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AppText(
                                        text: 'Are you a special user?',
                                        size: 0.035.sh,
                                        isBold: true,
                                        letterSpacing: 0.2,
                                      ),
                                      GestureDetector(
                                          onTap: ()=>_showDevInformationDialog(context),
                                          child: CircleAvatar(child: Icon(FontAwesomeIcons.info,color: Colors.black,size: 15,),radius: 15.r,backgroundColor: Colors.black.withOpacity(0.1),))

                                    ],
                                  ),
                                  SizedBox(height: 0.015.sh),

                                ]),
                            SizedBox(
                              height: 0.0.sh,
                            ),
                            Form(
                              key: formKey,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 0.03.sh),

                                    //
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              AppText(
                                                text: 'First Name',
                                                isBold: true,
                                              ),
                                              SizedBox(
                                                height: 0.008.sh,
                                              ),
                                              Container(
                                                width: 0.4.sw,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 1,
                                                        color: Colors.black
                                                            .withOpacity(0.2)),
                                                    borderRadius:
                                                    BorderRadius.circular(10)),
                                                child: TextFormField(
                                                  controller:
                                                  FirstNameFieldController,
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                      EdgeInsets.only(left: 15),
                                                      border: InputBorder.none,
                                                      hintText: 'Enter your FName'),
                                                  validator: ((value) {
                                                    if (value!.isEmpty) {
                                                      return 'Enter correct First Name';
                                                    } else {
                                                      return null;
                                                    }
                                                  }),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                            MainAxisAlignment.start,
                                            children: [
                                              AppText(
                                                text: 'Last Name',
                                                isBold: true,
                                              ),
                                              SizedBox(
                                                height: 0.008.sh,
                                              ),
                                              Container(
                                                width: 0.4.sw,
                                                height: 50,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 1,
                                                        color: Colors.black
                                                            .withOpacity(0.2)),
                                                    borderRadius:
                                                    BorderRadius.circular(10)),
                                                child: TextFormField(
                                                  controller: LastNameFieldController,
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                      EdgeInsets.only(left: 15),
                                                      border: InputBorder.none,
                                                      hintText: 'Enter your LName'),
                                                  validator: ((value) {
                                                    if (value!.isEmpty) {
                                                      return 'Enter correct Last Name';
                                                    } else {
                                                      return null;
                                                    }
                                                  }),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 0.01.sh),

                                    //
                                    AppText(
                                      text: 'Email Address',
                                      isBold: true,
                                    ),
                                    SizedBox(
                                      height: 0.008.sh,
                                    ),
                                    Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: Colors.black.withOpacity(0.2)),
                                          borderRadius: BorderRadius.circular(10)),
                                      child: TextFormField(
                                        controller: emailFieldController,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(left: 15),
                                            border: InputBorder.none,
                                            hintText: 'Enter your Email'),
                                        validator: ((value) {
                                          if (value!.isEmpty ||
                                              !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                                  .hasMatch(value)) {
                                            return 'Enter correct Email';
                                          } else {
                                            return null;
                                          }
                                        }),
                                      ),
                                    ),
                                    SizedBox(height: 0.03.sh),
                                    AppText(
                                      text: 'Phone Number',
                                      isBold: true,
                                    ),
                                    SizedBox(
                                      height: 0.008.sh,
                                    ),
                                    Row(
                                      children: [

                                        Container(
                                          width: 0.9.sw,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color:
                                                  Colors.black.withOpacity(0.2)),
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(15),
                                                  bottomRight: Radius.circular(15))),
                                          child: TextFormField(
                                            controller: phoneNumberFieldController,
                                            decoration: InputDecoration(
                                                contentPadding:
                                                EdgeInsets.only(left: 15),
                                                border: InputBorder.none,
                                                hintText: 'Enter your phone number'),
                                            validator: ((value) {
                                              if (value!.isEmpty ||
                                                  !RegExp(r'^[+]*[(]{0,1}[0-9][)]{0,1}[-\s\./0-9]+$')
                                                      .hasMatch(value)) {
                                                return 'Enter correct phone number';
                                              } else {
                                                return null;
                                              }
                                            }),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 0.03.sh),
                                    AppText(
                                      text: 'Chart or Organization ?',
                                      isBold: true,
                                    ),
                                    SizedBox(
                                      height: 0.008.sh,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              isChart=!isChart;
                                            });

                                          },
                                          child: Container(
                                            height: 0.06.sh,
                                            width: 0.4.sw,
                                            decoration: BoxDecoration(
                                              color: !isChart?AppColors.darkGreen:Colors.white,
                                                border: Border.all(
                                                    width: 1,
                                                    color:
                                                    Colors.black.withOpacity(1)),
                                                borderRadius:
                                                BorderRadius.circular(10)),
                                            child: Center(child: Text("CHARITY",style: TextStyle(fontSize: 0.025.sh,fontWeight: FontWeight.bold,color:!isChart?Colors.white:Colors.black),)),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 0.02.sw,
                                        ),
                                        GestureDetector(
                                          onTap: (){
                                            setState(() {
                                              isChart=!isChart;
                                            });

                                          },
                                          child: Container(
                                            height: 0.06.sh,
                                            width: 0.4.sw,
                                            decoration: BoxDecoration(
                                                color: isChart?AppColors.darkGreen:Colors.white,
                                                border: Border.all(
                                                    width: 1,
                                                    color:
                                                    Colors.black.withOpacity(1)),
                                                borderRadius:
                                                BorderRadius.circular(10)),
                                            child: Center(child: Text("ORGANIZATION",style: TextStyle(fontSize: 0.025.sh,fontWeight: FontWeight.bold,color:isChart?Colors.white:Colors.black),)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 0.01.sh,
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
                                            value: conditionChecker,
                                            side: BorderSide(
                                                color: AppColors.purpleColor),
                                            checkColor: Colors.white,
                                            activeColor: AppColors.purpleColor,
                                            onChanged: ((newvalue) {
                                              setState(() {
                                                conditionChecker = newvalue!;
                                              });
                                            })),
                                        AppText(
                                          text: 'I agree to the terms and conditions',
                                          letterSpacing: -0.8,
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 0.02.sh,
                                    ),
                                    Center(
                                      child: GestureDetector(
                                        onTap: () {
                                          if (emailFieldController.text.isEmpty ||
                                              phoneNumberFieldController
                                                  .text.isEmpty ||
                                              passwordFieldController.text.isEmpty ||
                                              FirstNameFieldController.text.isEmpty ||
                                              LastNameFieldController.text.isEmpty) {
                                            Get.snackbar(
                                              "Error:Field Management",
                                              'Please try to fill all the fields and try again',
                                              colorText: AppColors.darkGreen,
                                              backgroundColor: AppColors.appGreen,
                                              overlayBlur: 0,
                                              forwardAnimationCurve: Curves.bounceOut,
                                            );
                                          } else if (conditionChecker == false) {
                                            Get.snackbar(
                                              "Error:Invalid Terms and Conditions",
                                              'Please read our terms and condition then accept it',
                                              colorText: AppColors.darkGreen,
                                              backgroundColor: AppColors.appGreen,
                                              overlayBlur: 0,
                                              forwardAnimationCurve: Curves.bounceOut,
                                            );
                                          } else {
                                            GetStorage().write('usermail',
                                                emailFieldController.text);
                                            GetStorage().write('userpassword',
                                                passwordFieldController.text);
                                            print("done");
                                          }
                                        },
                                        child: Container(
                                          height: 50,
                                          width: 0.9.sw,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(7),
                                              color: AppColors.darkGreen),
                                          child: Center(
                                              child: AppText(
                                                text: 'Sign Up',
                                                textColor: Colors.white,
                                                size: 0.045.sw,
                                              )),
                                        ),
                                      ),
                                    ),



                                  ],
                                ),
                              ),
                            )

                            ////
                          ]),
                    ),
                    Positioned(
                      bottom: 0.02.sh,
                      left: 0,
                      right: 0,
                      child: Center(
                          child: Column(
                            children: [
                              Container(
                                width: 0.8.sw,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AppText(
                                      text: "Already have an account? ",
                                      size: 0.018.sh,
                                      wordSpacing: 0.5,
                                      textColor:
                                      Colors.black87.withOpacity(0.5),
                                      letterSpacing: 0,
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(builder: (_) =>  LoginScreen()),
                                              (route) => false),
                                      child: Container(
                                        padding: EdgeInsets.all(0.009.sh),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10.r),
                                            border: Border.all(
                                                width: 1,
                                                color: AppColors.darkGreen)),
                                        child: AppText(
                                          text: 'Login',
                                          isBold: true,
                                          textColor: AppColors.darkGreen,
                                          size: 0.019.sh,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
