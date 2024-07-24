// import 'package:country_pickers/country.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:incentivesgit/core/app_export.dart';
// import 'package:incentivesgit/routes/app_routes.dart';
// import 'package:incentivesgit/theme/theme_helper.dart';
// import '../../../widgets/custom_image_view.dart';
// import '../../../widgets/textValidation.dart';
// import 'controller/login_controller.dart';

// // ignore_for_file: must_be_immutable
// class LoginScreen extends GetWidget<LoginController> {
//   LoginScreen({super.key});

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     print('Phone Number: ${controller.phoneNumberController.text}');

//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         body: Stack(
//           children: [
//             Container(
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(
//                       'assetes/images/Login-backround.png'), // Corrected asset path
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               width: double.maxFinite,
//               height: double.maxFinite,
//             ),
//             Center(
//               child: Container(
//                 width: 300,
//                 height: 500,
//           decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(6),
//                 ),
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     SizedBox(
//                       height: 29,
//                       width: 182,
//                       child: CustomImageView(
//                         imagePath:
//                             'assetes/images/My-Incentives-Final-Logo_1.png',
//                         width: 182,
//                         height: 29,
//                         fit: BoxFit.contain,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     SizedBox(
//                       width: 60,
//                       child: Text(
//                         'Login',
//                         style: TextStyle(
//                             fontFamily: GoogleFonts.poppins().fontFamily,
//                             fontSize: 20,
//                             color: appTheme.black900,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 230,
//                       child: Padding(
//                         padding: const EdgeInsets.only(
//                           top: 20,
//                         ),
//                         child: Text(
//                           'Please enter mobile number only if you have registered with us using mobile number.',
//                           style: TextStyle(
//                             fontFamily: GoogleFonts.poppins(
//                               fontWeight: FontWeight.w400,
//                               fontStyle: FontStyle.italic,
//                             ).fontFamily,
//                             fontSize: 10,
//                             color: appTheme.black900,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 154,
//                       child: Padding(
//                         padding: const EdgeInsets.only(
//                           top: 20,
//                         ),
//                         child: Text(
//                           'Mobile phone number or email',
//                           style: TextStyle(
//                               fontFamily: GoogleFonts.poppins().fontFamily,
//                               fontSize: 10,
//                               color: appTheme.gray90001,
//                               fontWeight: FontWeight.normal),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Container(
//                         width: 260,
//                         height: 40,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                           border: Border.all(color: appTheme.gray900),
//                         ),
//                         child: Row(
//                           children: [
//                             GestureDetector(
//                                 onTap: () {
//                                   Get.bottomSheet(
//                                     countryListModel(),
//                                   );
//                                 },
//                                 child: Obx(
//                                   () => Visibility(
//                                     visible: controller.isFirstCharNumeric(
//                                         controller.selectedNumber.value),
//                                     child: Padding(
//                                         padding: const EdgeInsets.only(left: 8),
//                                         child: Text(
//                                           controller.selectedCountryId.value
//                                                   .isEmpty
//                                               ? 'IN +91'
//                                               : '${controller.selectedCountryName.value} +${controller.selectedCountryId.value}',
//                                           style: TextStyle(
//                                             color: appTheme.blue50,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         )),
//                                   ),
//                                 )),
//                                 const SizedBox(width: 5,),
//                             Expanded(
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.only(bottom: 7, left: 6),
//                                 child: TextField(
//                                   controller: controller.phoneNumberController,
//                                   cursorColor: appTheme.black900,
//                                   inputFormatters: [
//                                     ConditionalLengthInputFormatter(
//                                       maxLengthWhenNumeric: 10,
//                                       maxLengthWhenNotNumeric: 40,
//                                     ),
//                                   ],
//                                   style: TextStyle(
//                                       fontSize: 14,
//                                       color: appTheme.black900,
//                                       fontWeight: FontWeight.bold),
//                                   onChanged: (newValue) {
//                                     controller.selectedNumber.value = newValue;
//                                     print(
//                                         'Value changed: ${controller.selectedNumber}');
//                                   },
//                                   decoration: InputDecoration(
//                                       border: InputBorder.none,
//                                       hintStyle: TextStyle(
//                                           fontSize: 10,
//                                           color: appTheme.black900,
//                                           fontWeight: FontWeight.bold)),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         )),
//                     const SizedBox(height: 25),
//                     Container(
//                       width: 260,
//                       height: 40,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(2),
//                       ),
//                       child: ElevatedButton(
//                         onPressed: () {
//                           controller.onSubmitlogin();
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.black,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(5),
//                           ),
//                         ),
//                         child: const Text(
//                           'Next',
//                           style: TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.w500),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 25),
//                     SizedBox(
//                       child: buildOrline(),
//                     ),
//                     const SizedBox(height: 25),
//                     SizedBox(
//                       child: buildNewUser(),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildOrline() {
//     return Row(
//       children: [
//         Expanded(
//           child: Divider(
//             color: appTheme.gray500, // Set the color of the divider
//             indent: 3.0,
//             endIndent: 4.0,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 5, right: 5),
//           child: Text(
//             'OR',
//             style: TextStyle(
//                 fontSize: 14,
//                 color: appTheme.black900,
//                 fontWeight: FontWeight.w500), // Adjust the text style as needed
//           ),
//         ),
//         Expanded(
//           child: Divider(
//             color: appTheme.gray500, // Set the color of the divider
//             indent: 4.0,
//             endIndent: 3.0,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget buildNewUser() {
//     return Container(
//       width: 260,
//       height: 40,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5),
//           border: Border.all(color: appTheme.gray500)),
//       child: ElevatedButton(
//         onPressed: () {
//           Get.toNamed(AppRoutes.newUserScreen);
//         },
//         style: ElevatedButton.styleFrom(
//           backgroundColor: appTheme.grey,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(5),
//           ),
//         ),
//         child: Text(
//           'New User',
//           style: TextStyle(
//               fontSize: 14,
//               color: appTheme.black900,
//               fontWeight: FontWeight.w500),
//         ),
//       ),
//     );
//   }

//   Widget countryListModel() {
//     return Container(
//       color: appTheme.gray100, // Set the background color to white
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 10, top: 20, bottom: 10),
//             child: Text(
//               'Country List',
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: appTheme.black900,
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: controller.getCountryData.value.length,
//               itemBuilder: (context, index) {
//                 final country = controller.getCountryData.value[index];
//                 print('country$country');
//                 return GestureDetector(
//                   onTap: () {
//                     controller.handleSelectedCountry(
//                         country.phonecode ?? '', country.iso ?? '');
//                     Get.back();
//                   },
//                   child: SizedBox(
//                     height: 50,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(left: 10, bottom: 15),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Text(
//                                 country.name ?? '',
//                                 style: TextStyle(
//                                     fontSize: 15,
//                                     color: appTheme.black900,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                               Text(
//                                 ' +${country.phonecode ?? ''}',
//                                 style: TextStyle(
//                                     fontSize: 15,
//                                     color: appTheme.black900,
//                                     fontWeight: FontWeight.w500),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                             ],
//                           ),
//                         ),
//                         Divider(
//                           color: appTheme.gray500,
//                         )
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:country_pickers/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import '../../../widgets/custom_image_view.dart';
import '../../../widgets/textValidation.dart';
import 'controller/login_controller.dart';

// ignore_for_file: must_be_immutable
class LoginScreen extends GetWidget<LoginController> {
  LoginScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assetes/images/Login-backround.png'),
                  fit: BoxFit.cover,
                ),
              ),
              width: double.maxFinite,
              height: double.maxFinite,
            ),
            Positioned(
              top: 150,
              left: 15,
              right: 15,
              bottom: 90,
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
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      SizedBox(
                        width: 60,
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 20,
                              color: appTheme.black900,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        width: 230,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                          ),
                          child: Text(
                            'Please enter mobile number only if you have registered with us using mobile number.',
                            style: TextStyle(
                              fontFamily: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic,
                              ).fontFamily,
                              fontSize: 10,
                              color: appTheme.black900,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Add the error message text widget
                      Obx(() {
                        return Visibility(
                          visible: controller.isButtonPressed.value &&
                              controller.phoneNumberController.text.isEmpty,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(
                              controller.phoneNumberController.text.isEmpty
                                  ? 'Email id or Mobile Number is required'
                                  : '',
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
                        return Visibility(
                          visible: controller.validateMsg.isNotEmpty,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 0),
                            child: Text(
                              controller.validateMsg.value,
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

                      SizedBox(
                        width: 154,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                          ),
                          child: Text(
                            'Mobile phone number or email',
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 10,
                                color: appTheme.gray90001,
                                fontWeight: FontWeight.normal),
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
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: Text(
                                            controller.selectedCountryId.value
                                                    .isEmpty
                                                ? 'IN +91'
                                                : '${controller.selectedCountryName.value} +${controller.selectedCountryId.value}',
                                            style: TextStyle(
                                              color: appTheme.blue50,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )),
                                    ),
                                  )),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 6),
                                  child: TextField(
                                    controller:
                                        controller.phoneNumberController,
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
                                      fontWeight: FontWeight.bold,
                                    ),
                                    onChanged: (newValue) {
                                      controller.clearValidateMsg();
                                      controller.selectedNumber.value =
                                          newValue;
                                    },
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.only(bottom: 10),
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                        fontSize: 10,
                                        color: appTheme.black900,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      const SizedBox(height: 25),
                      Container(
                        width: 260,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // Clear the error message
                            controller.isButtonPressed.value = false;

                            // Check if email or mobile number field is empty
                            if (controller.phoneNumberController.text.isEmpty) {
                              // Set flag indicating that button has been pressed and email or mobile number is required
                              controller.isButtonPressed.value = true;
                            } else {
                              // Proceed with navigation
                              controller.onSubmitlogin();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        child: buildOrline(),
                      ),
                      const SizedBox(height: 25),
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
                fontWeight: FontWeight.w500), // Adjust the text style as needed
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
    return Container(
      width: 260,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: appTheme.gray500)),
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
          style: TextStyle(
              fontSize: 12,
              color: appTheme.black900,
              fontWeight: FontWeight.w500),
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
