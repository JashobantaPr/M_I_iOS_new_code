import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/custom_image_view.dart';
import 'controller/loginOtp_controller.dart';

class OtpScreen extends GetWidget<LoginOtpController> {
  const OtpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              bottom: 77.h,
              left: 15.w,
              right: 15.w,
              top: 144.h,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 19, left: 59, right: 59),
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
                        'Login With OTP',
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 20.sp,
                            color: appTheme.black900,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
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
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Obx(() {
                        if (controller.isButtonPressed.value &&
                            controller.captchaController.text.isEmpty) {
                          return Visibility(
                            visible: controller.isButtonPressed.value &&
                                controller.captchaController.text.isEmpty,
                            child: Text(
                              'Captcha code is required.',
                              style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 10,
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        } else if (controller.isButtonPressed.value &&
                            controller.captchaController.text !=
                                controller.captcha.value) {
                          return Visibility(
                            visible: controller.isButtonPressed.value &&
                                controller.captchaController.text !=
                                    controller.captcha.value,
                            child: Text(
                              'Incorrect captcha !',
                              style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 10,
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }
                        return const Visibility(
                            visible: false, child: SizedBox());
                      }),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: Text(
                          controller.receivedMobileNo!.contains('@')
                              ? 'Email'
                              : 'Mobile number',
                          style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 10.sp,
                              color: appTheme.gray90001,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Visibility(
                                  visible: controller.isFirstCharNumeric(
                                      controller.receivedMobileNo!),
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
                                padding:
                                    const EdgeInsets.only(left: 8, bottom: 1),
                                child: TextField(
                                  showCursor: false,
                                  readOnly: true,
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(bottom: 10),
                                      border: InputBorder.none,
                                      hintText: controller.receivedMobileNo,
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: appTheme.black900,
                                        fontWeight: FontWeight.bold,
                                      )),
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
                                'Code',
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontSize: 10,
                                    color: appTheme.gray90001,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 20,
                              ),
                              child: Text(
                                'Enter the captcha',
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontSize: 10,
                                    color: appTheme.gray90001,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: appTheme.gray900),
                                color: const Color.fromARGB(255, 234, 232, 232),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Center(
                                    child: Obx(
                                      () => Center(
                                        child: Text(
                                          controller.captcha.value,
                                          style: TextStyle(
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily,
                                            fontSize: 16.sp,
                                            color: appTheme.black600,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 18.h,
                            margin: const EdgeInsets.only(left: 9, right: 15),
                            child: GestureDetector(
                              onTap: () {
                                controller.generateCaptcha();
                              },
                              child: Icon(
                                Icons.autorenew,
                                color: appTheme.gray90001,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: 40,
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: appTheme.gray900),
                              ),
                              child: TextField(
                                textAlign: TextAlign.center,
                                controller: controller.captchaController,
                                cursorColor: appTheme.black900,
                                style: TextStyle(
                                    color: appTheme.black900,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                                onChanged: (newValue) {
                                  if (controller
                                      .captchaController.text.isNotEmpty) {
                                    controller.isButtonPressed.value = false;
                                  }
                                  controller.selectedNumber.value = newValue;
                                },
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 17),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget countryListModel() {
    return Container(
      color: Colors.white, // Set the background color to white
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Obx(
              () => ListView.separated(
                // Use ListView.separated to add dividers
                itemCount: controller.countryData.getCountryData.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(); // Add a divider after each item
                },
                itemBuilder: (context, index) {
                  final country = controller.countryData.getCountryData[index];
                  return GestureDetector(
                    onTap: () {
                      controller.countryData.handleSelectedCountry(
                        country.phonecode ?? '',
                        country.iso ?? '',
                        index,
                      );
                    },
                    child: Container(
                      height: 50,
                      color: controller.countryData.selectedIndex.value == index
                          ? appTheme
                              .blue50 // Apply blue color if country is selected
                          : null,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              // Use Expanded for the country name to take the available space
                              child: Text(
                                country.name ?? '',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: controller.countryData.selectedIndex
                                              .value ==
                                          index
                                      ? Colors
                                          .white // Apply white text color if country is selected
                                      : appTheme
                                          .black900, // Apply black text color if country is not selected
                                ),
                              ),
                            ),
                            Text(
                              ' +${country.phonecode ?? ''}',
                              style: TextStyle(
                                fontSize: 15,
                                color: controller
                                            .countryData.selectedIndex.value ==
                                        index
                                    ? Colors
                                        .white // Apply white text color if country is selected
                                    : appTheme
                                        .black900, // Apply black text color if country is not selected
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
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
    return Container(
      width: double.maxFinite,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
      ),
      child: ElevatedButton(
        onPressed: () {
          if (controller.isButtonPressed.value &&
              controller.captchaController.text != controller.captcha.value) {
            controller.isButtonPressed.value = true;
          } else if (controller.captcha.value.toUpperCase() ==
              controller.captchaController.text.toUpperCase()) {
            controller.newUserLogin();
          } else {
            controller.isButtonPressed.value = true;
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: const Text(
          'Request OTP',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
