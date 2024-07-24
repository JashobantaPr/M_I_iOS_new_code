import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/campaign_calculatedpoints_programId/model/dropdown.dart';
import 'package:incentivesgit/presentation/rewards/bank_transfer_flexible/controller/bank_transfer_flexible_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class BankTransferFlexiScreen extends GetWidget<BankTransferFlexiController> {
  const BankTransferFlexiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        backgroundColor: appTheme.background,
        appBar: _customAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 14.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _bankData(),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Delivery Details',
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 12.sp,
                      color: appTheme.black600,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 22.h,
                ),
                _pointsconvert(),
                SizedBox(
                  height: 20.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
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
                              const MaterialStatePropertyAll(Size(138, 38))),
                      onPressed: () {},
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: appTheme.white,
                        ),
                      )),
                ),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _customAppBar() {
    return AppBar(
      title: Text(
        "View Details",
        style: TextStyle(
          color: appTheme.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
      ),
      backgroundColor: appTheme.rediconbackground,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: SvgPicture.asset(
          ImageConstant.arrowback,
          width: 26.75.w,
          height: 19.76.h,
        ),
      ),
    );
  }

  Widget _bankData() {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: appTheme.white, borderRadius: BorderRadius.circular(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 19.h,
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 124.w,
              height: 64.h,
              child: Text(
                'BANK TRANSFER',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.blue100),
              ),
            ),
          ),
          SizedBox(
            height: 27.h,
          ),
          Text(
            'Bank Transfer ( Flexible)',
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: appTheme.black600),
          ),
          SizedBox(
            height: 7.h,
          ),
          _buildDataRow('Reward Code', 'GV843'),
          SizedBox(
            height: 22.h,
          ),
          Text(
            'Select Wallet',
            style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 12.sp,
                color: appTheme.black600,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8.h,
          ),
          CustomDropdown<String?>(
            items: const ['Common Wallet'],
            value: null,
            onChanged: (value) {},
            getLabel: (String? value) {
              return '$value';
            },
            hintText: 'All',
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            'Description',
            style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 12.sp,
                color: appTheme.black600,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.h,
          ),
          Divider(
            color: appTheme.greydivider,
            indent: BorderSide.strokeAlignCenter,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Bank Transfer INR 1000',
            style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: appTheme.black600),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'Terms & Conditions:',
            style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: appTheme.black600),
          ),
          SizedBox(
            height: 15.h,
          ),
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Text(
                    '• ',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                      color: appTheme.black900,
                    ),
                  ),
                ),
                TextSpan(
                  text:
                      'The funds will be transferred to your bank account submitted by you. ',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.normal,
                    color: appTheme.black600,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(
                  child: Text(
                    '• ',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                      color: appTheme.black900,
                    ),
                  ),
                ),
                TextSpan(
                  text: 'The funds will transferred within 5 working days.',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.normal,
                    color: appTheme.black600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              width: 165.w,
              child: Text(
                label,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 12.sp,
                    color: appTheme.black600,
                    fontWeight: FontWeight.normal),
              )),
          const Text(':'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 19),
              child: Text(
                value,
                maxLines: 3,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
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

  Widget _pointsconvert() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: appTheme.white, borderRadius: BorderRadius.circular(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Enter the points to be converted in cash transfer:',
            style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 12.sp,
                color: appTheme.black600,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8.h,
          ),
          SizedBox(
            height: 48,
            width: double.maxFinite,
            child: TextField(
              cursorColor: appTheme.black600,
              keyboardType: TextInputType.number,
              maxLines: 1,
              controller: controller.numberController,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: appTheme.grey500)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: appTheme.grey500))),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Select the mode transfer',
            style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 12.sp,
                color: appTheme.black600,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Obx(() => Radio<String>(
                    value: 'Virtual Payment Address (NP)',
                    groupValue: controller.selectedProfileType.value,
                    onChanged: (value) {
                      controller.selectedProfileType.value = value!;
                    },
                  )),
              const SizedBox(width: 4),
              Text(
                'Virtual Payment Address (NP)',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
