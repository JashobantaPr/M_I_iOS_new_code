import 'package:expandable/expandable.dart';
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
import 'package:incentivesgit/presentation/typeF_screens/earnedpoints_viewdetails/controller/earnedpoints_viewdetails_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class EarnedPointsViewDetailsScreen
    extends GetWidget<EarnedPointsViewDetailsController> {
  const EarnedPointsViewDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: appTheme.rediconbackground),
    );

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) {
        return Scaffold(
          appBar: _customAppBar(),
          body: Container(
            width: 385,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  _buildTransactionDetails(),
                  const SizedBox(height: 10),
                  _buildReferralDetails(),
                  const SizedBox(height: 10),
                  _buildPurchaseDetails()
                ],
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
        'View Details',
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

  Widget _buildTransactionDetails() {
    final EarnedPointsViewDetailsController controller =
        Get.put(EarnedPointsViewDetailsController());

    Widget transactionTypeRow(String label1, String separator, String label2) {
      return Row(
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
                color: appTheme.cyan800,
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Text(
            separator,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: appTheme.cyan800,
            ),
          ),
          const SizedBox(width: 25.0),
          Expanded(
            child: Text(
              label2,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: appTheme.cyan800,
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      );
    }

    return Obx(() => Container(
          width: 330,
          decoration: BoxDecoration(
            border: Border.all(
              color: appTheme.grey500,
              width: 2,
            ),
          ),
          child: Column(
            children: [
              Container(
                color: appTheme.grey500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Text(
                        'Transaction Details',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          color: const Color(0xFF222222),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Obx(
                        () => InkWell(
                          onTap: () {
                            controller.toggleExpansion();
                            print(
                                'jhcfxdfcgvhbjkl${controller.isExpanded.value}');
                          },
                          child: Icon(
                            controller.isExpanded.value
                                ? Icons.keyboard_arrow_up_outlined
                                : Icons.keyboard_arrow_down,
                            color: appTheme.greydownarrow,
                            size: 35,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (controller.isExpanded.value)
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      transactionTypeRow('Transaction Type', ':', 'Credit'),
                      transactionTypeRow('Transaction Date', ':', '15-09-2023'),
                      transactionTypeRow(
                          'Transaction Code', ':', 'T00006668297'),
                      transactionTypeRow('To', ':', 'Boris Miller'),
                      transactionTypeRow('From', ':', 'Wazirx'),
                      transactionTypeRow('Points', ':', '1,500'),
                      transactionTypeRow('Expiry Date', ':', '30-11-2023'),
                      transactionTypeRow('Category', ':', 'Program'),
                      transactionTypeRow(
                          'Campaign Name', ':', 'FR type A test'),
                      transactionTypeRow('Description', ':',
                          'Points distributed from category - FR type A test - po'),
                      transactionTypeRow('Additional Information', ':', '-'),
                    ],
                  ),
                ),
            ],
          ),
        ));
  }

  Widget _buildReferralDetails() {
    return Container(
      width: 330,
      height: 38,
      color: appTheme.grey500,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Referral Details',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: const Color(0xFF222222),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_forward_ios,
                  color: appTheme.greydownarrow,
                  size: 22,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPurchaseDetails() {
    return Container(
      width: 330,
      height: 38,
      color: appTheme.grey500,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Purchase Details',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: const Color(0xFF222222),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Row(
              children: [
                Icon(
                  Icons.arrow_forward_ios,
                  color: appTheme.greydownarrow,
                  size: 22,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
