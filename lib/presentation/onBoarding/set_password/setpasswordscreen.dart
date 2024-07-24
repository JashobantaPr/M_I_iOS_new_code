import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/custom_image_view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/utils/inapp_browser.dart';
import '../../../data/api_secvices/encryption.dart';
import 'controller/set_password_controller.dart';

class SetpassWordScreen extends GetWidget<SetPasswordController> {
  const SetpassWordScreen({super.key});

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
                top: 144,
                left: 15,
                right: 15,
                bottom: 50,
                child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 19.h,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: CustomImageView(
                            imagePath: ImageConstant.imgLogo,
                            width: 182,
                            height: 29,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          'New User Verification',
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
                                  controller: controller.otpController,
                                  cursorColor: appTheme.black900,
                                  keyboardType: TextInputType.number,
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
                                    if (controller
                                        .otpController.text.isNotEmpty) {
                                      controller.isButtonPressed.value = false;
                                    }
                                    controller.enteredText.value = value;
                                    controller.encryptedText.value =
                                        EncryptionService.encryptText(
                                            controller.enteredText.value);
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
                                cursorColor: appTheme.black600,
                                controller: controller.passwordController,
                                obscureText:
                                    controller.issetpasswordVisible.value,
                                onChanged: (value) {
                                  if (controller
                                      .passwordController.text.isNotEmpty) {
                                    controller.isButtonPressed.value = false;
                                  }
                                },
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Segoe UI',
                                    color: appTheme.black600,
                                    fontWeight: FontWeight.w400),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      const EdgeInsets.only(left: 10, top: 5),
                                  suffixIcon: IconButton(
                                    icon: controller.issetpasswordVisible.value
                                        ? SvgPicture.asset(
                                            ImageConstant.passwordhide)
                                        : SvgPicture.asset(
                                            ImageConstant.passwordvisible),
                                    onPressed: () {
                                      controller.toggleObscure();
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
                                cursorColor: appTheme.black600,
                                controller:
                                    controller.confirmPasswordController,
                                obscureText:
                                    controller.isconfirmpasswordVisible.value,
                                onChanged: (value) {
                                  if (controller.confirmPasswordController.text
                                      .isNotEmpty) {
                                    controller.isButtonPressed.value = false;
                                  }
                                },
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Segoe UI',
                                    color: appTheme.black600,
                                    fontWeight: FontWeight.w400),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding:
                                      const EdgeInsets.only(left: 10, top: 5),
                                  suffixIcon: IconButton(
                                    icon: controller
                                            .isconfirmpasswordVisible.value
                                        ? SvgPicture.asset(
                                            ImageConstant.passwordhide)
                                        : SvgPicture.asset(
                                            ImageConstant.passwordvisible),
                                    onPressed: () {
                                      controller.toggleObscure1();
                                    },
                                  ),
                                ),
                              )),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          child: buildTickmark(),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          child: buildSaveButton(),
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

  Widget buildSaveButton() {
    return Container(
      width: double.maxFinite,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
      ),
      child: ElevatedButton(
        onPressed: () {
          // Check if all fields are empty
          if (controller.otpController.text.isEmpty &&
              controller.passwordController.text.isEmpty &&
              controller.confirmPasswordController.text.isEmpty) {
            controller.validateMsg.value = 'All fields are required';
            return;
          }

          // Check if OTP and Password are both empty
          if (controller.otpController.text.isEmpty &&
              controller.passwordController.text.isEmpty) {
            controller.validateMsg.value = 'Password and OTP are required';
            return;
          }

          // Check if OTP is empty
          if (controller.otpController.text.isEmpty) {
            controller.validateMsg.value = 'OTP is required';
            return;
          }

          // Check OTP length
          if (controller.otpController.text.length < 6) {
            controller.validateMsg.value = 'Incorrect OTP';
            return;
          }

          // Check if Password is empty
          if (controller.passwordController.text.isEmpty) {
            controller.validateMsg.value = ' password is required';
            return;
          }

          // Check if Confirm Password is empty
          if (controller.confirmPasswordController.text.isEmpty) {
            controller.validateMsg.value = 'Confirm Password is required';
            return;
          }

          // Check if Password and Confirm Password match
          if (controller.passwordController.text !=
              controller.confirmPasswordController.text) {
            controller.validateMsg.value = 'Both Passwords should be match';
            return;
          }

          // Check if isSelected is false
          if (controller.isSelected.value == false) {
            showDialog(
              context: Get.context!,
              barrierDismissible: true,
              builder: (BuildContext context) {
                Future.delayed(const Duration(seconds: 1), () {
                  if (Navigator.of(context).canPop()) {
                    Navigator.of(context).pop();
                  }
                });
                return Padding(
                  padding: const EdgeInsets.only(top: 630),
                  child: AlertDialog(
                    backgroundColor: Colors.black.withOpacity(0.8),
                    content: const SizedBox(
                      height: 15,
                      width: 500,
                      child: Text(
                        'Please accept the Terms and Condition.',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
            return;
          }

          // If all validations passed, submit the form
          controller.onsubmit();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: const Text(
          'Save',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }

  Widget buildTickmark() {
    return SizedBox(
      height: 18,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(
            () => Checkbox(
              value: controller.isSelected.value,
              fillColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return appTheme.black900;
                } else {
                  return Colors.transparent;
                }
              }),
              checkColor: appTheme.white,
              onChanged: (value) {
                controller.toggleCheckbox();
                print('selectedValue${controller.isSelected.value}');
              },
              side: MaterialStateBorderSide.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return BorderSide(color: appTheme.gray90001, width: 1.5);
                } else {
                  return BorderSide(color: appTheme.gray90001, width: 1.5);
                }
              }),
            ),
          ),
          const SizedBox(width: 4),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'I accept the ',
                  style: TextStyle(fontSize: 10, color: appTheme.gray90001),
                ),
                TextSpan(
                  text: 'Terms & Conditions',
                  style: TextStyle(
                    fontSize: 10,
                    color: appTheme.blue50,
                    fontWeight: FontWeight.bold,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      showPopup();
                    },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void showPopup() {
    Get.dialog(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20.0), // Adjust the value as needed
          ),
          child: Dialog(
            child: MyWebView(),
          ),
        ),
      ),
    );
  }
}
