import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:deplug/core/utils/resource/r.dart';

class OnboardingBackground extends StatelessWidget {
  const OnboardingBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      key: const Key('onboarding_background'),
      child: Stack(
        children: [
          SvgPicture.asset(R.assets.graphics.svgIcons.blackGradient),
          SvgPicture.asset(R.assets.graphics.svgIcons.greenGradient),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 170, sigmaY: 170),
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Colors.green.withOpacity(0.1),
                  Colors.transparent,
                ],
                radius: 1.1,
              ),
            ),
          ),
          Positioned.fill(child: Image.asset(R.assets.graphics.pngIcons.mathematicsGrid, fit: BoxFit.fill)),
        ],
      ),
    );
  }
}
