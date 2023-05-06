import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/assets.gen.dart';

class GoalsDailyList extends StatefulWidget {
  const GoalsDailyList({Key? key}) : super(key: key);

  @override
  State<GoalsDailyList> createState() => _GoalsDailyListState();
}

class _GoalsDailyListState extends State<GoalsDailyList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 39.h,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My goals',
                          style: TextStyle(
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: GoogleFonts.workSans().fontFamily,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '13 June 2023',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontFamily: GoogleFonts.workSans().fontFamily,
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: Container(
                        height: 40.h,
                        width: 40.h,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 13.h,
              ),
              Container(
                height: 80.h,
                width: size.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 20),
                      ListView.separated(
                        itemCount: 7,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 10);
                        },
                        itemBuilder: (context, index) {
                          return CircleAvatar(
                            radius: 30.r,
                            backgroundColor: Colors.grey,
                            child: CircleAvatar(
                              radius: 29.r,
                              backgroundColor: Colors.white,
                              child: Center(
                                child: Text(
                                  '${DateTime.now().day - index}',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(width: 20),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(width: 20.w),
              ListView.separated(
                itemCount: 5,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) {
                  return SizedBox(height: 20.h);
                },
                itemBuilder: (context, index) {
                  return GoalCard(
                    goalNumber: index + 1,
                  );
                },
              ),
              SizedBox(width: 20.w),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90.h,
        decoration: BoxDecoration(color: Colors.white, border: Border.all(color: const Color(0xffE0E0E0))),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 54.w, right: 54.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Assets.svg.m6.motionPhotosPause.svg(
                  height: 24.r,
                  width: 24.r,
                  fit: BoxFit.fill,
                ),
                Assets.svg.m6.castConnected.svg(
                  height: 24.r,
                  width: 24.r,
                  fit: BoxFit.fill,
                ),
                Assets.svg.m6.debug.svg(
                  height: 24.r,
                  width: 24.r,
                  fit: BoxFit.fill,
                ),
                Assets.svg.m6.contact.svg(
                  height: 24.r,
                  width: 24.r,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GoalCard extends StatelessWidget {
  final int goalNumber;

  const GoalCard({
    Key? key,
    required this.goalNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      // height: 100,
      padding: EdgeInsets.all(25.w),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 30.r,
            backgroundColor: Colors.grey,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Goals #$goalNumber',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: GoogleFonts.workSans().fontFamily,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Container(
                    height: 5,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 5,
                          width: 20,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '20% completed',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontFamily: GoogleFonts.workSans().fontFamily,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.more_vert),
              Icon(Icons.more_vert, color: Colors.transparent),
            ],
          )
        ],
      ),
    );
  }
}
