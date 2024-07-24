import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/help&support/customer_support_4/controller/customer_support_4_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class HelpandSupportCustomerSupport4Screen
    extends GetWidget<HelpandSupportCustomerSupport4Controller> {
  const HelpandSupportCustomerSupport4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0XFFE41C39),
      child: Scaffold(
        backgroundColor: appTheme.white,
        appBar: AppBar(
          backgroundColor: const Color(0XFFE41C39),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: SvgPicture.asset(
              ImageConstant.arrowback,
              width: 26.75.w,
              height: 19.76.h,
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 20),
            _buildHelpAndSupport(),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Divider(
                color: appTheme.gray500,
                thickness: 1.0,
              ),
            ),
            SizedBox(height: 15),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpAndSupport() {
    return Column(
      children: [
        Container(
          alignment: Alignment.topCenter,
          padding: const EdgeInsets.only(top: 40.0),
          child: const CircleAvatar(
            backgroundColor: Color(0xFF008000),
            radius: 55.0,
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 75.0,
            ),
          ),
        ),
        const SizedBox(height: 35),
        Text(
          'Thank you',
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.poppins().fontFamily,
            color: appTheme.black600,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 15),
        Text(
          'Ticket is raised successfully.',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
            fontFamily: GoogleFonts.poppins().fontFamily,
            color: appTheme.black600,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildButtons() {
    return Column(
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Get.back();
                Get.back();
                Get.back();
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(appTheme.redappbar),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(
                    color: Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(horizontal: 38, vertical: 13),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                ),
              ),
              child: Text(
                'Ok',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
