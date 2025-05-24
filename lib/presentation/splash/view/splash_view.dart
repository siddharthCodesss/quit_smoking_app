import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quit_smoking_app/core/constants/app_strings.dart';
import 'package:quit_smoking_app/core/constants/color_constants.dart';
import 'package:quit_smoking_app/core/constants/file_constants.dart';
import 'package:sizer/sizer.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: lightBlueColor.withOpacity(0.5),
          statusBarIconBrightness: Brightness.dark,
        ),
        child: SafeArea(
          child: Container(
            height: 100.h,
            width: 100.w,
            color: lightBlueColor.withOpacity(0.5),
            padding: EdgeInsets.all(4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30.w,
                  width: 30.w,
                  child: Image.asset(FileConstants.shieldIconPNG),
                ).marginOnly(bottom: 4.w),
                Text(
                    AppStrings.welcomeToQuitPilot,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey.shade900,
                    fontFamily: cabinStyle,
                    fontSize: 20,
                    fontWeight: FontWeight.w900
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
