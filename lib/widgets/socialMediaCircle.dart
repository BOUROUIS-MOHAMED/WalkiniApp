import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:start_up_project/screens/home%20Page/home_page.dart';

class SocialMediaCircle extends StatelessWidget {
   final Icon icon ;


   SocialMediaCircle({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  IconButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) =>  HomePage()),
                (route) => false);
      },
      icon: icon,

    );
  }
}
