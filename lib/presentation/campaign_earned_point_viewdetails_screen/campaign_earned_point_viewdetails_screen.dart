import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/campaign_earned_point_viewdetails_screen/controller/campaign_earned_point_viewdetails_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class ViewDetailsScreen extends GetWidget<ViewDetailsController> {
  const ViewDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "View Details",
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
                height: 18.h,
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
                    _buildDataRow('Transaction',
                        controller.details.value.transactionType ?? ''),
                    _buildDataRow('Transaction Date',
                        controller.details.value.transactionDate ?? ''),
                    _buildDataRow('Transaction Code ',
                        controller.details.value.transactionCode ?? ''),
                    _buildDataRow('To', controller.details.value.to ?? ''),
                    _buildDataRow('From', controller.details.value.from ?? ''),
                    _buildDataRow(
                        'Points', controller.details.value.points ?? ''),
                    _buildDataRow('Expiry Date',
                        controller.details.value.expiryDate ?? ''),
                    _buildDataRow(
                        'Category', controller.details.value.category ?? ''),
                    _buildDataRow('Program Name',
                        controller.details.value.campaignName ?? ''),
                    _buildDataRow('Description',
                        controller.details.value.description ?? ''),
                    _buildDataRow('Additional Information',
                        controller.details.value.additionalInformation ?? ''),
                    SizedBox(
                      height: 30.h,
                    ),
                    Divider(color: appTheme.greydivider),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
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
