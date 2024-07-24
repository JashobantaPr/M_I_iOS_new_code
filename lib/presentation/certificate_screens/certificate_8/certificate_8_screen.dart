import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_8/controller/certificate_8_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';

import 'package:incentivesgit/theme/theme_helper.dart';

class Certificate8Screen extends GetWidget<Certificate8Controller> {
  const Certificate8Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final String selectedImage =
        Get.arguments['selectedImage']; // Retrieve the selected image URL
    final List certificates =
        Get.arguments['certificates']; // Retrieve the list of certificates

    return ScreenUtilInit(
      child: SafeArea(
        top: true,
        bottom: true,
        child: Scaffold(
          backgroundColor: appTheme.grey,
          appBar: _customAppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [],
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: 1.1,
                    child: Container(
                      height: 255,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        border: Border.all(
                          width: 2,
                          color: Colors.transparent,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(0),
                        child: Image.network(
                          selectedImage, // Display the selected image
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: certificates.map((certificate) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 1),
                          child: Card(
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: SizedBox(
                              width: 164,
                              height: 186,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: 143,
                                          height: 101,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            border: Border.all(
                                              color: Colors.transparent,
                                              width: 2,
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(0),
                                            child: Image.network(
                                              '${controller.certificateResponse.backImgUrl}${certificate.certificateDetailCompanyLogoUrl}',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 11),
                                    Text(
                                      certificate.certificateDetailTitle,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        color: appTheme.black900,
                                      ),
                                    ),
                                    SizedBox(height: 4.2),
                                    Row(
                                      children: [
                                        Text(
                                          'Points : ',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: appTheme.black900,
                                          ),
                                        ),
                                        Text(
                                          '1000 each',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: appTheme.black900,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4.2),
                                    Row(
                                      children: [
                                        Text(
                                          'Available Certificates : ',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400,
                                            color: appTheme.black900,
                                          ),
                                        ),
                                        Text(
                                          '${certificate.certificateDistributionCount}/${certificate.certificateAllotedCertificateCount}',
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: appTheme.black900,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          width: 120,
                          height: 48,
                          decoration: BoxDecoration(
                            color: appTheme.rediconbackground,
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                color: appTheme.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () {
                          Get.offNamed(
                            AppRoutes.awardCertificate,
                            arguments: {'selectedImage': selectedImage},
                          );
                        },
                        child: Container(
                          width: 120,
                          height: 48,
                          decoration: BoxDecoration(
                            color: appTheme.rediconbackground,
                            border: Border.all(color: Colors.black12),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              'Select',
                              style: TextStyle(
                                color: appTheme.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
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
            ImageConstant.arrowback,
            width: 20.w,
            height: 10.h,
          ),
        ),
      ),
      title: Text(
        'View Certificate',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: GoogleFonts.roboto().fontFamily,
          fontWeight: FontWeight.w500,
          fontSize: 20.sp,
          color: appTheme.white,
        ),
      ),
    );
  }
}
