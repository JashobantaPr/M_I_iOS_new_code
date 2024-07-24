import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/myWallet/pointsreceivedorder_viewdetails/controller/pointsreceivedorder_viewdetails_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class PointsReceivedOrderViewDetailsScreen
    extends GetWidget<PointsReceivedOrderViewDetailsController> {
  const PointsReceivedOrderViewDetailsScreen({super.key});

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
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                children: [
                  _buildDataRow('Order Date', '18-11-2019'),
                  _buildDataRow('Order Id ', 'ID2_293'),
                  _buildDataRow('Reward Name', 'Amazon Evoucher Rs.250'),
                  _buildDataRow('Reward Code', 'EV59'),
                  _buildDataRow('Reward Value', '250 Points'),
                  _buildDataRow('Quantity', '1'),
                  _buildDataRow('Total Value', '250 Points'),
                  _buildDataRow('Order Status', 'Order Delivered'),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(
                color: appTheme.gray500,
                thickness: 1.0,
              ),
            ),
            SizedBox(height: 40.h),
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
        ));
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
                    fontWeight: FontWeight.w400,
                    height: 2.5),
              )),
          const Text(':'),
          Padding(
            padding: const EdgeInsets.only(left: 20),
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
