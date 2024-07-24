import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';

import '../../../routes/app_routes.dart';
import '../../../theme/theme_helper.dart';
import 'controller/otp_controller.dart';

class OrderOtpScreen extends GetWidget<OrderOtpController> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        backgroundColor: appTheme.redappbar,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Please Enter',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 24.sp,
                    color: appTheme.white),
              ),
              SizedBox(
                height: 45.h,
              ),
              SizedBox(
                width: 252,
                child: Text(
                  'The verification code received on your email id',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 15.sp,
                      color: appTheme.white),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              OtpTextField(
                numberOfFields: 6,
                borderColor: appTheme.white,
                focusedBorderColor: appTheme.white,
                showFieldAsBox: false,
                borderWidth: 4.0,
                clearText: true,
                textStyle: TextStyle(
                    color: appTheme.white, fontWeight: FontWeight.bold),
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {
                  if (verificationCode.length == 6) {
                    controller.verifyOtp(verificationCode);
                  }
                },
              ),
              SizedBox(
                height: 40.h,
              ),
              GestureDetector(
                onTap: () {
                  controller.resendOtp();
                },
                child: Text(
                  'Did\'t get code? RESEND',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 15.sp,
                      color: appTheme.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
