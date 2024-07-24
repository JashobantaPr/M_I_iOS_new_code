import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/custom_image_view.dart';

class AccountVerifiedScreen extends StatelessWidget {
  const AccountVerifiedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
              top: 164,
              left: 15,
              right: 15,
              bottom: 92,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  color: appTheme.white,
                  padding: const EdgeInsets.only(left: 63, right: 63),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 39.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: CustomImageView(
                          imagePath: ImageConstant.imgLogo,
                          width: 182.w,
                          height: 29.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      CustomImageView(
                        imagePath: 'assetes/images/verified-account.png',
                        width: 91,
                        height: 91,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Text(
                        'Congratulations!',
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 20.sp,
                            color: appTheme.black900,
                            fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        width: 182.w,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 20.h,
                          ),
                          child: Text(
                            'Your account has been successfully verified & activated.\nPlease login and start your journey full of fun and excitement!!!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 2.5,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 10,
                                color: appTheme.black900,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        width: double.maxFinite,
                        height: 40.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Get.offAndToNamed(AppRoutes.loginScreen);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          child: Text(
                            'Continue to Login',
                            style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                color: const Color.fromRGBO(255, 255, 255, 1)),
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
