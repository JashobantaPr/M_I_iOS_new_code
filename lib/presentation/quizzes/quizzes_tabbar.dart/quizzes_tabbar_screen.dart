import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_tabbar.dart/controller/quizzes_tabbar_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

import 'live_quiz/live_quiz.dart';
import 'posts/quizzes_post_screen.dart';
import 'quizzes/quizzes_screen.dart';
import 'upcoming_quiz/upcoming_quiz_screen.dart';

class QuizzesTabBarScreen extends GetWidget<QuizzesTabbarController> {
  const QuizzesTabBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      initialIndex: 0,
      length: controller.titles.length,
      child: Scaffold(
        backgroundColor: appTheme.background,
        appBar: AppBar(
          backgroundColor: appTheme.redappbar,
          automaticallyImplyLeading: false, // Add this line
          title: Row(
            children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: SvgPicture.asset(
                  ImageConstant.arrowback,
                  width: 26.75.w,
                  height: 19.76.h,
                ),
              ),
              Text(
                'Quizzes',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              Text(
                'Scope: "Mumbai"',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Colors.white,
                  size: 35,
                ),
                onPressed: () {
                  //  _showTopRightModalSheet(context);
                },
              ),
            ],
          ),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3,
            tabs: controller.titles.map((title) {
              return Tab(
                child: Text(
                  title,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            QuizzePostScreen(),
            const QuizzeScreen(),
            LiveQuizScreen(),
            const UpcomingQuizScreen(),
            // GetAllCertificateScreen(),
          ],
        ),
      ),
    );
  }
}
