import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/animations/app_animation.dart';
import '../../../utils/colors.dart';
import '../../../widgets/charity/category.dart';
import '../../../widgets/charity/search/intro_card.dart';
import '../../../widgets/charity/search/result_card.dart';
import '../../../widgets/charity/search/search_bar.dart';



class SearchScreen extends StatefulWidget {
  const SearchScreen();

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController controller;
  bool isSearching = false;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(
            32.r,
          ),
          bottomRight: Radius.circular(
            32.r,
          ),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: AnimatedSwitcher(
                duration: AppAnimation.kAnimationDuration,
                switchInCurve: AppAnimation.kAnimationCurve,
                switchOutCurve: Curves.easeInOutBack,
                child: !isSearching
                    ? Text(
                        'Explore',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      )
                    : Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSearching = false;
                              });
                            },
                            child: SizedBox(
                              width: 24.w,
                              child: SvgPicture.asset(
                                'assets/images/back.svg',
                                width: 24.w,
                                color: AppColors.kTitle,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Search Result',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(
                                    color: AppColors.kTitle,
                                    fontWeight: FontWeight.bold,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            width: 24.w,
                          )
                        ],
                      ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0.w),
              child: SearchBar(
                controller: controller,
                onTap: () {
                  setState(() {
                    isSearching = true;
                  });
                },
                hintText: 'Donate for ...',
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            !isSearching ? _buildSearching(context) : _buildResult()
          ],
        ),
      ),
    );
  }

  Widget _buildResult() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Showing search result \'${controller.text}\'',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          ...List.generate(
            results.length,
            (index) => Column(
              children: [
                ResultCard(
                  results[index],
                ),
                SizedBox(
                  height: 32.h,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearching(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Category(),
        SizedBox(
          height: 16.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0.w,
          ),
          child: IntroCard(),
        ),
      ],
    );
  }
}
