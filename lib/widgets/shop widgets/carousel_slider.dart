import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/colors.dart';


class CarouselSlider extends StatefulWidget {
  const CarouselSlider({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<String> items;

  @override
  State<CarouselSlider> createState() => _CarouselSliderState();
}

class _CarouselSliderState extends State<CarouselSlider> {
  int newIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: height * 0.32,
          child: PageView.builder(
            itemCount: widget.items.length,
            onPageChanged: (int currentIndex) {
              newIndex = currentIndex;
              setState(() {});
            },
            itemBuilder: (_, index) {
              return FittedBox(
                fit: BoxFit.none,
                child: Image.asset(widget.items[index], scale: 3),
              );
            },
          ),
        ),
        SmoothIndicator(
          size: Size(50,50),
          effect:  WormEffect(

            dotHeight: 0.005.sh,
            dotWidth: 0.1.sw,
            dotColor: Colors.white,
            activeDotColor: AppColors.darkOrange,
          ),
          offset: newIndex.toDouble(),
          count: widget.items.length,
        )
      ],
    );
  }
}
