import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/forgetPassword/controller/forget_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/custom_image_view.dart';

class ForgetScreen extends GetWidget<forgetController> {
  const ForgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final TextEditingController phoneNumberController =
        TextEditingController(text: controller.mobileNo);
    // ignore: unused_local_variable
    controller.phoneNumberController.text = Get.arguments ?? '';
    print('');
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assetes/images/Login-backround.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 160,
            left: 15,
            right: 15,
            bottom: 120,
            child: Card(
              elevation: 4, // Adjust the elevation as needed
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    12), // Adjust the border radius as needed
              ),

              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 29,
                      width: 182,
                      child: CustomImageView(
                        imagePath:
                            'assetes/images/My-Incentives-Final-Logo_1.png',
                        width: 182,
                        height: 29,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 60,
                      child: Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 20,
                          color: appTheme.black900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
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
                    Obx(() {
                      return Visibility(
                        visible: controller.isButtonPressed.value &&
                            controller.captchaController.text.isEmpty,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            'Captcha code is required.',
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
                            controller.captchaController.text.isNotEmpty &&
                            controller.captchaController.text.toUpperCase() !=
                                controller.captcha.value.toUpperCase(),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            'Incorrect Captcha!',
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
                    SizedBox(
                      width: 260,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                        ),
                        child: Text(
                          'Mobile  number',
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 10,
                            color: appTheme.gray90001,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 260,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: appTheme.gray900),
                        color: Color(0xFFF0F0F0),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.bottomSheet(
                                countryListModel(),
                              );
                            },
                            child: Obx(
                              () => Visibility(
                                visible: controller.isFirstCharNumeric(
                                    controller.selectedNumber.value),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text(
                                    controller.selectedCountryId.value.isEmpty
                                        ? 'IN +91'
                                        : '${controller.selectedCountryName.value} +${controller.selectedCountryId.value}',
                                    style: TextStyle(
                                      color: appTheme.black900,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
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
                              padding:
                                  const EdgeInsets.only(left: 10, bottom: 6),
                              child: TextField(
                                readOnly: true,
                                controller: controller.phoneNumberController,
                                // onChanged: (value) {
                                //   controller.clearValidateMsg();
                                // },
                                //cursorColor: appTheme.black900,
                                // inputFormatters: [
                                //   ConditionalLengthInputFormatter(
                                //     maxLengthWhenNumeric: 10,
                                //     maxLengthWhenNotNumeric: 40,
                                //   ),
                                // ],
                                style: TextStyle(
                                  fontSize: 14,
                                  color: appTheme.black900,
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: InputDecoration(
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
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                        const SizedBox(width: 15),
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
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            width: 110,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: appTheme.gray900),
                              color: const Color.fromARGB(255, 234, 232, 232),
                            ),
                            child: Obx(
                              () => Center(
                                child: Text(
                                  controller.captcha.value,
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontSize: 16,
                                    color: appTheme.black900,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 18,
                          height: 18,
                          margin: const EdgeInsets.only(
                              left: 9, right: 15, bottom: 8),
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
                              onChanged: (newValue) {
                                if (newValue.isNotEmpty) {
                                  controller.clearValidateMsg();
                                  controller.isButtonPressed.value = false;
                                }
                                controller.captchaController.value =
                                    newValue as TextEditingValue;
                              },
                              controller: controller.captchaController,
                              cursorColor: appTheme.black900,
                              style: TextStyle(
                                  color: appTheme.black900,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ],
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
                          print('aaaaaa${controller.captcha.toUpperCase()}');
                          print(
                              'bbbbbbb${controller.captchaController.text.toUpperCase()}');
                          // Check if captcha field is empty
                          if (controller.captchaController.text.isEmpty) {
                            // Set flag indicating that button has been pressed and captcha is required
                            controller.isButtonPressed.value = true;
                          } else {
                            // Check if entered captcha is correct
                            if (controller.captcha.toUpperCase() ==
                                controller.captchaController.text
                                    .toUpperCase()) {
                              // Correct captcha entered, clear the error message
                              controller.clearValidateMsg();
                              // Proceed with OTP request
                              controller.newuservalidate();
                            } else {
                              // Incorrect captcha entered, display error message
                              controller
                                  .clearValidateMsg(); // Clear any previous error messages
                              controller.validateMsg.value =
                                  'Incorrect Captcha! Please try again.';
                              // Generate a new captcha
                              controller.generateCaptcha();
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Text(
                          'Submit',
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
    ));
  }

  Widget countryListModel() {
    return Container(
      color: Colors.white, // Set the background color to white
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
            child: Text(
              'Country List',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: appTheme.black900,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.getCountryData.value.length,
              itemBuilder: (context, index) {
                final country = controller.getCountryData.value[index];
                print('country$country');
                return GestureDetector(
                  onTap: () {
                    controller.handleSelectedCountry(
                        country.phonecode ?? '', country.iso ?? '');
                    Get.back();
                  },
                  child: SizedBox(
                    height: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                country.name ?? '',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: appTheme.black900,
                                ),
                              ),
                              Text(
                                ' +${country.phonecode ?? ''}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: appTheme.black900,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: appTheme.gray500,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
