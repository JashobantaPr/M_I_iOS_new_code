import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/custom_image_view.dart';

import 'controller/loginPassword_controller.dart';

class LoginWithPassword extends GetWidget<PasswordLoginController> {
  const LoginWithPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
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
              top: 100,
              left: 15,
              right: 15,
              bottom: 10,
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 19,
                        ),
                        child: Align(
                          alignment: Alignment.center,
                          child: CustomImageView(
                            imagePath: ImageConstant.imgLogo,
                            width: 182,
                            height: 29,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Login',
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 20,
                            color: appTheme.black900,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Obx(() {
                        return Visibility(
                          visible: controller.validateMsg.isNotEmpty,
                          child: Text(
                            controller.validateMsg.value,
                            style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 10,
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }),
                      SizedBox(
                        height: 10.h,
                      ),
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 21, // Adjust width as needed
                              height: 11.5, // Adjust height as needed
                              child: SvgPicture.asset(
                                'assetes/images/arrow-narrow-left-svgrepo-com.svg',
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'Back',
                              style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 10,
                                color: appTheme.black900,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 260,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                          ),
                          child: Text(
                            controller.mobileNo.contains('@')
                                ? 'Email'
                                : 'Mobile  number',
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 10,
                                color: appTheme.gray90001,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: appTheme.gray900),
                          color: const Color.fromARGB(255, 234, 232, 232),
                        ),
                        child: Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Visibility(
                                  visible: controller
                                      .isFirstCharNumeric(controller.mobileNo),
                                  child: Text(
                                    'IN +91',
                                    style: TextStyle(
                                      color: appTheme.black900,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: TextField(
                                  showCursor: false,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(bottom: 11),
                                      border: InputBorder.none,
                                      hintText: controller.mobileNo,
                                      hintStyle: TextStyle(
                                          fontSize: 14,
                                          color: appTheme.black900,
                                          fontWeight: FontWeight.bold,
                                          height: 1.8)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                              ),
                              child: Text(
                                'Password',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: appTheme.black900,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 25),
                        ],
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
                              obscureText: controller.isVisibele.value,
                              onChanged: (value) {
                                //  controller.clearValidateMsg();
                              },
                              textAlignVertical: TextAlignVertical.top,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 14,
                                color: appTheme.black900,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding:
                                    const EdgeInsets.only(left: 10, top: 5),
                                suffixIcon: IconButton(
                                  icon: controller.isVisibele.value
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
                      const SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 0),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                AppRoutes.forgetpassword,
                                arguments: controller.mobileNo,
                              );
                            },
                            child: Text(
                              'Forgot Password ?',
                              style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 12,
                                color: appTheme.blue50,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Obx(() {
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: controller.isLoading.value
                              ? _buildLoadingButton()
                              : _buildNormalButton(),
                        );
                      }),
                      const SizedBox(height: 30),
                      SizedBox(
                        child: buildOrline(),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        child: buildNewUser(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOrline() {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: appTheme.gray500, // Set the color of the divider
            indent: 3.0,
            endIndent: 4.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Text(
            'OR',
            style: TextStyle(
                fontSize: 14,
                color: appTheme.black900,
                fontWeight: FontWeight.w700), // Adjust the text style as needed
          ),
        ),
        Expanded(
          child: Divider(
            color: appTheme.gray500, // Set the color of the divider
            indent: 4.0,
            endIndent: 3.0,
          ),
        ),
      ],
    );
  }

  Widget buildNewUser() {
    return SizedBox(
      width: double.maxFinite,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          Get.toNamed(AppRoutes.loginOtp, arguments: controller.mobileNo);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.gray900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Text(
          'Login with OTP',
          style: TextStyle(
              fontSize: 12,
              color: appTheme.black900,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget _buildNormalButton() {
    return Container(
      width: double.maxFinite,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
      ),
      child: ElevatedButton(
        onPressed: () async {
          await controller.onSubmit();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: const Text(
          'Login',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
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
}
