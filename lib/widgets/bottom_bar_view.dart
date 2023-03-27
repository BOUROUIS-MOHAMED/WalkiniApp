import 'dart:math' as math;


import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../models/tabIcon_data.dart';
import '../utils/colors.dart';
import '../utils/hex color.dart';

class BottomBarView extends StatefulWidget {
  final Function(int index) changeIndex;
  final Function addClick;
  final List<TabIconData> tabIconeList;

  const BottomBarView(
      {required this.tabIconeList,
      required this.changeIndex,
      required this.addClick});

  @override
  _BottomBarViewState createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _animationController.forward();
  }

  void setRemoveAllSelection(TabIconData tabIconData) {
    if (!mounted) return;
    setState(() {
      widget.tabIconeList.forEach((TabIconData tab) {
        tab.isSelected = false;
        if (tabIconData.index == tab.index) {
          tab.isSelected = true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return PhysicalShape(
              color: AppColors.white,
              elevation: 16,
              clipper: TabClipper(
                radius: Tween<double>(begin: 0, end: 1)
                        .animate(
                          CurvedAnimation(
                            parent: _animationController,
                            curve: Curves.fastOutSlowIn,
                          ),
                        )
                        .value *
                    38.0,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 62,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                      child: Row(
                        children: [
                          Expanded(
                            child: TabIcons(
                              tabIconData: widget.tabIconeList[0],
                              removeAllSelect: () {
                                setRemoveAllSelection(widget.tabIconeList[0]);
                                widget.changeIndex(0);
                              },
                            ),
                          ),
                          Expanded(
                            child: TabIcons(
                              tabIconData: widget.tabIconeList[1],
                              removeAllSelect: () {
                                setRemoveAllSelection(widget.tabIconeList[1]);
                                widget.changeIndex(1);
                              },
                            ),
                          ),
                          SizedBox(
                            width: Tween<double>(begin: 0.0, end: 1.0)
                                    .animate(CurvedAnimation(
                                        parent: _animationController,
                                        curve: Curves.fastOutSlowIn))
                                    .value *
                                64.0,
                          ),
                          Expanded(
                            child: TabIcons(
                              tabIconData: widget.tabIconeList[2],
                              removeAllSelect: () {
                                setRemoveAllSelection(widget.tabIconeList[2]);
                                widget.changeIndex(2);
                              },
                            ),
                          ),
                          Expanded(
                            child: TabIcons(
                              tabIconData: widget.tabIconeList[3],
                              removeAllSelect: () {
                                setRemoveAllSelection(widget.tabIconeList[3]);
                                widget.changeIndex(3);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).padding.bottom,
                  ),
                ],
              ),
            );
          },
        ),
        Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
          child: SizedBox(
            width: 38 * 2.0,
            height: 38 + 62.0,
            child: Container(
              alignment: Alignment.topCenter,
              color: Colors.transparent,
              child: SizedBox(
                width: 38 * 2.0,
                height: 38 * 2.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ScaleTransition(
                    alignment: Alignment.center,
                    scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                      CurvedAnimation(
                        parent: _animationController,
                        curve: Curves.fastOutSlowIn,
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.nearlyDarkBlue,
                        gradient: LinearGradient(
                          colors: [
                            AppColors.nearlyDarkBlue,
                            HexColor('#6A88E5'),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.nearlyDarkBlue.withOpacity(0.4),
                            offset: const Offset(8, 16),
                            blurRadius: 16,
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.white.withOpacity(0.1),
                          highlightColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          onTap: () {
                            widget.addClick();
                          },
                          child: Icon(
                            Icons.add,
                            color: AppColors.white,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TabIcons extends StatefulWidget {
  final TabIconData tabIconData;
  final Function removeAllSelect;
  const TabIcons({required this.tabIconData, required this.removeAllSelect});

  @override
  _TabIconsState createState() => _TabIconsState();
}

class _TabIconsState extends State<TabIcons> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    widget.tabIconData.animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if (!mounted) return;
          widget.removeAllSelect();
          widget.tabIconData.animationController!.reverse();
        }
      });
  }

  void setAnimation() {
    widget.tabIconData.animationController!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Center(
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: () {
            if (!widget.tabIconData.isSelected) {
              setAnimation();
            }
          },
          child: IgnorePointer(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                ScaleTransition(
                  alignment: Alignment.center,
                  scale: Tween<double>(begin: 0.88, end: 1.0).animate(
                    CurvedAnimation(
                      parent: widget.tabIconData.animationController!,
                      curve: Interval(0.1, 1.0, curve: Curves.fastOutSlowIn),
                    ),
                  ),
                  child: Image.asset(widget.tabIconData.isSelected
                      ? widget.tabIconData.selectedImage
                      : widget.tabIconData.image),
                ),
                Positioned(
                  top: 4,
                  left: 6,
                  right: 0,
                  child: ScaleTransition(
                    alignment: Alignment.center,
                    scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                            parent: widget.tabIconData.animationController!,
                            curve: Interval(0.2, 1.0,
                                curve: Curves.fastOutSlowIn))),
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppColors.nearlyDarkBlue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 6,
                  bottom: 8,
                  child: ScaleTransition(
                    alignment: Alignment.center,
                    scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                            parent: widget.tabIconData.animationController!,
                            curve: Interval(0.5, 0.8,
                                curve: Curves.fastOutSlowIn))),
                    child: Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: AppColors.nearlyDarkBlue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 6,
                  right: 8,
                  bottom: 0,
                  child: ScaleTransition(
                    alignment: Alignment.center,
                    scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                            parent: widget.tabIconData.animationController!,
                            curve: Interval(0.5, 0.6,
                                curve: Curves.fastOutSlowIn))),
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: AppColors.nearlyDarkBlue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TabClipper extends CustomClipper<Path> {
  final double radius;
  TabClipper({this.radius = 38});

  @override
  Path getClip(Size size) {
    final Path path = Path();

    final double v = radius * 2;
    path.lineTo(0, 0);
    path.arcTo(Rect.fromLTWH(0, 0, radius, radius), degreeToRadians(180),
        degreeToRadians(90), false);
    path.arcTo(
        Rect.fromLTWH(
            ((size.width / 2) - v / 2) - radius + v * 0.04, 0, radius, radius),
        degreeToRadians(270),
        degreeToRadians(70),
        false);

    path.arcTo(Rect.fromLTWH((size.width / 2) - v / 2, -v / 2, v, v),
        degreeToRadians(160), degreeToRadians(-140), false);

    path.arcTo(
        Rect.fromLTWH((size.width - ((size.width / 2) - v / 2)) - v * 0.04, 0,
            radius, radius),
        degreeToRadians(200),
        degreeToRadians(70),
        false);
    path.arcTo(Rect.fromLTWH(size.width - radius, 0, radius, radius),
        degreeToRadians(270), degreeToRadians(90), false);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(TabClipper oldClipper) => true;

  double degreeToRadians(double degree) {
    final double redian = (math.pi / 180) * degree;
    return redian;
  }
}
