import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
    this.alignment,
    this.backgroundColor,
    this.onTap,
    this.width,
    this.height,
    this.decoration,
    this.child,
  });

  final Alignment? alignment;

  final Color? backgroundColor;

  final VoidCallback? onTap;

  final double? width;

  final double? height;

  final BoxDecoration? decoration;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        backgroundColor: backgroundColor,
        onPressed: onTap,
        child: Container(
          alignment: Alignment.center,
          width: width ?? 0,
          height: height ?? 0,
          decoration: decoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(25.h),
                gradient: LinearGradient(
                  begin: const Alignment(0.0, 0),
                  end: const Alignment(1.0, 0),
                  colors: [
                    appTheme.pink900,
                    theme.colorScheme.primary,
                  ],
                ),
              ),
          child: child,
        ),
      );
  }

 
}
