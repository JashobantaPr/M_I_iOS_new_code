import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/homebottombar/account/controller/accountcontroller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/dialoguebox.dart';

class AccountScreen extends GetWidget<AccountController> {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 204, 204),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 226,
            width: double.maxFinite,
            color: appTheme.rediconbackground,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Account',
                    style: TextStyle(
                        color: appTheme.white,
                        fontSize: 18,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 9.h),
                Obx(() {
                  return Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: appTheme.white, width: 1),
                      ),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(
                            '${Url.profileimageUrl}${controller.profilePic.toString()}'),
                      ),
                    ),
                  );
                }),
                SizedBox(
                  height: 18.h,
                ),
                Obx(() {
                  return Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${controller.firstName} ${controller.lastName}',
                      style: TextStyle(
                          color: appTheme.white,
                          fontSize: 14,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w500),
                    ),
                  );
                })
              ],
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                const SizedBox(height: 20),
                _buildBirthdays(),
                const SizedBox(height: 16),
                _buildAnniversaries(),
                const SizedBox(height: 16),
                _buildNews(),
                const SizedBox(height: 16),
                _buildKnowledgeCenter(),
                const SizedBox(height: 16),
                _buildGallery(),
                const SizedBox(height: 16),
                _buildCertificates(),
                const SizedBox(height: 16),
                _buildQuizzes(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBirthdays() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              ImageConstant.birthdays,
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.myprofile);
                    },
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'My Profile',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                          color: appTheme.greydownarrow,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 17),
                  const Divider(
                    color: Color(0xFFD5D5D5),
                    thickness: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAnniversaries() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.mywallettransaction);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                ImageConstant.anniversaries,
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'My Wallet',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                          color: appTheme.greydownarrow,
                        ),
                      ],
                    ),
                    const SizedBox(
                        height: 17), // Add space between text and divider

                    const Divider(
                      // Add Divider widget here
                      color: Color(
                          0xFFD5D5D5), // Customize the color as per your requirement
                      thickness: 1, // Set the thickness of the divider
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNews() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.mybudgetbalance);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                ImageConstant.news,
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'My Budget',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                          color: appTheme.greydownarrow,
                        ),
                      ],
                    ),
                    const SizedBox(
                        height: 17), // Add space between text and divider

                    const Divider(
                      // Add Divider widget here
                      color: Color(
                          0xFFD5D5D5), // Customize the color as per your requirement
                      thickness: 1, // Set the thickness of the divider
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildKnowledgeCenter() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.myorders);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                ImageConstant.knowledgecenter,
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'My Order',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                          color: appTheme.greydownarrow,
                        ),
                      ],
                    ),
                    const SizedBox(
                        height: 17), // Add space between text and divider

                    const Divider(
                      // Add Divider widget here
                      color: Color(
                          0xFFD5D5D5), // Customize the color as per your requirement
                      thickness: 1, // Set the thickness of the divider
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGallery() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.myapprovaltabbar);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                ImageConstant.gallery,
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Approvals',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                          color: appTheme.greydownarrow,
                        ),
                      ],
                    ),
                    const SizedBox(
                        height: 17), // Add space between text and divider

                    const Divider(
                      // Add Divider widget here
                      color: Color(
                          0xFFD5D5D5), // Customize the color as per your requirement
                      thickness: 1, // Set the thickness of the divider
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCertificates() {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.helpandsupportlandingpage);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                ImageConstant.certificates,
                width: 20,
                height: 20,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Help & Support',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                          color: appTheme.greydownarrow,
                        ),
                      ],
                    ),
                    const SizedBox(
                        height: 17), // Add space between text and divider

                    const Divider(
                      // Add Divider widget here
                      color: Color(
                          0xFFD5D5D5), // Customize the color as per your requirement
                      thickness: 1, // Set the thickness of the divider
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuizzes(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              ImageConstant.certificates,
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomDialog(
                            title: 'Confirmation',
                            message: 'Are you sure you want to exit?',
                            onYesPressed: () async {
                              bool userTokenDeleted =
                                  await controller.deletetoken();
                              bool fcmTokenDeleted =
                                  await controller.deletefcmtoken();
                              if (userTokenDeleted && fcmTokenDeleted) {
                                CacheService().removeAll();
                                Get.offAllNamed(AppRoutes.loginScreen);
                              } else {
                                print('Failed to delete tokens');
                              }
                            },
                          );
                        },
                      );
                    },
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            'Sign Out',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 18,
                          color: appTheme.greydownarrow,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                      height: 17), // Add space between text and divider

                  const Divider(
                    // Add Divider widget here
                    color: Color(
                        0xFFD5D5D5), // Customize the color as per your requirement
                    thickness: 1, // Set the thickness of the divider
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
