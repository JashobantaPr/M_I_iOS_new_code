import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/onBoarding/userVerification/controller/userVerification_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/custom_image_view.dart';

class UserVerificationScreen extends GetWidget<UserVerificationController> {
  const UserVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = Get.arguments;
    print('arguments$arg');
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
              bottom: 124.h,
              left: 15.w,
              right: 15.w,
              top: 184.h,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(top: 19.h, right: 59.w, left: 59.w),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgLogo,
                          width: 182,
                          height: 29,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'User Verification Process',
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 20,
                            color: appTheme.black900,
                            fontWeight: FontWeight.w700),
                      ),
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
                        width: 260,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                          ),
                          child: Text(
                            'Dear abc\nYour mobile number is not verified. Please request OTP & verify your number.',
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 10.sp,
                                color: appTheme.gray90001,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.maxFinite,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: appTheme.gray900),
                        ),
                        child: TextField(
                          // controller: controller.phoneNumberController,
                          textAlignVertical: TextAlignVertical.top,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Segoe UI',
                            color: appTheme.black600,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                const EdgeInsets.only(left: 10, bottom: 10),
                            hintText: arg.isNotEmpty ? arg : '',
                            hintStyle: TextStyle(
                              color: appTheme.black600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        width: double.maxFinite,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            controller.onVerified(arg);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: const Text(
                            'Request OTP',
                            style: TextStyle(fontSize: 12),
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
}
