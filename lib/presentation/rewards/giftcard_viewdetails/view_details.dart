import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/rewards/giftcard_viewdetails/controller/view_details_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class GiftCardViewDetailsScreen
    extends GetWidget<GiftCardViewDetailsController> {
  const GiftCardViewDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
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
                          _buildDataRow('Total Points Value', '263'),
                          _buildDataRow('Status', 'Order Confirmed'),
                          _buildDataRow('Comments', '-'),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            color:
                                Colors.grey, // Placeholder color for the image
                            borderRadius: BorderRadius.circular(3),
                            image: const DecorationImage(
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
                  'Description',
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
                  'Myntra app E Gift voucher It can be redeemed on the Myntra app only Please download the same from Playstore and IOS Terms & Conditions: The eVoucher can be against sellers listed on on Myntra com The voucher key is valid for a period of 1 year from the date of issue. Voucher key should be redeemed before the expiry date mentioned on the vouchers. Please ensure you update your personal email id while placing orders as the Voucher Key would be sent via email. eVoucher can be redeemed by selecting the payment mode as e-Gift Voucher. It can NOT be redeemed against COD (Cash on Delivery) Orders. Voucher can be redeemed on all products except other eVouchers of Flipkart.com. One or more eVouc her keys can be redeemed against an order. eVoucher can also be clubbed with applicable Flipkart.com promotional codes. Customer can combine and use maximum of 9 eVouchers per order. eVouchers cannot be used to purchase other eVouchers. If the order value exceeds the eVoucher amount, the balance must be paid by Credit card / Debit card or Internet Banking. If the order value is less than the amount of the eVoucher, the outstanding balance (after deduction of order value) will reflect under eVoucher balance in the My Account section. eVoucher cannot be redeemed for cash or cheque. Flipkart.com is not responsible if an eVoucher is lost, stolen or used without permission. The vouchers ecodes will be sent by email on the email id provided while placing the order. We request you to follow the below; incase you do not receive the mail in your mail box- Check your spam mails. Mark the email as "Not Junk" and add the sender or domain\'s emails into "Safe sender list".',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 10.sp,
                      color: appTheme.greytextcolour,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                                side: BorderSide(color: appTheme.grey500)),
                          ),
                          backgroundColor:
                              MaterialStatePropertyAll(appTheme.white),
                          fixedSize:
                              const MaterialStatePropertyAll(Size(98, 40))),
                      onPressed: () {},
                      child: Text(
                        'My Order',
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: appTheme.greytextcolour,
                        ),
                      )),
                  SizedBox(
                    width: 10.w,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          backgroundColor: MaterialStatePropertyAll(
                              appTheme.rediconbackground),
                          fixedSize:
                              const MaterialStatePropertyAll(Size(98, 40))),
                      onPressed: () {},
                      child: Text(
                        'Rewards',
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: appTheme.white,
                        ),
                      )),
                ],
              ),
              SizedBox(height: 30.h),
            ],
          ),
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
}
