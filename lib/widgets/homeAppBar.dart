import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(

      color: Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(

            padding: EdgeInsets.only(right: 0.04.sw),
            height: 0.06.sh,
            decoration: BoxDecoration(
                color:Colors.black12,
                borderRadius: BorderRadius.circular(30.r)
            ),
            child: Row(

              children: [
                CircleAvatar(
                  backgroundColor: AppColors.appGreen,
                  radius: 0.03.sh,
                ),
                SizedBox(
                  width: 0.02.sw,
                ),
                Text("UserNameHHHHHHHH",style: Theme.of(context).textTheme.subtitle1,)
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,

            ),
            child: Icon(CupertinoIcons.bell_fill,color: Colors.black45,),
          ),
        ],
      ),

    );
  }
}
