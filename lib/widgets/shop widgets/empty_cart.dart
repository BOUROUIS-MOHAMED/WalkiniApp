import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.opencart,size: 0.2.sh,),
                Text("Oups",style: GoogleFonts.outfit(fontSize: 0.05.sh)),
                    Text("You don't have any thing "
                        "in your cart yet!\n"
                        "check something in our shop",style: GoogleFonts.robotoSlab(fontSize: 0.03.sh)),
              ],
            ),
          )),
        ),

      ],
    );
  }
}
