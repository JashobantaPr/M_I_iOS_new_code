import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/myOrders/viewDetails/controller/viewdetails_controller.dart';
import 'package:incentivesgit/theme/custom_text_style.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

import '../../../routes/app_routes.dart';
import '../myorder/controller/myOrderController.dart';

class MyOrderViewDetailsScreen extends GetWidget<MyorderViewDetailsController> {
  const MyOrderViewDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments =
        Get.arguments as Map<String, dynamic>?;
    final String walletType =
        arguments?["Wallet type"] ?? "Default Wallet Type";
    final String walletName =
        arguments?["Wallet name"] ?? "Default Wallet Name";

    final String ProductCode =
        arguments?["Product Code"] ?? "Default Wallet Name";

    final String ProductName =
        arguments?["Product Name"] ?? "Default Wallet Name";
    final String productCategory =
        arguments?["product Category"] ?? "Default Wallet Name";
    final String orderQuantity =
        arguments?["order Quantity"] ?? "Default Wallet Name";
    final String rewardValue =
        arguments?["reward Value"].toString() ?? "Default Wallet Name";
    final String totalPoints =
        arguments?["total Points"] ?? "Default Wallet Name";

    final String valueStatus = arguments?["value Status"] ?? "";

    final String comments = arguments?["comments"] ?? "";

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (valueStatus == "Order Delivered") ? _buildButton() : Container(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 16.w),
                  child: Text(
                    'Delivery Details',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: appTheme.black600,
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: appTheme.gray500,
                  thickness: 1.0,
                  indent: 16.w,
                  endIndent: 16.w,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 16.w),
                  child: Text(
                    'Cash Payout',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: appTheme.black600,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildDataRow(
                              'Order Placed On',
                              (controller.viewDetails != null &&
                                      controller.viewDetails!.isNotEmpty &&
                                      controller.viewDetails!.first.product !=
                                          null &&
                                      controller.viewDetails!.first.product!
                                          .isNotEmpty)
                                  ? controller.viewDetails!.first.product!.first
                                          .productCode ??
                                      ""
                                  : "",
                            ),
                            // _buildDataRow(
                            //     'Order Id',
                            //     controller
                            //             .viewDetails?.first.product?.first.points ??
                            //         ""),
                            _buildDataRow('FR Code ', '-'),
                            _buildDataRow('Wallet Type', walletType),
                            _buildDataRow('Wallet Name', walletName),
                            _buildDataRow('Product Code', ProductCode),
                            _buildDataRow('Product Name', ProductName),
                            _buildDataRow('Product Category', productCategory),
                            _buildDataRow('Order Quantity', orderQuantity),
                            _buildDataRow('Reward Value', rewardValue),
                            _buildDataRow('Total Points', totalPoints),
                            _buildDataRow('Value Status', valueStatus),
                            _buildDataRow('Comments', comments),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors
                                  .grey, // Placeholder color for the image
                              borderRadius: BorderRadius.circular(3),
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://via.placeholder.com/150'), // Replace with your image URL
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Text(
                    'Delivery Details',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: appTheme.black600,
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: appTheme.gray500,
                  thickness: 1.0,
                  indent: 16.w,
                  endIndent: 16.w,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10, left: 16.w),
                  child: Text(
                    'Cash Payout',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: appTheme.greytextcolour,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(String label, String value, {Widget? rightWidget}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 110.w, // Adjusted width
            child: Text(
              label,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 12.sp,
                color: appTheme.black600,
                fontWeight: FontWeight.normal,
                height: 2.5,
              ),
            ),
          ),
          const Text(':'),
          Expanded(
            // Ensures value takes remaining space
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                value,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 12.sp,
                  color: appTheme.black600,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          if (rightWidget != null) rightWidget,
        ],
      ),
    );
  }

  //viewButton
  Widget _buildButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "Voucher Details",
            style: CustomTextStyles.Headerblack_01,
          ),
          SizedBox(
            height: 10,
          ),
          _buildDivider(),
          SizedBox(
            height: 10,
          ),
          Text(
            "Click below button to view Voucher Details.",
          ),
          SizedBox(
            height: 20,
          ),
          _buildviewVoucher(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  //Divider

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Divider(
        thickness: 1,
        color: appTheme.grey,
      ),
    );
  }

  Widget _buildviewVoucher() {
    return GestureDetector(
      onTap: () {
        controller.viewButtonotp();
      },
      child: Container(
        height: 40,
        width: MediaQuery.of(Get.context!).size.width * 0.35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1),
          color: appTheme.redappbar,
        ),
        child: Center(
          child: Text(
            "View Voucher",
            style: CustomTextStyles.HeaderWhite_01,
          ),
        ),
      ),
    );
  }
}
