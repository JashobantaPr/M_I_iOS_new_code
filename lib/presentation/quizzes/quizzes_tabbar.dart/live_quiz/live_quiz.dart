import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_tabbar.dart/live_quiz/controller/live_quiz_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class LiveQuizScreen extends GetWidget<LiveQuizController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 36.h,
        ),
        Image.asset(
          ImageConstant.quiz,
          width: 90,
          height: 90,
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          'No Live Quiz',
          style: TextStyle(
              fontSize: 14.sp,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.normal,
              color: appTheme.greytextcolour),
        )
      ],
    );
  }
}
