import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/myperformancetargetmeter/controller/myperformancetargetmetercontroller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MyPerformanceTargetMeterScreen
    extends GetWidget<MyPerformanceTargetMeterController> {
  const MyPerformanceTargetMeterScreen({super.key});

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
            if (controller.kpiList.isEmpty) {
              return const Center(
                child: Text('No data available'),
              );
            }
            return Padding(
              padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
              child: SingleChildScrollView(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: controller.kpiList.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: appTheme.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: SizedBox(
                              height: 50,
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: controller.kpiList[index].kpiName,
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.sp,
                                        color: appTheme.black600,
                                      ),
                                    ),
                                    TextSpan(
                                      text: controller
                                              .kpiList[index].kpiUnit.isNotEmpty
                                          ? ' (in ${controller.kpiList[index].kpiUnit})'
                                          : '',
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10.sp,
                                        color: appTheme.black900,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
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
                              const Spacer(),
                              Container(
                                height: 18.h,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(227, 245, 222, 1),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 3),
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
                          ),
                          SizedBox(height: 20.h),
                          Expanded(
                            child: Stack(
                              children: [
                                SfRadialGauge(
                                  enableLoadingAnimation: true,
                                  axes: <RadialAxis>[
                                    RadialAxis(
                                      showLabels: false,
                                      showTicks: false,
                                      startAngle: 180,
                                      endAngle: 0,
                                      radiusFactor: 1.8,
                                      minimum: 0,
                                      maximum: controller
                                          .kpiList[index].kpiTargetValue,
                                      canScaleToFit: true,
                                      axisLineStyle: AxisLineStyle(
                                        thickness: 0.35,
                                        thicknessUnit: GaugeSizeUnit.factor,
                                        color: Colors.grey.shade300,
                                      ),
                                      pointers: <GaugePointer>[
                                        RangePointer(
                                          pointerOffset: 0.1,
                                          value: controller.kpiList[index]
                                              .kpiAchievementValue,
                                          width: 0.15,
                                          sizeUnit: GaugeSizeUnit.factor,
                                          gradient: const SweepGradient(
                                            colors: <Color>[
                                              Color(0xFFC04194),
                                              Color(0xFF114FC1),
                                              Color(0xFFC04194),
                                            ],
                                            stops: <double>[0.0, 0.5, 1.0],
                                          ),
                                          enableAnimation: true,
                                        ),
                                      ],
                                      annotations: <GaugeAnnotation>[
                                        GaugeAnnotation(
                                          angle: 180,
                                          positionFactor: 1,
                                          widget: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 30),
                                            child: Text(
                                              '0',
                                              style: TextStyle(
                                                fontSize: 7.sp,
                                                fontFamily:
                                                    GoogleFonts.poppins()
                                                        .fontFamily,
                                                fontWeight: FontWeight.w400,
                                                color: appTheme.greytextcolour,
                                              ),
                                            ),
                                          ),
                                        ),
                                        GaugeAnnotation(
                                          angle: 0,
                                          positionFactor: 1,
                                          widget: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 30),
                                            child: Text(
                                              '${controller.kpiList[index].kpiTargetValue > 1000 ? '${(controller.kpiList[index].kpiTargetValue / 1000).toStringAsFixed(2)}k' : controller.kpiList[index].kpiTargetValue}',
                                              style: TextStyle(
                                                fontSize: 7.sp,
                                                fontFamily:
                                                    GoogleFonts.poppins()
                                                        .fontFamily,
                                                fontWeight: FontWeight.w400,
                                                color: appTheme.greytextcolour,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        '${controller.kpiList[index].kpiAchievementValue > 1000 ? '${(controller.kpiList[index].kpiAchievementValue / 1000).toStringAsFixed(2)}k' : controller.kpiList[index].kpiAchievementValue}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          color: appTheme.black900,
                                        ),
                                      ),
                                      Text(
                                        'Achievement',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 8.sp,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          color: appTheme.greytextcolour,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
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
