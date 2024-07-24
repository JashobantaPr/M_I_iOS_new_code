import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class OptionCard1 extends StatelessWidget {
  final String imagePath;
  final String points;
  final String text;

  const OptionCard1({
    super.key,
    required this.imagePath,
    required this.points,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => SizedBox(
        width: 170.w,
        height: 60.h,
        child: Card(
          shape: ContinuousRectangleBorder(
              side: BorderSide(color: appTheme.greydivider)),
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
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
                const SizedBox(width: 4),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      points.toString(),
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          color: const Color.fromRGBO(25, 25, 25, 1)),
                    ),
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 9.sp,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.bold,
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
