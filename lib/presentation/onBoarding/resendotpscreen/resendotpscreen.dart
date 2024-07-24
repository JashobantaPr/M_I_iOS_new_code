import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/custom_image_view.dart';
import 'controller/resendotpcontroller.dart';

class ResendOtpScreen extends GetWidget<ResendOtpController> {
  const ResendOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageConstant.background),
                    fit: BoxFit.fill,
                  ),
                ),
                width: double.infinity,
                height: double.infinity,
              ),
              Positioned(
                  top: 184.h,
                  left: 15.w,
                  right: 15.w,
                  bottom: 124.h,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: appTheme.white,
                        borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(top: 19.h, left: 59, right: 59),
                          child: CustomImageView(
                            imagePath: ImageConstant.imgLogo,
                            width: 182.w,
                            height: 29.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          'User verification Process',
                          style: GoogleFonts.poppins(
                              fontSize: 20.sp,
                              color: appTheme.black900,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Obx(() {
                          if (controller.validateMsg.isNotEmpty) {
                            return Visibility(
                              visible: true,
                              child: Text(controller.validateMsg.value,
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500,
                                  )),
                            );
                          }
                          return const Visibility(
                              visible: false, child: SizedBox());
                        }),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 12,
                          ),
                          child: Text('Enter the OTP you have received.',
                              style: GoogleFonts.poppins(
                                fontSize: 10.sp,
                                color: appTheme.gray90001,
                                fontWeight: FontWeight.w600,
                                fontStyle: FontStyle.italic,
                              )),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 40.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: appTheme.gray900),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: controller.otpController,
                                  cursorColor: appTheme.black900,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    controller.clearValidateMsg();
                                  },
                                  style: TextStyle(
                                    color: appTheme.black900,
                                    fontSize: 14,
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    isCollapsed: true,
                                    contentPadding: EdgeInsets.only(left: 20.w),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  controller.resendOTP();
                                },
                                child: Text("Resend OTP",
                                    style: GoogleFonts.poppins(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        color: appTheme.blue50)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 22),
                        Obx(() {
                          return AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            child: controller.isLoading.value
                                ? _buildLoadingButton()
                                : _buildNormalButton(),
                          );
                        }),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingButton() {
    return Center(
      child: Container(
        width: 40,
        height: 40,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.black,
        ),
        child: const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      ),
    );
  }
 
  Widget _buildNormalButton() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: double.maxFinite,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
        ),
        child: ElevatedButton(
          onPressed: () {
            controller.onsubmit();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Text('Submit',
              style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: appTheme.white)),
        ),
      ),
    );
  }
}
