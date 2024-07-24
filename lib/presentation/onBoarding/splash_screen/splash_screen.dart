import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'controller/splash_controller.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: SafeArea(
          child: Scaffold(
              backgroundColor: theme.colorScheme.primary,
              body: Center(
                child: Image.asset(
                  ImageConstant.imgLogo,
                  height: 90.0,
                  width: 257.0,
                  fit: BoxFit.contain,
                ),
              ))),
    );
  }
}
