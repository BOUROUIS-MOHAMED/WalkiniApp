
import 'package:flutter/material.dart' show Color, Colors;

import '../../utils/colors.dart';

class RecommendedProduct {
  Color? cardBackgroundColor;
  Color? buttonTextColor;
  Color? buttonBackgroundColor;
  String? imagePath;

  RecommendedProduct({
    this.cardBackgroundColor,
    this.buttonTextColor = AppColors.orange,
    this.buttonBackgroundColor = Colors.white,
    this.imagePath,
  });
}
