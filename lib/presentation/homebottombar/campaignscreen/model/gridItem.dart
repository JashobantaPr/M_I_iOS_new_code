import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class OptionCard extends StatelessWidget {
  final String imagePath;
  final num points;
  final String text;

  const OptionCard({
    super.key,
    required this.imagePath,
    required this.points,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => SizedBox(
        width: 169.w,
        height: 60.h,
        child: Card(
          shape: const ContinuousRectangleBorder(),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 40.w,
                  height: 40.h,
                  padding: const EdgeInsets.all(10),
                  color: const Color.fromRGBO(228, 28, 57, 1),
                  child: SvgPicture.asset(
                    imagePath,
                    width: 30.89.w,
                    height: 32.56.h,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      points.toString(),
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          color: const Color.fromRGBO(25, 25, 25, 1)),
                    ),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.w600,
                        color: appTheme.greytextcolour,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
