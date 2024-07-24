import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/resetPassword/controller/resetPassword_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/custom_image_view.dart';

class ResetPassWordScreen extends GetWidget<ResetPasswordController> {
  ResetPassWordScreen({super.key});
  ResetPasswordController resetPassword = ResetPasswordController();
  ResetPasswordController resetrePassword = ResetPasswordController();

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
                    fit: BoxFit.cover,
                  ),
                ),
                width: double.maxFinite,
                height: double.maxFinite,
              ),
              Positioned(
                top: 144.h,
                left: 15.w,
                right: 15.w,
                bottom: 50.h,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Container(
                    color: appTheme.white,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 19.h,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: CustomImageView(
                            imagePath: ImageConstant.imgLogo,
                            width: 182.w,
                            height: 29.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(
                          height: 25.h,
                        ),
                        Text(
                          'Forgot Password',
                          style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 20,
                              color: appTheme.black900,
                              fontWeight: FontWeight.bold),
                        ),
                        Obx(() {
                          return Visibility(
                            visible: controller.validateMsg.isNotEmpty,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                controller.validateMsg.value,
                                style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 12,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        }),
                        Obx(() {
                          // Check if the button is pressed and at least one field is empty
                          if (controller.isButtonPressed.value &&
                              controller.passwordController.text.isEmpty &&
                              controller.newpasswordController.text.isEmpty &&
                              controller.otpController.text.isEmpty) {
                            return Visibility(
                              visible: controller.isButtonPressed.value &&
                                      controller
                                          .passwordController.text.isEmpty &&
                                      controller
                                          .newpasswordController.text.isEmpty &&
                                      controller.otpController.text.isEmpty
                                  ? true
                                  : false,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  'All fields are required',
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontSize: 10,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            );
                          }

                          return const Visibility(
                            visible: false,
                            child: SizedBox(),
                          );
                        }),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                          ),
                          child: Text(
                            'Enter Your OTP',
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 10,
                                color: appTheme.gray90001,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: appTheme.gray900),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TextField(
                                  cursorColor: appTheme.black900,
                                  controller: controller.otpController,
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: appTheme.black600),
                                  decoration: const InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(left: 10, bottom: 10),
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (value) {
                                    controller.clearValidateMsg();
                                    if (controller
                                        .otpController.text.isNotEmpty) {
                                      controller.isButtonPressed.value = false;
                                    }
                                    controller.encryptedOtp = value;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.resendOtp();
                                  },
                                  child: Text(
                                    'Resend OTP',
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 12,
                                        color: appTheme.blue50,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                          ),
                          child: Text(
                            'Set Password',
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 10,
                                color: appTheme.gray90001,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: appTheme.gray900),
                          ),
                          child: Obx(() => TextField(
                                cursorColor: appTheme.black900,
                                onChanged: (value) {
                                  controller.clearValidateMsg();
                                  if (controller
                                      .passwordController.text.isNotEmpty) {
                                    controller.isButtonPressed.value = false;
                                  }
                                },
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: appTheme.black600),
                                controller: controller.passwordController,
                                obscureText: resetrePassword.isVisibele.value,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(left: 10, bottom: 10),
                                  border: InputBorder.none,
                                  suffixIcon: IconButton(
                                    icon: controller.isVisibele.value
                                        ? SvgPicture.asset(
                                            ImageConstant.passwordhide)
                                        : SvgPicture.asset(
                                            ImageConstant.passwordvisible),
                                    onPressed: () {
                                      resetrePassword.togglevisible();
                                    },
                                  ),
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                          ),
                          child: Text(
                            'Re-Enter New Password',
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 10,
                                color: appTheme.gray90001,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: appTheme.gray900),
                          ),
                          child: Obx(() => TextField(
                                cursorColor: appTheme.black900,
                                onChanged: (value) {
                                  controller.clearValidateMsg();
                                  if (controller
                                      .newpasswordController.text.isNotEmpty) {
                                    controller.isButtonPressed.value = false;
                                  }
                                },
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: appTheme.black600),
                                controller: controller.newpasswordController,
                                obscureText: resetrePassword.isObscure.value,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(left: 10, bottom: 10),
                                  border: InputBorder.none,
                                  suffixIcon: IconButton(
                                    icon: controller.isObscure.value
                                        ? SvgPicture.asset(
                                            ImageConstant.passwordhide)
                                        : SvgPicture.asset(
                                            ImageConstant.passwordvisible),
                                    onPressed: () {
                                      resetrePassword.toggleObscure();
                                    },
                                  ),
                                ),
                              )),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          width: 260,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // Check if all fields are empty
                              if (controller.otpController.text.isEmpty &&
                                  controller.passwordController.text.isEmpty &&
                                  controller
                                      .newpasswordController.text.isEmpty) {
                                // Display message prompting to fill all details
                                controller.isButtonPressed.value = true;
                              } else {
                                // If at least one field is filled, proceed with verification
                                controller.otpVerify();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            child: const Text(
                              'Save',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
