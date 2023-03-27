import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../utils/colors.dart';

class OnBoardingSecondSubScreen extends StatelessWidget {
  const OnBoardingSecondSubScreen({
    Key? key,
    this.controller,
  }) : super(key: key);

  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 200),
        Text(
          'Walk or Run! You won'.toUpperCase(),
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            color: AppColors.appBlack,
            fontSize: 19,
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 22),
        Text(
          'WALKINI',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: AppColors.mainColor,
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
          'Sport matter as much as \nyour house, run or just walk \nto won a wonderful prizes.',
          textAlign: TextAlign.center,
          style: GoogleFonts.nunito(
            color: AppColors.appBlack,
            fontSize: 20,
            fontWeight: FontWeight.w500,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 10),
        /*TextButton(
          onPressed: () {
            controller!.animateTo(1540,
                duration: const Duration(milliseconds: 2300),
                curve: Curves.ease);
          },
          child: Text(
            'Show more',
            style: GoogleFonts.nunito(
              color: AppColors.starColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              height: 1.2,
            ),
          ),
        ),*/
        const SizedBox(height: 330),
        _buildExteriorInfoSection(),
        const SizedBox(height: 370),
      ],
    );
  }

  Widget _buildExteriorInfoSection() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Put your phone in \nyour pocket ',
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                color: AppColors.purpleColor,
                fontSize: 28,
                fontWeight: FontWeight.w800,
                height: 1,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Move this legs \nChange your spot \nWalk\nWalk faster\nOr run if you want.',
              style: GoogleFonts.nunito(
                color: AppColors.bigTextColor,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
