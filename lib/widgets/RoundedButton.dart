import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedButton extends StatelessWidget {
  final IconData iconData;
  final Color color;
  RoundedButton({required this.iconData, required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.07.sh,
      height: 0.07.sh,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        color: Color(0xFF212224),
      ),
      child: Icon(
        iconData,
        size: 0.04.sh,
        color: color,
      ),
    );
  }
}