import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

void showAwesomeSnackBar(BuildContext _context,String title,String text,Color color,Color bubbleColor){
  ScaffoldMessenger.of(_context).showSnackBar(
    SnackBar(content: Stack(
      children: [
        Container(
            padding: EdgeInsets.all(16),

            height: 0.12.sh,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: color
            ),
            child: Row(

              children: [
                SizedBox(
                  width: 48,
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,style: TextStyle(
                          fontSize: 18,color: Colors.white
                      ),),
                      Spacer(),
                      Text(text,style: TextStyle(
                          fontSize: 12,color: Colors.white
                      ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                    ],
                  ),
                ),
              ],
            )),
        Positioned(
            bottom: 0,
            left: 0,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20)
                ),
                child: SvgPicture.asset("assets/bubbles.svg",height: 0.07.sh,width: 40,color: bubbleColor,)))
      ],
    ),

      behavior: SnackBarBehavior.floating,
      backgroundColor:Colors.transparent ,
      elevation: 0,
    ),
  );
}
