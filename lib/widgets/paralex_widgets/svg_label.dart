import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../utils/colors.dart';

class SvgLabel extends StatelessWidget {
   const SvgLabel({Key? key, 
    required this.assetName,
    required this.label,
  }) : super(key: key);

  final String assetName;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SvgPicture.asset(
        assetName,
      ),
      const SizedBox(height: 22.0),
      Text(
        label.toUpperCase(),
        textAlign: TextAlign.center,
        style: GoogleFonts.nunito(
          color: AppColors.darkGreen,
          fontSize: 17,
          fontWeight: FontWeight.w700,
          height: .9,
        ),
      ),
    ]);
  }
}
