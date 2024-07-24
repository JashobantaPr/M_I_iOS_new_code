import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/myProfile/email_preference/controller/email_preference_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class EmailPreferenceScreen extends GetWidget<EmailPreferenceController> {
  const EmailPreferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
          backgroundColor: appTheme.background,
          appBar: _customAppBar(),
          body: Obx(() {
            if (controller.userProfile.value == null) {
              return const Center(child: Text('No data available'));
            }
            if (controller.isLoading.value) {
              return const Center(
                child: SpinKitFadingCircle(
                  color: Colors.black,
                  size: 50.0,
                ),
              );
            }
            return ListView.builder(
              itemCount: controller.userProfile.value.emailDetailsFull?.length,
              itemBuilder: (context, index) {
                var myemails =
                    controller.userProfile.value.emailDetailsFull![index];
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    right: 5,
                  ),
                  child: Card(
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: appTheme.white,
                          borderRadius: BorderRadius.circular(4)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 14, bottom: 3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildDataRow('Email Condition ',
                                    myemails.emailType ?? ''),
                                PopupMenuButton<String>(
                                  position: PopupMenuPosition.under,
                                  offset: const Offset(-13, 0),
                                  onSelected: (String value) {
                                    if (value == 'Unsubscribe') {
                                      Get.toNamed(
                                        AppRoutes.emailpreferencesunsubscribe,
                                        arguments: {
                                          'emailCompanyIdPk':
                                              myemails.emailCompanyIdPk,
                                          'emailUserIdPk':
                                              myemails.emailUserIdPk,
                                          'cmsUserId': myemails.cmsUserId,
                                          'emailSendDate':
                                              myemails.emailSendDate,
                                        },
                                      );
                                    }
                                  },
                                  itemBuilder: (
                                    BuildContext context,
                                  ) {
                                    return [
                                      PopupMenuItem<String>(
                                        height: 25,
                                        textStyle: TextStyle(
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily,
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w400,
                                            color: appTheme.black600),
                                        padding: EdgeInsets.only(
                                            left: 10.w,
                                            right: 40.w,
                                            top: 8.h,
                                            bottom: 8.h),
                                        value: 'Unsubscribe',
                                        onTap: () {},
                                        child: const Text('Unsubscribe'),
                                      ),
                                    ];
                                  },
                                  icon:
                                      SvgPicture.asset(ImageConstant.morevert),
                                ),
                              ],
                            ),
                            _buildDataRow(
                                'Status', myemails.subscriptionStatus ?? 'N/A'),
                            SizedBox(
                              height: 3.h,
                            ),
                            _buildDataRow('Unsubscribed On',
                                myemails.unsubscriptionDate ?? "N/A"),
                            SizedBox(
                              height: 3.h,
                            ),
                            _buildDataRow(
                              'Unsubscribed Till ',
                              myemails.unsubscriptionTillDate ?? 'N/A',
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            _buildDataRow('Last Triggered',
                                myemails.emailSendDate ?? 'N/A'),
                            SizedBox(
                              height: 3.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          })),
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
            width: 27.w,
            height: 18.h,
          ),
        ),
      ),
      title: Text(
        'Email Preferences',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: GoogleFonts.roboto().fontFamily,
          fontWeight: FontWeight.w600,
          fontSize: 20.sp,
          color: appTheme.white,
        ),
      ),
    );
  }

  Widget _buildDataRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 104.w,
          child: Text(
            label,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 12.sp,
                color: appTheme.black600,
                fontWeight: FontWeight.normal,
                height: 1),
          ),
        ),
        const Text(':'),
        Padding(
          padding: const EdgeInsets.only(left: 7),
          child: Text(
            value,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 12.sp,
                color: appTheme.black600,
                fontWeight: FontWeight.bold,
                height: 1),
          ),
        ),
      ],
    );
  }
}
