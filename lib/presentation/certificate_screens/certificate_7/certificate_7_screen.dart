import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_7/controller/certificate_7_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';

import 'package:incentivesgit/theme/theme_helper.dart';

class Certificate7Screen extends GetWidget<Certificate7Controller> {
  const Certificate7Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: SafeArea(
        top: true,
        bottom: true,
        child: Scaffold(
          backgroundColor: appTheme.grey,
          appBar: _customAppBar(),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Obx(() {
              if (controller
                  .certificateResponse.value.allCertificates.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                ),
                itemCount:
                    controller.certificateResponse.value.allCertificates.length,
                itemBuilder: (BuildContext context, int index) {
                  var certificate = controller
                      .certificateResponse.value.allCertificates[index];
                  return GestureDetector(
                    onTap: () {
                      Get.offNamed(AppRoutes.certificate8, arguments: {
                        'selectedImage':
                            '${controller.certificateResponse.value.backImgUrl}${certificate.certificateDetailCompanyLogoUrl}',
                        'certificates': controller
                            .certificateResponse.value.allCertificates,
                      });

                      controller.selectCertificate(certificate);
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5 - 15,
                      height: 230,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 101,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(0),
                                    border: Border.all(
                                      color: Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0),
                                    child: Image.network(
                                      '${controller.certificateResponse.value.backImgUrl}${certificate.certificateDetailCompanyLogoUrl}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  certificate.certificateDetailTitle,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: appTheme.black900,
                                  ),
                                ),
                                SizedBox(height: 2),
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
                    ),
                  );
                },
              );
            }),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _customAppBar() {
    return AppBar(
      backgroundColor: appTheme.redappbar,
      automaticallyImplyLeading: true,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: SvgPicture.asset(
          ImageConstant.arrowback,
          width: 34.w,
          height: 20.h,
        ),
      ),
      title: Text(
        'Choose Certificate',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: GoogleFonts.roboto().fontFamily,
          fontWeight: FontWeight.w300,
          fontSize: 18.sp,
          color: appTheme.white,
        ),
      ),
    );
  }
}
