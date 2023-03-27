import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../utils/colors.dart';
import '../../widgets/paralex_widgets/paralax/parallax_scroll.dart';
import '../../widgets/paralex_widgets/paralax/parallax_svg_background.dart';
import 'subscreens/on_boarding_last_sub_screen.dart';
import 'subscreens/on_boarding_second_sub_screen.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final ScrollController controller = ScrollController();
  bool _disabled3D = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.darkGreen,
        child: ParallaxScroll(
          controller: controller,
          physic: const ClampingScrollPhysics(),
          parallaxBackgroundChildren: _buildParallaxElements(),
          parallaxForegroundChildren: [
            ParallaxElement(
              child: _buildEffectToggle(),
            )
          ],
          children: [
            OnBoardingSecondSubScreen(controller: controller),
            OnBoardingLastSubScreen(controller: controller),
          ],
        ),
      ),
    );
  }

  List<ParallaxElement> _buildParallaxElements() {
    return [
      ParallaxElement(
        scrollDelay: const Duration(milliseconds: 230),
        child: ParallaxSvgBackground(
          disableDeepEffect: true,
          disableShadow: true,
          settings: ParallaxBackgroundSettings.predefined(),
          svgAssetName: 'assets/svg/background_icons.svg',
          translationOffset: Constants.svgBackgroundIconsOffst,
        ),
      ),
      ParallaxElement(
        scrollDelay: const Duration(milliseconds: 230),
        child: ParallaxSvgBackground(
          disableDeepEffect: _disabled3D,
          settings: ParallaxBackgroundSettings.predefined(),
          svgAssetName: 'assets/svg/layer3.svg',
          translationOffset: Constants.svgLayersOffset,
        ),
      ),
      ParallaxElement(
        scrollDelay: const Duration(milliseconds: 230),
        child: ParallaxSvgBackground(
          disableDeepEffect: true,
          disableShadow: true,
          settings: ParallaxBackgroundSettings.predefined(),
          svgAssetName: 'assets/svg/layer3_icons.svg',
          translationOffset: Constants.svgLayer3IconsOffst,
        ),
      ),
      ParallaxElement(
        scrollDelay: const Duration(milliseconds: 150),
        child: ParallaxSvgBackground(
          disableDeepEffect: _disabled3D,
          settings: ParallaxBackgroundSettings.predefined(),
          svgAssetName: 'assets/svg/layer2.svg',
          translationOffset: Constants.svgLayersOffset,
        ),
      ),
      ParallaxElement(
        scrollDelay: const Duration(milliseconds: 150),
        child: ParallaxSvgBackground(
          disableDeepEffect: true,
          disableShadow: true,
          settings: ParallaxBackgroundSettings.predefined(),
          svgAssetName: 'assets/svg/layer2_icons.svg',
          translationOffset: Constants.svgLayer2IconsOffst,
        ),
      ),
      ParallaxElement(
        scrollDelay: const Duration(milliseconds: 40),
        child: ParallaxSvgBackground(
          disableDeepEffect: _disabled3D,
          settings: ParallaxBackgroundSettings.predefined(),
          svgAssetName: 'assets/svg/layer1.svg',
          translationOffset: Constants.svgLayersOffset,
        ),
      ),
    ];
  }

  Widget _buildEffectToggle() {
    return IconButton(
      icon: Icon(
        _disabled3D ? Icons.blur_off : Icons.blur_on,
        color: AppColors.appGreen,
        size: 30,
      ),
      tooltip: 'On/Off 3D effect',
      onPressed: () {
        setState(() => _disabled3D = !_disabled3D);
      },
    );
  }
}
