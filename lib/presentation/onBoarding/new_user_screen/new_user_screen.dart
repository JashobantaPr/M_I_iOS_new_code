import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import '../../../routes/app_routes.dart';
import '../../../widgets/custom_image_view.dart';
import '../../../widgets/textValidation.dart';
import 'controller/new_user_controller.dart';

class NewUserScreen extends GetWidget<NewUserController> {
  const NewUserScreen({super.key});

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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.only(top: 39, left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                          visible: controller.isButtonPressed.value &&
                              controller.isMobileRegistered.value &&
                              controller.phoneNumberController.text.isEmpty,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              'Mobile Number is required',
                              style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 10,
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      }),
                      Obx(() {
                        return Visibility(
                          visible: controller.isButtonPressed.value &&
                              !controller.isMobileRegistered.value &&
                              controller.phoneNumberController.text.isEmpty &&
                              controller.captchaController.text.isEmpty &&
                              controller.validateMsg.isEmpty,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              'Email is required',
                              style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 10,
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      }),
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
                      // Obx(() {
                      //   return Visibility(
                      //     visible: controller.isButtonPressed.value &&
                      //         controller
                      //             .phoneNumberController.text.isNotEmpty &&
                      //         controller.captchaController.text
                      //             .isEmpty, // Check if captcha field is empty
                      //     child: Padding(
                      //       padding: const EdgeInsets.only(top: 5),
                      //       child: Text(
                      //         'Captcha Required !',
                      //         style: TextStyle(
                      //           fontFamily: GoogleFonts.poppins().fontFamily,
                      //           fontSize: 10,
                      //           color: Colors.red,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //     ),
                      //   );
                      // }),
                      // Obx(() {
                      //   return Visibility(
                      //     visible: controller.isButtonPressed.value &&
                      //         controller.captchaController.text
                      //             .isNotEmpty && // Captcha field is not empty
                      //         controller.captchaController.text.toUpperCase() !=
                      //             controller.captcha.value
                      //                 .toUpperCase(), // Captcha doesn't match the generated captcha
                      //     child: Padding(
                      //       padding: const EdgeInsets.only(top: 5),
                      //       child: Text(
                      //         'Incorrect Captcha!',
                      //         style: TextStyle(
                      //           fontFamily: GoogleFonts.poppins().fontFamily,
                      //           fontSize: 10,
                      //           color: Colors.red,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //     ),
                      //   );
                      // }),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Obx(
                              () => Radio(
                                value: true,
                                groupValue: controller.isMobileRegistered.value,
                                onChanged: (value) {
                                  if (value !=
                                      controller.isMobileRegistered.value) {
                                    controller.phoneNumberController.clear();
                                    controller.isMobileRegistered.value =
                                        value!;
                                    controller.clearValidateMsg();
                                  }
                                },
                                activeColor: appTheme.blue50,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Mobile Number',
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontSize: 13,
                                    color: appTheme.black900,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Select if you are registered with mobile number',
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontSize: 9,
                                      color: appTheme.gray90001,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 260,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: [
                              Obx(
                                () => Radio(
                                  value: false,
                                  groupValue:
                                      controller.isMobileRegistered.value,
                                  onChanged: (value) {
                                    if (value !=
                                        controller.isMobileRegistered.value) {
                                      // Clear text when switching from mobile to email
                                      controller.phoneNumberController.clear();
                                      controller.isMobileRegistered.value =
                                          value!;
                                      // Clear the error message
                                      controller.clearValidateMsg();
                                    }
                                  },
                                  activeColor: appTheme.blue50,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Email id',
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontSize: 12,
                                      color: appTheme.black900,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Select if you are registered with email id',
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 9,
                                        color: appTheme.gray90001,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 154,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                          ),
                          child: Obx(
                            () => Text(
                              controller.isMobileRegistered.value
                                  ? 'Mobile Number '
                                  : 'Email',
                              style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 10,
                                  color: appTheme.gray90001,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          //width: 260,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: appTheme.gray900),
                          ),
                          child: Row(
                            children: [
                              Obx(
                                () => GestureDetector(
                                    onTap: () {
                                      Get.bottomSheet(
                                        countryListModel(),
                                      );
                                    },
                                    child: controller.isMobileRegistered.value
                                        ? Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Text(
                                              controller.selectedCountryId.value
                                                      .isEmpty
                                                  ? 'IN +91'
                                                  : '${controller.selectedCountryName.value} +${controller.selectedCountryId.value}',
                                              style: TextStyle(
                                                color: appTheme.black900,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                              ),
                                            ))
                                        : SizedBox()),
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(bottom: 7, left: 6),
                                  child: TextField(
                                    controller:
                                        controller.phoneNumberController,
                                    onChanged: (value) {
                                      controller.clearValidateMsg();
                                    },
                                    cursorColor: appTheme.black900,
                                    inputFormatters: [
                                      ConditionalLengthInputFormatter(
                                        maxLengthWhenNumeric: 10,
                                        maxLengthWhenNotNumeric: 40,
                                      ),
                                    ],
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: appTheme.black900,
                                        fontWeight: FontWeight.bold),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(bottom: 10),
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                        fontSize: 10,
                                        color: appTheme.black900,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      SizedBox(
                        child: buildCaptch(),
                      ),
                      const SizedBox(height: 35),
                      Container(
                        width: double.maxFinite,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                            print(
                                'controller.isMobileRegistered.value${controller.isMobileRegistered.value}');
                            // Check if mobile number or email is provided
                            if (controller.phoneNumberController.text.isEmpty &&
                                controller.isMobileRegistered.value) {
                              // Mobile number is required when radio button for mobile is selected
                              controller.isButtonPressed.value = true;
                              controller.validateMsg.value = '';
                              return;
                            } else if (controller
                                    .phoneNumberController.text.isEmpty &&
                                !controller.isMobileRegistered.value) {
                              // Email is required when radio button for email is selected
                              controller.isButtonPressed.value = true;
                              controller.validateMsg.value =
                                  'Email id is required';
                              return;
                            }

                            // Validate mobile number or email format
                            if (!controller.isMobileRegistered.value &&
                                !controller.isValidEmail(
                                    controller.phoneNumberController.text)) {
                              controller.isButtonPressed.value = true;
                              controller.validateMsg.value = 'Invalid email';
                              return;
                            } else if (controller.isMobileRegistered.value &&
                                (!controller.isFirstCharNumeric(controller
                                        .phoneNumberController.text) ||
                                    controller.phoneNumberController.text
                                            .length !=
                                        10)) {
                              controller.isButtonPressed.value = true;
                              controller.validateMsg.value =
                                  'Invalid mobile number';
                              return;
                            }

                            if (controller.captchaController.text.isEmpty) {
                              controller.isButtonPressed.value = true;
                              controller.validateMsg.value =
                                  'Captcha code is required.';
                              return;
                            }

                            if (controller.captcha.toUpperCase().trim() ==
                                controller.captchaController.text
                                    .toUpperCase()
                                    .trim()) {
                              await controller.newUserLogin();
                            } else {
                              controller.isButtonPressed.value = true;
                              controller.validateMsg.value =
                                  'Incorrect Captcha!';
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
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500),
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
    );
  }

  Widget buildCaptch() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Code',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 10,
                    color: appTheme.gray90001,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Enter the captcha',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 10,
                    color: appTheme.gray90001,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                width: 110,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: appTheme.gray900),
                  color: Color.fromARGB(255, 234, 232, 232),
                ),
                child: Obx(
                  () => Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 31, vertical: 9),
                    child: Text(
                      controller.captcha.value,
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 16,
                        color: appTheme.black900,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Center(
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
            ),
            // const SizedBox(width: 35),
            Expanded(
              flex: 3,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: appTheme.gray900),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 35, bottom: 5),
                  child: TextField(
                    controller: controller.captchaController,
                    cursorColor: appTheme.black900,
                    style: TextStyle(
                        color: appTheme.black900,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 10),
                      border: InputBorder.none,
                    ),
                    onChanged: (_) {
                      // Clear the error message
                      controller.clearValidateMsg();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildNewUser() {
    return Container(
      width: 260,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          border: Border.all(color: appTheme.gray100)),
      child: ElevatedButton(
        onPressed: () {
          Get.toNamed(AppRoutes.newUserScreen);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Text(
          'New User',
          style: TextStyle(fontSize: 14, color: appTheme.black900),
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
                itemCount: controller.getCountryData.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(); // Add a divider after each item
                },
                itemBuilder: (context, index) {
                  final country = controller.getCountryData[index];
                  return GestureDetector(
                    onTap: () {
                      controller.handleSelectedCountry(
                        country.phonecode ?? '',
                        country.iso ?? '',
                        index,
                      );
                    },
                    child: Container(
                      height: 50,
                      color: controller.selectedIndex.value == index
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
                                  color: controller.selectedIndex.value == index
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
                                color: controller.selectedIndex.value == index
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
}
