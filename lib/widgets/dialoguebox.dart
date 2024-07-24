import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onYesPressed;

  const CustomDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onYesPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          decoration: BoxDecoration(
            color: appTheme.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppBar(
                backgroundColor: appTheme.redappbar,
                toolbarHeight: 48,
                automaticallyImplyLeading: false,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4.r),
                    topRight: Radius.circular(4.r),
                  ),
                ),
                title: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.5),
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.close_rounded,
                        color: appTheme.white,
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      message,
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.normal,
                        fontSize: 12.sp,
                        color: appTheme.grey100,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Divider(
                      color: appTheme.greydivider,
                      thickness: 1,
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            Get.back();
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: appTheme.grey500),
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            fixedSize: const Size(98, 40),
                          ),
                          child: Text(
                            'No',
                            style: TextStyle(
                                color: appTheme.grey100,
                                fontWeight: FontWeight.normal,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 14.sp),
                          ),
                        ),
                        const SizedBox(width: 10),
                        OutlinedButton(
                          onPressed: onYesPressed,
                          style: OutlinedButton.styleFrom(
                              shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              fixedSize: Size(98.w, 40.h),
                              backgroundColor: appTheme.rediconbackground,
                              side:
                                  const BorderSide(color: Colors.transparent)),
                          child: const Text(
                            'Yes',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
