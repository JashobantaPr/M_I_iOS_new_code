import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/myperformancecard/controller/myperformancecardcontroller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class MyPerformanceCardScreen extends GetWidget<MyPerformanceCardController> {
  const MyPerformanceCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
          backgroundColor: appTheme.grey,
          appBar: _customAppBar(),
          body: Obx(() {
            if (controller.isLoading.value) {
              return const Center(
                child: SpinKitFadingCircle(
                  color: Colors.black,
                  size: 50.0,
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: controller.kpiList.length,
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final kpi = controller.kpiList[index];
                  return Container(
                    decoration: BoxDecoration(
                        color: appTheme.white,
                        borderRadius: BorderRadius.circular(5)),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: kpi.kpiAchievementValue != 0
                              ? SizedBox(
                                  height: 50,
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              controller.kpiList[index].kpiName,
                                          style: TextStyle(
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                            color: appTheme.black600,
                                          ),
                                        ),
                                        TextSpan(
                                          text: controller.kpiList[index]
                                                  .kpiUnit.isNotEmpty
                                              ? ' (in ${controller.kpiList[index].kpiUnit})'
                                              : '',
                                          style: TextStyle(
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                            color: appTheme.black900,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: controller
                                                  .kpiList[index].kpiName,
                                              style: TextStyle(
                                                fontFamily:
                                                    GoogleFonts.poppins()
                                                        .fontFamily,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10.sp,
                                                color: appTheme.black600,
                                              ),
                                            ),
                                            TextSpan(
                                              text: controller.kpiList[index]
                                                      .kpiUnit.isNotEmpty
                                                  ? ' (in ${controller.kpiList[index].kpiUnit})'
                                                  : '',
                                              style: TextStyle(
                                                fontFamily:
                                                    GoogleFonts.poppins()
                                                        .fontFamily,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10.sp,
                                                color: appTheme.black900,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    SvgPicture.asset(
                                      ImageConstant.error,
                                      width: 12,
                                      height: 12,
                                      color: Colors.red,
                                    ),
                                  ],
                                ),
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        kpi.kpiAchievementValue != 0
                            ? Row(
                                children: [
                                  Text(
                                    'Your Rank:',
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 10.sp,
                                      color: appTheme.greytextcolour,
                                    ),
                                  ),
                                  Text(
                                    ' ${kpi.kpiRank}',
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.sp,
                                      color: appTheme.black600,
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 18.h,
                                    decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                          227, 245, 222, 1),
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 3),
                                    child: Text(
                                      '${kpi.kpiPercentage}%',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: appTheme.green1,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            : const SizedBox.shrink(),
                        Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: kpi.kpiAchievementValue != 0
                              ? Text(
                                  '${controller.kpiList[index].kpiAchievementValue > 1000 ? '${(controller.kpiList[index].kpiAchievementValue / 1000).toStringAsFixed(2)}k' : controller.kpiList[index].kpiAchievementValue}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    color: appTheme.black900,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : Text(
                                  '-',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: appTheme.black600),
                                ),
                        ),
                        Text(
                          'Achievement',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            color: appTheme.greytextcolour,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: kpi.kpiTargetValue != 0
                              ? Text(
                                  '${kpi.kpiTargetValue}',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    color: appTheme.black600,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.normal,
                                  ),
                                )
                              : Text(
                                  '-',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16,
                                      color: appTheme.black600),
                                ),
                        ),
                        Text(
                          'Target',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            color: appTheme.greytextcolour,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  );
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
}
