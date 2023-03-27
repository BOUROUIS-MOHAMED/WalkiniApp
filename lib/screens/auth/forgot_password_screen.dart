import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_input_field.dart';



class ForgetPwScreen extends StatelessWidget {
  static const routeName = "/restpwScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1.sw,
        height: 1.sh,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 30,
            ),
            child: Column(
              children: [
                Text(
                  "Reset Password",
                  style: Theme.of(context).textTheme.headline5,
                ),
                SizedBox(height: 0.07.sh,),
                Text(
                  "Please enter your email to recieve a link to create a new password via email",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 0.05.sh,),
                CustomTextInput(hintText: "Email"),
                SizedBox(height: 0.02.sh,),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30))
                    ),
                    child: ElevatedButton(
style: ButtonStyle(
  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(30))
  ))
),
                      onPressed: () {
                     /*   Navigator.of(context)
                            .pushReplacementNamed(SendOTPScreen.routeName);
                     */ },

                      child: Text("Send"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}