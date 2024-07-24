import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_details/controller/quizzes_details_controller.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_details/myscrore_card/my_score_card.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_details/top_rankers/top_rankers.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class QuizzesDetailsScreen extends GetWidget<QuizzesDetailsController> {
  const QuizzesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        backgroundColor: appTheme.background,
        appBar: _customAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                _quizdetails(),
                SizedBox(
                  height: 10.h,
                ),
                _quiz1(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _customAppBar() {
    return AppBar(
      title: Text(
        "Quiz Details",
        style: TextStyle(
          color: appTheme.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
      ),
      backgroundColor: appTheme.rediconbackground,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: SvgPicture.asset(
          ImageConstant.arrowback,
          width: 26.75.w,
          height: 19.76.h,
        ),
      ),
    );
  }

  Widget _quizdetails() {
    return InkWell(
      onTap: controller.toggleExpand,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 48.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Quiz Details',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.roboto().fontFamily,
                      color: Colors.black,
                    ),
                  ),
                  Obx(
                    () => Icon(
                      controller.isExpanded.value
                          ? Icons.keyboard_arrow_up_rounded
                          : Icons.keyboard_arrow_down_rounded,
                      size: 40,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => controller.isExpanded.value
                  ? Container(
                      padding: EdgeInsets.all(10.w),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(
                            color: appTheme.grey500,
                            thickness: 1,
                            indent: BorderSide.strokeAlignCenter,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          _buildDataRow('Quiz Id', 'Q1214'),
                          _buildDataRow('Quiz Name', 'Sports'),
                          _buildDataRow(
                              'Quiz Description', 'Lorem ipsum, or lipsum'),
                          _buildDataRow('Departments', 'Marketing'),
                          _buildDataRow('Participants', '100'),
                          _buildDataRow('Number of questions in a quiz', '15'),
                        ],
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _quiz1(BuildContext context) {
    return InkWell(
      onTap: controller.toggleExpand1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 48.h,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            margin: const EdgeInsets.only(bottom: 10),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Quiz 1',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    color: Colors.black,
                  ),
                ),
                Obx(
                  () => Icon(
                    controller.isExpanded1.value
                        ? Icons.keyboard_arrow_up_rounded
                        : Icons.keyboard_arrow_down_rounded,
                    size: 40,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Obx(
            () => controller.isExpanded1.value
                ? DefaultTabController(
                    length: 2,
                    initialIndex: 0,
                    child: Container(
                      padding: EdgeInsets.all(10.w),
                      color: appTheme.white,
                      child: Column(
                        children: [
                          TabBar(
                            labelColor: appTheme.redappbar,
                            unselectedLabelColor: appTheme.cyan800,
                            tabAlignment: TabAlignment.fill,
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14.sp,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                            physics: const AlwaysScrollableScrollPhysics(),
                            indicatorSize: TabBarIndicatorSize.tab,
                            tabs: const [
                              Tab(
                                text: 'My Scorecard',
                              ),
                              Tab(
                                text: 'Top Rankers',
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height -
                                kToolbarHeight -
                                200,
                            child: TabBarView(
                              children: [
                                MyScoreCardScreen(),
                                TopRankersScreen(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }

  Widget _buildDataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              width: 107.w,
              child: Text(
                label,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 12.sp,
                    color: appTheme.black600,
                    fontWeight: FontWeight.normal),
              )),
          SizedBox(
            width: 4.w,
          ),
          const Text(':'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                value,
                maxLines: 3,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 12.sp,
                    color: appTheme.black600,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
