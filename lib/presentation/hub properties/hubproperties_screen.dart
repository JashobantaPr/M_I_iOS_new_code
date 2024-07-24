import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/hub%20properties/controller/propertiescontroller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class HubPropertiesScreen extends GetWidget<HubPropertiesController> {
  const HubPropertiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Properties",
            style: TextStyle(color: appTheme.white),
          ),
          backgroundColor: const Color(0XFFE41C39),
          iconTheme: const IconThemeData(color: Colors.white),
          leading: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: IconButton(
              onPressed: () => Get.back(),
              icon: SvgPicture.asset(
                ImageConstant.arrowback,
                width: 27.w,
                height: 16.h,
              ),
            ),
          ),
        ),
        body: Obx(() {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Column(
                  children: [
                    _buildDataRow('Document Type',
                        controller.hubProperties.value?.docType ?? ''),
                    _buildDataRow('Document Name',
                        controller.hubProperties.value?.documentName ?? ''),
                    _buildDataRow('Section Name ',
                        controller.hubProperties.value?.section ?? ''),
                    _buildDataRow('Sub Section Name ',
                        controller.hubProperties.value?.subSection ?? ''),
                    _buildDataRow('Upload On',
                        controller.hubProperties.value?.uploadedOn ?? ''),
                    _buildDataRow('Uploaded by',
                        controller.hubProperties.value?.uploadedBy ?? ''),
                    _buildDataRow('Document Size',
                        controller.hubProperties.value?.documentSize ?? ''),
                    _buildDataRow(
                        'Scope', controller.hubProperties.value?.scopes ?? ''),
                    _buildDataRow('Program Name',
                        controller.hubProperties.value?.description ?? ''),
                    // _buildDataRow('Department',
                    //     controller.hubProperties.value?.value?.des ?? ''),
                    // _buildDataRow('Designation',
                    //     controller.hubProperties.value?.value?.deps ?? ''),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: 103,
                  height: 48,
                  color: appTheme.rediconbackground,
                  child: Center(
                    child: Text(
                      'Ok',
                      style: TextStyle(
                        color: appTheme.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }));
  }

  Widget _buildDataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              width: 130.w,
              child: Text(
                label,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 12.sp,
                    color: appTheme.black600,
                    fontWeight: FontWeight.normal,
                    height: 2.5),
              )),
          const Text(':'),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: SizedBox(
              width: 145,
              child: Text(
                value,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
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
