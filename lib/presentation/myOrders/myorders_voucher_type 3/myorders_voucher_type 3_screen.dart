import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/myOrders/myorders_voucher_type%203/controller/myorders_voucher_type%203_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class MyOrdersVoucherType3Screen
    extends GetWidget<MyOrdersVoucherType3Controller> {
  const MyOrdersVoucherType3Screen({super.key});

  @override
  Widget build(BuildContext context) {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: appTheme.redappbar));

  return ScreenUtilInit(
    designSize: const Size(375, 812),
    builder: (context, _) {
      return Scaffold(
        appBar: _customAppBar(),
        body: Container(
          width: 385,
          color: appTheme.grey500,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SingleChildScrollView(  // Added SingleChildScrollView here
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    height: 135,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(3))),
                    child: Column(
                      children: [
                        _buildBudgetHistory('Product Code', ':', 'EV379'),
                        const SizedBox(height: 2),
                        _buildBudgetHistory(
                            'Product', ':', 'Flipkart E Gift voucher'),
                        const SizedBox(height: 2),
                        _buildBudgetHistory('Vouchers key', ':', 'ABOO7'),
                        const SizedBox(height: 2),
                        _buildBudgetHistory('PIN', ':', '6682'),
                        const SizedBox(height: 2),
                        _buildBudgetHistory(
                            'Validity Date', ':', '04-03-2021'),
                      ],
                    )),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    height: 135,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                    ),
                    child: Column(
                      children: [
                        _buildBudgetHistory('Product Code', ':', 'EV379'),
                        const SizedBox(height: 2),
                        _buildBudgetHistory(
                            'Product', ':', 'Flipkart E Gift voucher'),
                        const SizedBox(height: 2),
                        _buildBudgetHistory('Vouchers key', ':', 'ABOO7'),
                        const SizedBox(height: 2),
                        _buildBudgetHistory('PIN', ':', '6682'),
                        const SizedBox(height: 2),
                        _buildBudgetHistory(
                            'Validity Date', ':', '04-03-2021'),
                      ],
                    )),
                   const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    height: 135,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                    ),
                    child: Column(
                      children: [
                        _buildBudgetHistory('Product Code', ':', 'EV379'),
                        const SizedBox(height: 2),
                        _buildBudgetHistory(
                            'Product', ':', 'Flipkart E Gift voucher'),
                        const SizedBox(height: 2),
                        _buildBudgetHistory('Vouchers key', ':', 'ABOO7'),
                        const SizedBox(height: 2),
                        _buildBudgetHistory('PIN', ':', '6682'),
                        const SizedBox(height: 2),
                        _buildBudgetHistory(
                            'Validity Date', ':', '04-03-2021'),
                      ],
                    )),
                 const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    height: 135,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                    ),
                    child: Column(
                      children: [
                        _buildBudgetHistory('Product Code', ':', 'EV379'),
                        const SizedBox(height: 2),
                        _buildBudgetHistory(
                            'Product', ':', 'Flipkart E Gift voucher'),
                        const SizedBox(height: 2),
                        _buildBudgetHistory('Vouchers key', ':', 'ABOO7'),
                        const SizedBox(height: 2),
                        _buildBudgetHistory('PIN', ':', '6682'),
                        const SizedBox(height: 2),
                        _buildBudgetHistory(
                            'Validity Date', ':', '04-03-2021'),
                      ],
                    )),
                 const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    height: 135,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                    ),
                    child: Column(
                      children: [
                        _buildBudgetHistory('Product Code', ':', 'EV379'),
                        const SizedBox(height: 2),
                        _buildBudgetHistory(
                            'Product', ':', 'Flipkart E Gift voucher'),
                        const SizedBox(height: 2),
                        _buildBudgetHistory('Vouchers key', ':', 'ABOO7'),
                        const SizedBox(height: 2),
                        _buildBudgetHistory('PIN', ':', '6682'),
                        const SizedBox(height: 2),
                        _buildBudgetHistory(
                            'Validity Date', ':', '04-03-2021'),
                      ],
                    )),
                 const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    height: 135,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(3)),
                    ),
                    child: Column(
                      children: [
                        _buildBudgetHistory('Product Code', ':', 'EV379'),
                        const SizedBox(height: 2),
                        _buildBudgetHistory(
                            'Product', ':', 'Flipkart E Gift voucher'),
                        const SizedBox(height: 2),
                        _buildBudgetHistory('Vouchers key', ':', 'ABOO7'),
                        const SizedBox(height: 2),
                        _buildBudgetHistory('PIN', ':', '6682'),
                        const SizedBox(height: 2),
                        _buildBudgetHistory(
                            'Validity Date', ':', '04-03-2021'),
                      ],
                    )),

                  const SizedBox(height: 10),
                  _buildDescription(),
                ],
              ),
            ),
          ),
        ),
      );
    },
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
            ImageConstant.backarrow,
            width: 27.w,
            height: 18.h,
          ),
        ),
      ),
      title: Text(
        'Voucher Details',
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
            color: appTheme.white,
          ),
        ),
      ),
    );
  }

  Widget _buildBudgetHistory(String label1, String separator, String label2) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 140,
              child: Text(
                label1,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: appTheme.black600,
                ),
              ),
            ),
            // const SizedBox(width: 5.0),
            Text(
              separator,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Text(
                label2,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: appTheme.black600,
                ),
              ),
            ),
          ],
        ),
        // SizedBox(height: 2),
      ],
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
                  'Filpkart app E Gift voucher It can be redeemed on the Filpkart app only Please download the same from Playstore and IOS Terms & Conditions: The eVoucher can be against sellers listed on on Flipkart.com The voucher key is valid for a period of 1 year from the date of issue. Voucher key should be redeemed before the expiry date mentioned on the vouchers. Please ensure you update your personal email id while placing orders as the Voucher Key would be sent via email. eVoucher can be redeemed by selecting the payment mode as e-Gift Voucher. It can NOT be redeemed against COD (Cash on Delivery) Orders. Voucher can be redeemed on all products except other eVouchers of Flipkart.com. One or more eVoucher keys can be redeemed against an order. eVoucher can also be clubbed with applicable Flipkart.com promotional codes. Customer can combine and use maximum of 9 eVouchers per order. eVouchers cannot be used to purchase other eVouchers. If the order value exceeds the eVoucher amount, the balance must be paid by Credit card / Debit card or Internet Banking. If the order value is less than the amount of the eVoucher, the outstanding balance (after deduction of order value) will reflect under eVoucher balance in the My Account section. eVoucher cannot be redeemed for cash or cheque. Flipkart.com is not responsible if an eVoucher is lost, stolen or used without permission. The vouchers ecodes will be sent by email on the email id provided while placing the order. We request you to follow the below; incase you do not receive the mail in your mail box- Check your spam mails. Mark the email as "Not Junk" and add the sender or domain\'s emails into "Safe sender list".',
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
