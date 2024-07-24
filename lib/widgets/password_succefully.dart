import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/custom_image_view.dart';

class PasswordSuccessfullyScreen extends StatelessWidget {
  const PasswordSuccessfullyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
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
              Center(
                child: Card(
                  elevation: 4, // Adjust the elevation as needed
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        12), // Adjust the border radius as needed
                  ),
                  child: Container(
                    width: 300.w,
                    height: 409.h,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomImageView(
                          imagePath:
                              'assetes/images/My-Incentives-Final-Logo_1.png',
                          width: 182.w,
                          height: 29.h,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        CustomImageView(
                          imagePath:
                              'assetes/images/Icon awesome-check-circle.svg',
                          width: 91,
                          height: 91,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(
                          height: 15.h,
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
                              'Your password has been changed successfully.\n Please login and have fun!',
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
                        SizedBox(height: 25.h),
                        Container(
                          width: 260.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              Get.toNamed(AppRoutes.loginScreen);
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
                                  color:
                                      const Color.fromRGBO(255, 255, 255, 1)),
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
      ),
    );
  }
}
