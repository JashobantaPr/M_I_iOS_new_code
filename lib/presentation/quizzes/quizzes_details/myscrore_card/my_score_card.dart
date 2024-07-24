import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_details/myscrore_card/controller/my_score_card_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class MyScoreCardScreen extends GetWidget<MyScoreCardController> {
  const MyScoreCardScreen({super.key});

   
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _scorecarddetails(),
          SizedBox(height: 20.h),
          Text(
            'Question Distribution',
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w800,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: appTheme.black600),
          ),
          SizedBox(
            height: 12.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearProgressIndicator(
                value: 50,
                borderRadius: BorderRadius.circular(5),
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return _question(
                  'Q${index + 1}. Pandit Vishwa Mohan Bhatt, who has won the prestigious \'Grammy Awards\' is an exponent in which of the following musical instruments?');
            },
          ),
        ],
      ),
    );
  }

  Widget _scorecarddetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 13, bottom: 5),
          child: Text(
            'My Scorecard Details',
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: appTheme.cyan800),
          ),
        ),
        Divider(
          color: appTheme.grey500,
          indent: BorderSide.strokeAlignCenter,
          thickness: 1,
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 60,
              width: (ScreenUtil().screenWidth / 2) - 25.w,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration:
                  BoxDecoration(border: Border.all(color: appTheme.grey500)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(8),
                    color: appTheme.green,
                    child: Image.asset(
                      ImageConstant.successgreencheck,
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Scored',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.normal,
                          color: appTheme.black600,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "35",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                color: appTheme.black600,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            TextSpan(
                              text: '/40',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                color: appTheme.greytextcolour,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Container(
              height: 60,
              width: (ScreenUtil().screenWidth / 2) - 25.w,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration:
                  BoxDecoration(border: Border.all(color: appTheme.grey500)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(8),
                    color: appTheme.yellow,
                    child: Image.asset(
                      ImageConstant.starcheck,
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ranks',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.normal,
                          color: appTheme.black600,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "35",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                color: appTheme.black600,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            TextSpan(
                              text: '/40',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                color: appTheme.greytextcolour,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 60,
              width: (ScreenUtil().screenWidth / 2) - 25.w,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              decoration:
                  BoxDecoration(border: Border.all(color: appTheme.grey500)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 40.w,
                    height: 40.h,
                    padding: EdgeInsets.all(8.w),
                    color: appTheme.pink,
                    child: Image.asset(
                      ImageConstant.clock,
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Time Spent',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.normal,
                            color: appTheme.black600,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "00:05:00",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  color: appTheme.black600,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              TextSpan(
                                text: '/00:05:00',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  color: appTheme.greytextcolour,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Container(
              height: 60,
              width: (ScreenUtil().screenWidth / 2) - 25.w,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration:
                  BoxDecoration(border: Border.all(color: appTheme.grey500)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(8),
                    color: appTheme.yellowdark,
                    child: SvgPicture.asset(
                      ImageConstant.earnedpoints,
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Earned Points',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.normal,
                          color: appTheme.black600,
                        ),
                      ),
                      Text(
                        "200",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          color: appTheme.black600,
                          fontWeight: FontWeight.w800,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _question(String questionText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          questionText,
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w800,
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: appTheme.black600),
        ),
        Obx(() => Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RadioListTile<String>(
                  activeColor: appTheme.cyan800,
                  dense: true,
                  title: Text(
                    'Guitar',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.normal,
                        color: appTheme.cyan800),
                  ),
                  value: 'Guitar',
                  groupValue: controller.selectedAnswerMap[questionText],
                  onChanged: (value) {
                    controller.selectAnswer(questionText, value!);
                  },
                ),
                RadioListTile<String>(
                  activeColor: appTheme.cyan800,
                  dense: true,
                  title: Text(
                    'Violin',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.normal,
                        color: appTheme.cyan800),
                  ),
                  value: 'Violin',
                  groupValue: controller.selectedAnswerMap[questionText],
                  onChanged: (value) {
                    controller.selectAnswer(questionText, value!);
                  },
                ),
                RadioListTile<String>(
                  activeColor: appTheme.cyan800,
                  dense: true,
                  title: Text(
                    'Sarod',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.normal,
                        color: appTheme.cyan800),
                  ),
                  value: 'Sarod',
                  groupValue: controller.selectedAnswerMap[questionText],
                  onChanged: (value) {
                    controller.selectAnswer(questionText, value!);
                  },
                ),
                RadioListTile<String>(
                  activeColor: appTheme.cyan800,
                  dense: true,
                  title: Text(
                    'Tabla',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.normal,
                        color: appTheme.cyan800),
                  ),
                  value: 'Tabla',
                  groupValue: controller.selectedAnswerMap[questionText],
                  onChanged: (value) {
                    controller.selectAnswer(questionText, value!);
                  },
                ),
              ],
            )),
      ],
    );
  }
}
