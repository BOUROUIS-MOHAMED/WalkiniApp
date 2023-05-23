import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:start_up_project/controllers/auth_controller.dart';
import 'package:start_up_project/models/normal_user_model.dart';
import 'package:start_up_project/screens/auth/additionalData/genderSelectorScreen.dart';
import 'package:start_up_project/screens/auth/login_screen.dart';
import 'package:start_up_project/screens/auth/special_user_signup_screen.dart';

import '../../utils/colors.dart';
import '../../widgets/appText.dart';
import '../../widgets/showAwesomeSnackBar.dart';
import '../../widgets/socialMediaCircle.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool passwordHideShowToggle = false;
  bool conditionChecker = false;


  TextEditingController lastNameFieldController = TextEditingController();
  TextEditingController firstNameFieldController = TextEditingController();
  TextEditingController emailFieldController = TextEditingController();
  TextEditingController phoneNumberFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();

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
                child: CircularProgressIndicator(),
          ),
        ));
      },
    );
  }

  bool isLoading=false;

  @override
  Widget build(BuildContext context) {
    double safeArea = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          
          SingleChildScrollView(
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
                                            text: 'Create Account',
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
                                      GestureDetector(
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => SpecialUserSignUpScreen(),));
                                        },
                                        child: AppText(
                                          text: "Special User? Touch me",
                                          textColor: Colors.black54,
                                          isBold: false,
                                          letterSpacing: 0,
                                          wordSpacing: 0,
                                        ),
                                      ),
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
                                                      firstNameFieldController,
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
                                                      controller: lastNameFieldController,
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
                                          text: 'Password',
                                          isBold: true,
                                        ),
                                        SizedBox(
                                          height: 0.008.sh,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: 0.06.sh,
                                              width: 0.7.sw,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color:
                                                      Colors.black.withOpacity(0.2)),
                                                  borderRadius:
                                                  BorderRadius.circular(10)),
                                              child: TextFormField(
                                                obscureText: !passwordHideShowToggle,
                                                controller: passwordFieldController,
                                                decoration: InputDecoration(
                                                    contentPadding:
                                                    EdgeInsets.only(left: 0.04.sw),
                                                    border: InputBorder.none,
                                                    hintText: 'Enter your password'),
                                                validator: ((value) {
                                                  if (value!.isEmpty) {
                                                    return 'Enter correct password';
                                                  } else {
                                                    return null;
                                                  }
                                                }),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 0.02.sw,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  passwordHideShowToggle =
                                                  !passwordHideShowToggle;
                                                });
                                              },
                                              child: Container(
                                                height: 0.06.sh,
                                                width: 0.06.sh,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 1,
                                                        color: Colors.black
                                                            .withOpacity(0.2)),
                                                    borderRadius:
                                                    BorderRadius.circular(10)),
                                                child: Icon(
                                                  passwordHideShowToggle
                                                      ? Icons.visibility_off_outlined
                                                      : Icons.remove_red_eye_outlined,
                                                  color: AppColors.darkGreen,
                                                ),
                                              ),
                                            )
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
    firstNameFieldController.text.isEmpty ||
    lastNameFieldController.text.isEmpty) {
    Get.snackbar(
    "Error:Field Management",
    'Please try to fill all the fields and try again',
    colorText: Colors.white,
    backgroundColor: Colors.black,
    overlayBlur: 0,
    padding: EdgeInsets.all(0.03.sh),
    margin: EdgeInsets.all(10),
    forwardAnimationCurve: Curves.bounceOut,

    );
    } else if (conditionChecker == false) {
    Get.snackbar(
    "Error:Invalid Terms and Conditions",
    'Please read our terms and condition then accept it',
          colorText: Colors.white,
          backgroundColor: Colors.black,
          overlayBlur: 0,
          padding: EdgeInsets.all(0.03.sh),
          margin: EdgeInsets.all(10),
    forwardAnimationCurve: Curves.bounceOut,
    );
    } else {

    registration();

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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 0.25.sw,
                                        height: 1,
                                        color: Colors.grey.withOpacity(0.5),
                                      ),
                                      AppText(
                                        text: 'Or SignUp With',
                                        size: 0.015.sh,
                                      ),
                                      Container(
                                        width: 0.25.sw,
                                        height: 1,
                                        color: Colors.grey.withOpacity(0.5),
                                      ),
                                    ],
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SocialMediaCircle(icon: Icon(FontAwesomeIcons.facebook,color: Colors.cyan,)),

                                      SizedBox(
                                        width: 0.02.sw,
                                      ),
                                      Theme.of(context).platform ==
                                          TargetPlatform.android
                                          ?     SocialMediaCircle(icon: Icon(FontAwesomeIcons.google,color: Colors.grey,))
                                          :
                                      //
                                      SocialMediaCircle(icon: Icon(FontAwesomeIcons.apple,color: Colors.black,)),

                                    ],
                                  ),

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
         isLoading? Container(width: 1.sw,height: 1.sh,color: Colors.black.withOpacity(0.7),):Container(),
         isLoading? Center(
            child: Container(
              width: 0.05.sh,
              height: 0.05.sh,
              child: CircularProgressIndicator(

              ),
            ),
          ):Container()
        ],
      ),
    );
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }


  Future<void> registration() async {
   String lastNameFieldText=lastNameFieldController.text;
   String firstNameFieldText=firstNameFieldController.text;
   String emailFieldText=emailFieldController.text;
   String phoneFieldText=phoneNumberFieldController.text;
   String passwordFieldText=passwordFieldController.text;
   setState(() {
     isLoading=true;
   });
   BooleanServerAnswer userAllowedToCreateAccount=
   await Get.find<AuthController>().checkUserExist(emailFieldText, phoneFieldText);

  setState(() {
     isLoading=false;
   });

   if (userAllowedToCreateAccount==BooleanServerAnswer.no) {
     print("new allowed");
     NormalUserModel profileModel =
     NormalUserModel(
       firstName: firstNameFieldText,
       lastName: lastNameFieldText,
       email: emailFieldText,
       secretPassword: passwordFieldText,
       phoneNumber: phoneFieldText,
     );
   Navigator.of(context).push(MaterialPageRoute(builder: (context) => GenderSelectorScreen(profileModel: profileModel),));
   }  else if(userAllowedToCreateAccount==BooleanServerAnswer.yes){
     showAwesomeSnackBar(context, "Ouups", "This user already exist!try again or contact the support", Colors.redAccent, Colors.red);
   }else{
     showAwesomeSnackBar(context, "Ouups", "Error,please try again later or contact the support", Colors.redAccent, Colors.red);
     print("not allowed");
   }

  }



}
