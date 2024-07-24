import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_11/controller/general_knowledge_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/dialoguebox.dart';

class GeneralKnowledgeScreen extends GetWidget<GeneralKnowledgeController> {
  const GeneralKnowledgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        appBar: _customAppBar(context),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 19.h),
                child: Text(
                  'Time Left: 00:06:16',
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: const Color(0xFFFF0000)),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Obx(() => _question(
                  controller.questions[controller.currentQuestionIndex.value])),
              SizedBox(
                height: 55.h,
              ),
              Align(
                alignment: Alignment.center,
                child: Obx(() => OutlinedButton(
                      onPressed: () {
                        if (controller.isLastQuestion) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomDialog(
                                title: 'Confirmation',
                                message:
                                    'Are you sure you want to submit the quiz?',
                                onYesPressed: () {
                                  Get.toNamed(AppRoutes.quizzes16);
                                },
                              );
                            },
                          );
                        } else {
                          controller.nextQuestion();
                        }
                      },
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: appTheme.redappbar),
                          fixedSize: const Size(145, 48),
                          backgroundColor: Colors.red,
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(4))),
                      child: Text(
                        controller.isLastQuestion ? 'Submit' : 'Save And Next',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _customAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: appTheme.redappbar,
      automaticallyImplyLeading: true,
      leading: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: IconButton(
          onPressed: () => Get.back(),
          icon: SvgPicture.asset(
            ImageConstant.backarrow,
            width: 27.w,
            height: 18.h,
          ),
        ),
      ),
      title: Text(
        'General Knowledge',
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
            color: appTheme.white,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 21),
          child: GestureDetector(
            onTap: () {
              _showTopRightModalSheet(context);
            },
            child: SvgPicture.asset(
              ImageConstant.filterlist,
              fit: BoxFit.contain,
            ),
          ),
        ),
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
        SizedBox(
          height: 10.h,
        ),
        Image.asset(
          ImageConstant.imgLogo,
          height: 137,
          width: double.maxFinite,
          fit: BoxFit.fill,
        ),
        Obx(
          () => Column(
            children: [
              RadioListTile<String>(
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
                groupValue: controller.selectedAnswer.value,
                onChanged: (value) {
                  controller.selectAnswer(value!);
                },
              ),
              Divider(
                color: appTheme.greydivider,
                indent: BorderSide.strokeAlignCenter,
                thickness: 1,
              ),
              RadioListTile<String>(
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
                groupValue: controller.selectedAnswer.value,
                onChanged: (value) {
                  controller.selectAnswer(value!);
                },
              ),
              Divider(
                color: appTheme.greydivider,
                indent: BorderSide.strokeAlignCenter,
                thickness: 1,
              ),
              RadioListTile<String>(
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
                groupValue: controller.selectedAnswer.value,
                onChanged: (value) {
                  controller.selectAnswer(value!);
                },
              ),
              Divider(
                color: appTheme.greydivider,
                indent: BorderSide.strokeAlignCenter,
                thickness: 1,
              ),
              RadioListTile<String>(
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
                groupValue: controller.selectedAnswer.value,
                onChanged: (value) {
                  controller.selectAnswer(value!);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showTopRightModalSheet(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 600),
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 80, right: 5),
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.9,
                color: Colors.white,
                child: _correctedCounts(),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _correctedCounts() {
    return Padding(
      padding: const EdgeInsets.only(top: 11, left: 21, right: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 11),
            child: Text(
              'Questions 15',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: appTheme.black600,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _circleWithText('Answered', const Color(0xFF628D00), 10),
              _circleWithText('Not Answered', const Color(0xFFDC387D), 10),
              _circleWithText('Not Visited', appTheme.gray200, 10),
            ],
          ),
          SizedBox(height: 20.h),
          Wrap(
            spacing: 10.w,
            runSpacing: 10.h,
            children: List.generate(15, (index) {
              return _numberCircle(index + 1, _getColorForIndex(index));
            }),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.center,
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  side: BorderSide(color: appTheme.redappbar),
                  fixedSize: const Size(145, 48),
                  backgroundColor: Colors.red,
                  shape: ContinuousRectangleBorder(
                      borderRadius: BorderRadius.circular(4))),
              child: const Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }

  Widget _circleWithText(String text, Color color, double radius) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 14,
          height: 14,
          child: CircleAvatar(
            radius: radius,
            backgroundColor: color,
          ),
        ),
        SizedBox(width: 5.h),
        Text(
          text,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.normal,
            fontFamily: GoogleFonts.poppins().fontFamily,
            color: appTheme.black600,
          ),
        ),
      ],
    );
  }

  Widget _numberCircle(int number, Color color) {
    return CircleAvatar(
      radius: 20.r,
      backgroundColor: color,
      child: Text(
        number.toString(),
        style: TextStyle(
          fontSize: 16.sp,
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Color _getColorForIndex(int index) {
    switch (index % 3) {
      case 0:
        return const Color(0xFF628D00);
      case 1:
        return const Color(0xFFDC387D);
      case 2:
        return appTheme.gray200;
      default:
        return Colors.grey;
    }
  }
}
