import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

import 'controller/password_reset_controller.dart';

class PasswordResetScreen extends GetWidget<PasswordResetController> {
  const PasswordResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: appTheme.rediconbackground));

    return ScreenUtilInit(
      builder: (context, _) {
        return Scaffold(
          appBar: _customAppBar(),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildCurrentPassword(),
                const SizedBox(height: 20),
                _buildNewPassword(),
                const SizedBox(height: 20),
                _buildReTypeNewPassword(),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1.0),
                  child: Divider(
                    color: appTheme.gray500,
                    thickness: 1.0,
                  ),
                ),
                const SizedBox(height: 15),
                _buildButtons(),
              ],
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
        'Password Reset',
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

  Widget _buildCurrentPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Enter Current Password',
          style: TextStyle(
            fontSize: 12,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.w400,
            color: appTheme.greytextcolour,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: appTheme.gray500),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Obx(() => Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.oldPasswordcontroller,
                      obscureText: !controller.currentPassword.value,
                      cursorColor: appTheme.black900,
                      style: TextStyle(color: appTheme.black900),
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      controller.currentPassword.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: appTheme.greytextcolour,
                    ),
                    onPressed: () {
                      controller.togglePasswordVisibility();
                    },
                  ),
                ],
              )),
        ),
      ],
    );
  }

  Widget _buildNewPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'New Password',
          style: TextStyle(
            fontSize: 12,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.w400,
            color: appTheme.greytextcolour,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: appTheme.gray500),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Obx(() => Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.newPasswordcontroller,
                      obscureText: !controller.newPasswordVisible.value,
                      cursorColor: appTheme.black900,
                      style: TextStyle(color: appTheme.black900),
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        border: InputBorder.none,
                      ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      controller.newPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: appTheme.greytextcolour,
                    ),
                    onPressed: () {
                      controller.toggleNewPasswordVisibility();
                    },
                  ),
                ],
              )),
        ),
      ],
    );
  }

  Widget _buildReTypeNewPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Retype New Password',
          style: TextStyle(
            fontSize: 12,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.w400,
            color: appTheme.greytextcolour,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: appTheme.gray500),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Obx(() => Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.confirmPasswordcontroller,
                      obscureText: !controller.retypenewPassword.value,
                      cursorColor: appTheme.black900,
                      style: TextStyle(color: appTheme.black900),
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        border: InputBorder.none,
                      ),
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      controller.retypenewPassword.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: appTheme.greytextcolour,
                    ),
                    onPressed: () {
                      controller.toggleReTypeNewPasswordVisibility();
                    },
                  ),
                ],
              )),
        ),
      ],
    );
  }

  Widget _buildButtons() {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                controller.changePassword();
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
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
              child: Text(
                'Submit',
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
