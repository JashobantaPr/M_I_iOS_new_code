import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/myOrders/viewdetails_vouchertype/controller/vouchertype_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class MyOrderVoucherTypeScreen
    extends GetWidget<MyOrderViewDetailsVoucherTypeController> {
  const MyOrderVoucherTypeScreen({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10, left: 16.w),
              child: Text(
                'Voucher Details',
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
                'Click below button to view Voucher Details.',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    color: appTheme.black600,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: 120,
                  height: 40,
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
            ),
            SizedBox(
              height: 10,
            ),
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
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDataRow(
                          'Order Placed On',
                          '03-04-2020',
                        ),
                        _buildDataRow('Order Id', 'mid50_1'),
                        _buildDataRow('FR Code ', '-'),
                        _buildDataRow('Wallet Type', 'Common wallet'),
                        _buildDataRow('Wallet Name', 'Common wallet'),
                        _buildDataRow('Product Code', 'EV935'),
                        _buildDataRow('Product Name', 'Flipkart'),
                        _buildDataRow('Product Category', 'ev'),
                        _buildDataRow('Order Quantity', '1'),
                        _buildDataRow('Reward Value', '263'),
                        _buildDataRow('Total Points', '263'),
                        _buildDataRow('Value Status', 'Order Confirmed'),
                        _buildDataRow('Comments', '-'),
                        const SizedBox(height: 20),
                        _buildDescription(),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: Colors.grey, // Placeholder color for the image
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

  Widget _buildDescription() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3.0),
      child: Container(
        height: 400,
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: appTheme.greydownarrow,
                    size: 30,
                  ), // Down arrow icon
                ),
              ],
            ),
            Divider(
              color: appTheme.gray500,
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.topLeft,
                child: SingleChildScrollView(
                  child: Text(
                    'Flipkart app E Gift voucher It can be redeemed on the Flipkart app only. Please download the app from the Play Store or iOS App Store. Terms & Conditions: The eVoucher can be used against sellers listed on Flipkart.com. The voucher key is valid for a period of 1 year from the date of issue. Voucher key should be redeemed before the expiry date mentioned on the voucher. Please ensure you update your personal email id while placing orders as the Voucher Key would be sent via email. eVoucher can be redeemed by selecting the payment mode as e-Gift Voucher. It cannot be redeemed against Cash on Delivery (COD) Orders. The voucher can be redeemed on all products except other eVouchers on Flipkart.com. One or more eVoucher keys can be redeemed against an order. eVoucher can also be combined with applicable Flipkart.com promotional codes. A customer can combine and use a maximum of 9 eVouchers per order. eVouchers cannot be used to purchase other eVouchers. If the order value exceeds the eVoucher amount, the balance must be paid by Credit Card, Debit Card, or Internet Banking. If the order value is less than the amount of the eVoucher, the outstanding balance (after deduction of the order value) will reflect under eVoucher balance in the My Account section. eVoucher cannot be redeemed for cash or cheque. Flipkart.com is not responsible if an eVoucher is lost, stolen, or used without permission. The voucher e-codes will be sent by email to the email id provided while placing the order. We request you to follow the below steps if you do not receive the email in your inbox: Check your spam mails. Mark the email as "Not Junk" and add the sender or domain\'s emails into "Safe sender list".',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
