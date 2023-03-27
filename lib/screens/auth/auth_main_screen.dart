import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:start_up_project/screens/auth/login_screen.dart';

import '../../constants.dart';

class AuthMainScreen extends StatefulWidget {
  const AuthMainScreen({Key? key}) : super(key: key);

  @override
  State<AuthMainScreen> createState() => _AuthMainScreenState();
}

class _AuthMainScreenState extends State<AuthMainScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Column(
        children: <Widget>[

          Expanded(
              flex: 3,
              child:
              Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.15.sh),
                    bottomRight: Radius.circular(0.4.sh)
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/auth_page/5.jpeg"),
                    fit: BoxFit.cover,

                  ),
                ),
              )


          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding:  EdgeInsets.only(top: 0.01.sh),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [

                        TextSpan(
                          text: Constants.appName,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        TextSpan(
                          text:"\n",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        TextSpan(
                            text: "${Constants.appNameQuote}",
                            style: Theme.of(context).textTheme.subtitle1


                        ),
                      ],
                    ),
                  ),
                  FittedBox(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 0.03.sh),
                        padding:
                        EdgeInsets.symmetric(horizontal: 0.1.sw, vertical: 0.01.sh),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.r),
                          color: kPrimaryColor,
                        ),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Login",
                              style: Theme.of(context).textTheme.button?.copyWith(
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
