import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

import 'controller/audit_trail_Controller.dart';

class AuditTrailScreen extends GetWidget<AuditTrailController> {
  const AuditTrailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuditTrailController>();

    return ScreenUtilInit(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: Color(0XFFF0F0F0),
          appBar: AppBar(
            title: Text(
              "Audit Trail",
              style: TextStyle(
                color: appTheme.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
            backgroundColor: appTheme.redappbar,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: SvgPicture.asset(
                ImageConstant.arrowback,
                width: 26.75.w,
                height: 19.76.h,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Obx(() {
              if (controller.tierData.value?.auditTrail == null) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                    strokeWidth: 1,
                  ),
                );
              } else if (controller.tierData.value!.auditTrail.isEmpty) {
                return const Center(
                  child: Text('No audit trail available.'),
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: controller.tierData.value?.auditTrail
                          .map((tieraudit) {
                        return Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: appTheme.white,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(6)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                _buildDataRow('Date of tier change',
                                    tieraudit.tierUpdateDate),
                                const SizedBox(
                                  height: 10,
                                ),
                                _buildDataRow('Tier name', tieraudit.tierName),
                              ],
                            ),
                          ),
                        );
                      }).toList() ??
                      [],
                );
              }
            }),
          ),
        ),
      ),
    );
  }

  Color hexToColor(String hexString) {
    hexString = hexString.replaceAll("#", "");
    if (hexString.length == 6) {
      hexString = "FF$hexString";
    }
    return Color(int.parse("0x$hexString"));
  }

  Widget _buildDataRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h),
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
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const Text(':'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Text(
                value,
                maxLines: 3,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 12.sp,
                  color: appTheme.black600,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
