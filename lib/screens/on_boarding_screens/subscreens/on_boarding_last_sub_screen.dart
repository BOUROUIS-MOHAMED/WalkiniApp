import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:start_up_project/screens/auth/auth_main_screen.dart';

import '../../../constants.dart';
import '../../../utils/colors.dart';
import '../../../widgets/paralex_widgets/custom_button.dart';
import '../../../widgets/paralex_widgets/svg_label.dart';

class OnBoardingLastSubScreen extends StatelessWidget {
  const OnBoardingLastSubScreen({
    Key? key,
    this.controller,
  }) : super(key: key);

  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 200.0),
        Text(
          'All your needs'.toUpperCase(),
          style: GoogleFonts.nunito(
            color: AppColors.darkGreen,
            fontSize: 19,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 22),
        Text(
          'Benefits',
          style: GoogleFonts.poppins(
            color: AppColors.darkGreen,
            fontSize: 60,
            fontWeight: FontWeight.w800,
            height: .9,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: 70,
          height: 5,
          child: Container(
            color: AppColors.yellowColor,
          ),
        ),
        const SizedBox(height: 25),
        Text(
          'Get all you need,\nwe know how to walk.',
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            color: AppColors.darkGreen,
            fontSize: 25,
            fontWeight: FontWeight.w500,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 50),
        Text(
          'We don\'t just track your feet\'s \n, we also give and find\n the right prize for you.',
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            color: AppColors.appBlack,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 45),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            SvgLabel(
              assetName: 'assets/svg/mountains.svg',
              label: 'Sport \nTracker',
            ),
            SizedBox(width: 45),
            SvgLabel(
              assetName: 'assets/svg/stars.svg',
              label: 'Excellent \nmarks',
            ),
            SizedBox(width: 45),
            SvgLabel(
              assetName: 'assets/svg/money.svg',
              label: 'Good \nprices',
            ),
          ],
        ),
        const SizedBox(height: 90),
        Align(
          alignment: const Alignment(.8, 0.0),
          child: CustomButton(
            text: 'Get in touch',
            minWidth: 200,
            onPressed: () {
              GetStorage().write(Constants.userAlreadyOpenTheAppForTheFirstTimeKey,true);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => AuthMainScreen()));
            },
          ),
        ),
        const SizedBox(height: 200),
      ],
    );
  }
}
