import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/typeD_calculated_points_screen/controller/typeD_calculated_points_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class CalculatedPointsScreen extends GetWidget<CalculatedPointsController> {
  const CalculatedPointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text(
            "Calculated Points",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: appTheme.redappbar,
          iconTheme:
              const IconThemeData(color: Colors.white), // Set icon color here
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
        ),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: SpinKitFadingCircle(
                color: Colors.black,
                size: 50.0,
              ),
            );
          }
          if (controller.calculatedPoints.isEmpty) {
            return const Center(
              child: Text('No data available'),
            );
          }
          return SafeArea(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: ListView(
                  children: [
                    const SizedBox(height: 16),
                    _buildCalculatedPoints(),
                    const SizedBox(height: 50),
                    const Text(
                      'Incentives Payout Formula',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    const SizedBox(height: 12),
                    const Divider(
                      color: Color(0xFFE4E4E4), // Border color set to #E4E4E4
                      thickness: 1,
                      height: 1,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Set Incentives payout to (${Get.arguments[0]['calculatedpayout']})',
                      style: const TextStyle(
                          color: Color(0xFF016189),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          );
        }));
  }

  Widget _buildCalculatedPoints() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: appTheme.rediconbackground,
              child: SvgPicture.asset(
                ImageConstant.calculatedpoints,
                width: 20,
                height: 20,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                'Total Calculated Points: ${Get.arguments[0]['calculatedpayout']}',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Divider(
          color: appTheme.greydivider,
          thickness: 1,
          height: 1,
        ),
        const SizedBox(height: 15),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.calculatedPoints.length,
          itemBuilder: (context, index) {
            final point = controller.calculatedPoints[index];
            final value = _getCalculatedValue(point.colDisplayName ?? '');

            if (point.colDisplayName != null && value.isNotEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          point.colDisplayName!,
                          style: const TextStyle(
                            color: Color(0xFF383853),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const Center(
                        child: Text(
                          ":",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              value,
                              textAlign: TextAlign.right,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }

  String _getCalculatedValue(String key) {
    final programCode =
        Get.arguments[2]?['programCode'].toString().toLowerCase();
    final calculatedPoints1 = controller.calculatedPoints1;

    switch (key) {
      case 'User ID 1':
        return calculatedPoints1['sys_80_${programCode}_User_ID_1'] ?? '';
      case 'Employee Id':
        return calculatedPoints1['sys_80_${programCode}_employee_id'] ?? '';
      case 'email id 1':
        return calculatedPoints1['sys_80_email_id_1'] ?? '';
      case 'employee id 1':
        return calculatedPoints1['sys_80_employee_id_1'].toString();
      case 'phone number 1':
        return calculatedPoints1['sys_80_phone_number_1'] ?? '';
      case 'total revenue 1':
        return calculatedPoints1['sys_80_total_revenue_1']?.toString() ?? '';
      case 'quarter incentives 1':
        return calculatedPoints1['sys_80_quarter_incentives_1'] != null
            ? '${calculatedPoints1['sys_80_quarter_incentives_1']}%'
            : '';
      case 'Incentives Payout':
        return calculatedPoints1['sys_80_${programCode}_incentives_payout']
                ?.toString() ??
            '';
      default:
        return '';
    }
  }
}
