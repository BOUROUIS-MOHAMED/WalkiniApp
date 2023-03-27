import 'package:flutter/material.dart';

class EventContainerModel extends StatelessWidget {
  final String image;
  final BoxFit fit;
  final double width, height;
  const EventContainerModel(this.image,
      {Key? key, required this.fit, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      fit: fit,
      width: width,
      height: height,
    );
  }
}