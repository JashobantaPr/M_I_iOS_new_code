import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_16/controller/quizzes_16_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class Quizzes16Screen extends GetWidget<Quizzes16Controller> {
  const Quizzes16Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0XFFE41C39),
      child: Scaffold(
        backgroundColor: appTheme.white,
        appBar: AppBar(
          backgroundColor: const Color(0XFFE41C39),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 26.75,
            ),
          ),
          title: Text(
            'General Knowledge',
            style: TextStyle(
              color: Colors.white,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            const SizedBox(height: 100),
            _buildQuizzes16(),
            const SizedBox(height: 4),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuizzes16() {
    return Column(
      children: [
        Container(
          alignment: Alignment.topCenter,
          // padding: const EdgeInsets.only(top: 60.0),
          child: const CircleAvatar(
            backgroundColor: Color(0xFF008000),
            radius: 55.0,
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 75.0,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Thanks for taking the Quiz. Well done !',
          style: TextStyle(
            fontSize: 11.0,
            fontWeight: FontWeight.w500,
            fontFamily: GoogleFonts.poppins().fontFamily,
            color: appTheme.black600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildButtons() {
    return Column(
      children: [
        const SizedBox(height: 17),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(appTheme.redappbar),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(
                    color: Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.0),
                  ),
                ),
              ),
              child: Text(
                'Go to Home Page',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
