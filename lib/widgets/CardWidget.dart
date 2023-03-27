import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:start_up_project/constants.dart';

enum BalanceType{
  coin,
  emerald
}

class CardWidget extends StatelessWidget {
  final AlignmentGeometry gradientBegin;
  final AlignmentGeometry gradiendEnd;
  final List<Color> colors;
  final String text;
  final String value;
  final BalanceType balanceType ;

  CardWidget(
      {required this.gradientBegin,
      required this.gradiendEnd,
      required this.colors,
      required this.text,
      required this.value,
      required this.balanceType
      });




  @override
  Widget build(BuildContext context) {
    var val = num.tryParse(value)?.toDouble();
    double result=0.0;
        if (balanceType==BalanceType.coin) {
        result =(val!*Constants.coinValueInEuro);
        }  else{
         result= val!*Constants.emeraldValueInEuro;
        }

    return Container(
      width: 0.4.sh,
      height: 0.2.sh,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: gradientBegin,
          end: gradiendEnd,
          colors: colors,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              text,
              style: GoogleFonts.outfit(fontSize: 0.03.sh),
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                value,
                style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 5.0),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(result.toStringAsFixed(2)),
            ),
          ],
        ),
      ),
    );
  }
}