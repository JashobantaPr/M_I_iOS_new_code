import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/myprogressbar/controller/myprogressbarcontroller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class MyProgressBarScreen extends GetWidget<MyProgressbarController> {
  const MyProgressBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
          backgroundColor: appTheme.grey,
          appBar: _customAppBar(),
          body: Obx(() {
            if (controller.kpiList.isEmpty) {
              return const Center(
                child: SpinKitFadingCircle(
                  color: Colors.black,
                  size: 50.0,
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 10),
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: controller.kpiList.length,
                itemBuilder: (context, index) {
                  return qualifiedleads(index);
                },
              ),
            );
          })),
    );
  }

  PreferredSizeWidget _customAppBar() {
    return AppBar(
      backgroundColor: appTheme.redappbar,
      automaticallyImplyLeading: true,
      leading: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: IconButton(
          onPressed: () => Get.back(),
          icon: SvgPicture.asset(
            ImageConstant.arrowback,
            width: 27.w,
            height: 18.h,
          ),
        ),
      ),
      title: Text(
        'My Performance',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: GoogleFonts.roboto().fontFamily,
          fontWeight: FontWeight.w600,
          fontSize: 20.sp,
          color: appTheme.white,
        ),
      ),
    );
  }

  Widget _basicinformation(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              width: 104.w,
              child: Text(
                label,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 12.sp,
                    color: appTheme.black600,
                    fontWeight: FontWeight.normal),
              )),
          const Text(':'),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: SizedBox(
              width: 110.w,
              child: Text(
                value,
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

  Widget qualifiedleads(int index) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: appTheme.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 10.sp,
                  color: appTheme.black600,
                ),
                children: [
                  TextSpan(
                    text: controller.kpiList[index].kpiName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: appTheme.black900,
                    ),
                  ),
                  TextSpan(
                    text: '(in ${controller.kpiList[index].kpiUnit})',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: appTheme.black900,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '${controller.kpiList[index].kpiAchievementValue > 1000 ? '${(controller.kpiList[index].kpiAchievementValue / 1000).toStringAsFixed(2)}k' : controller.kpiList[index].kpiAchievementValue} / ${controller.kpiList[index].kpiTargetValue}',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                  color: appTheme.black900,
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            SizedBox(
              height: 4.h,
              width: double.maxFinite,
              child: LinearProgressIndicator(
                value: controller.kpiList[index].kpiAchievementValue /
                    controller.kpiList[index].kpiTargetValue,
                borderRadius: BorderRadius.circular(5),
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(
                  controller.kpiList[index].kpiAchievementValue >=
                          controller.kpiList[index].kpiTargetValue
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            ),
            SizedBox(
              height: 11.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Your Rank:',
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.normal,
                        fontSize: 10.sp,
                        color: appTheme.greytextcolour,
                      ),
                    ),
                    Text(
                      ' ${controller.kpiList[index].kpiRank}',
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp,
                        color: appTheme.black600,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 18.h,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(227, 245, 222, 1),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Text(
                    '${controller.kpiList[index].kpiPercentage}%',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: appTheme.green1,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
