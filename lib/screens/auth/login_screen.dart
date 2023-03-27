import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:start_up_project/screens/auth/signup_screen.dart';
import 'package:start_up_project/screens/home%20Page/home_page.dart';
import 'package:start_up_project/widgets/socialMediaCircle.dart';

import '../../utils/colors.dart';
import '../../widgets/appText.dart';
import 'forgetpw_screen.dart';



class LoginScreen extends StatefulWidget {
  LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool passwordHideShowToggle = false;
  bool conditionChecker = false;
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
                child: Container()),
          ),
        );
      },
    );
  }

  TextEditingController emailFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();
  String _email = '';
  bool _isValid = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double safeArea = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: 1.sw,
          height: 1.sh,
          child: Stack(
            children: [
              Positioned(
                child: Column(
                  children: [
                    SizedBox(
                      height: safeArea + 0.03.sh,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 0.05.sw),
                      height: 1.sh - 0.04.sh - safeArea,
                      width: 1.sw,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ////
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          AppText(
                                            text: 'Yo ,Welcome Back!',
                                            size: 0.03.sh,
                                            isBold: true,
                                            letterSpacing: 0.2,
                                          ),
                                          Container(
                                            height: 0.07.sh,
                                            width: 0.07.sh,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/emoji/two hand.png'))),

                                          )
                                        ],
                                      ),
                                      GestureDetector(
                                          onTap: ()=>_showDevInformationDialog(context),
                                          child: CircleAvatar(child: Icon(FontAwesomeIcons.info,color: Colors.black,size: 15,),radius: 15.r,backgroundColor: Colors.black.withOpacity(0.1),))
                                    ],
                                  ),
                                  SizedBox(height: 0.0.sh),
                                  AppText(
                                    text: "Hello again, you've been missed!",
                                    size: 0.018.sh,
                                    textColor: Colors.black54,
                                    isBold: false,
                                    letterSpacing: -0.5,
                                    wordSpacing: 0,
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
                                    SizedBox(height: 0.06.sh),
                                    AppText(
                                      text: 'Email',
                                      isBold: true,
                                    ),
                                    SizedBox(
                                      height: 0.008.sh,
                                    ),
                                    Container(
                                      width: 0.9.sw,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1,
                                              color: Colors.black.withOpacity(0.2)),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(10))),
                                      child: TextFormField(
                                        controller: emailFieldController,
                                        decoration: InputDecoration(
                                            contentPadding: EdgeInsets.only(left: 15),
                                            border: InputBorder.none,
                                            hintText: 'Enter your email'),
                                        validator: ((value) {
                                          if (value!.isEmpty) {
                                            return "Don't let the email field empty";
                                          } else {
                                            return null;
                                          }
                                        }),
                                        onChanged: (value) => {
                                          setState(() {
                                            _isValid = EmailValidator.validate(value);
                                          }),
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(_isValid ? '' : 'Email is not valid.',style: TextStyle(
                                        color: Colors.red
                                      ),),
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
                                        GestureDetector(
                                          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgetPwScreen(),)),
                                          child: AppText(
                                            text: 'Remember me',
                                            letterSpacing: -0.8,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 0.02.sh,
                                    ),
                                    GestureDetector(
                                      onTap: () {},
                                      child: Center(
                                        child: Container(
                                          height: 50,
                                          width: 0.9.sw,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(7),
                                              color: AppColors.darkGreen),
                                          child: Center(
                                              child: AppText(
                                                text: 'Login',
                                                textColor: Colors.white,
                                                size: 0.045.sw,
                                              )),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 0.03.sh),


                                  ],
                                ),
                              ),
                            )

                            ////
                          ]),
                    ),
                  ],
                ),
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
                              text: 'Or Login With',
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
                            GestureDetector(
                              onTap:(){

                              },
                              child: SocialMediaCircle(icon: Icon(FontAwesomeIcons.facebook,color: Colors.cyan,
                              )),
                            ),

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
                                text: "Don't have an account yet? ",
                                size: 0.018.sh,
                                wordSpacing: 0.5,
                                textColor:
                                Colors.black87.withOpacity(0.5),
                                letterSpacing: 0,
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (_) =>  SignUpScreen()),
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
                                    text: 'Sign up',
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
      ),
    );
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }


}