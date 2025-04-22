import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quit_smoking_app/core/constants/color_constants.dart';
import 'package:quit_smoking_app/core/constants/file_constants.dart';
import 'package:sizer/sizer.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  double _opacity = 0.0;
  bool _showIcon = true;

  @override
  void initState() {
    super.initState();

    // Fade in after short delay
    Timer(const Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1.0;
      });
    });

    // Fade out after 3 seconds
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _opacity = 0.0;
      });
    });

    // Remove the widget from view after 4 seconds
    Timer(const Duration(seconds: 4), () {
      setState(() {
        _showIcon = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: ColorConstants.baseColor,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: SafeArea(
          child: Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [ColorConstants.baseColor, ColorConstants.shadeColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child:
                  _showIcon
                      ? AnimatedOpacity(
                        opacity: _opacity,
                        duration: const Duration(seconds: 1),
                        child: SvgPicture.asset(
                          FileConstants.cigaretteIconSVG,
                          height: 40.w,
                          width: 40.w,
                        ),
                      )
                      : const SizedBox.shrink(),
            ),
          ),
        ),
      ),
    );
  }
}
