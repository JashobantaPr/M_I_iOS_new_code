import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class CustomDialog2 extends StatelessWidget {
  final String title;
  final String message;
  final TextEditingController textFieldController;
  final VoidCallback onSubmit;

  const CustomDialog2({
    super.key,
    required this.title,
    required this.message,
    required this.textFieldController,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: IntrinsicHeight(
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
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  SizedBox(
                    height: 8.h,
                  ),
                  TextField(
                    controller: textFieldController,
                    cursorColor: appTheme.black600,
                    onChanged: (value) {
                      if (value.isNotEmpty &&
                          value[0].contains(RegExp(r'[0-9]'))) {
                        textFieldController.text = value;
                        textFieldController.selection =
                            TextSelection.fromPosition(
                          TextPosition(offset: textFieldController.text.length),
                        );
                      } else {
                        textFieldController.text = value;
                        textFieldController.selection =
                            TextSelection.fromPosition(
                          TextPosition(offset: textFieldController.text.length),
                        );
                      }
                    },
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        color: appTheme.black900,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: appTheme.grey500)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: appTheme.grey500)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: appTheme.grey500)),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: onSubmit,
                        style: OutlinedButton.styleFrom(
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            fixedSize: Size(149.w, 40.h),
                            backgroundColor: appTheme.rediconbackground,
                            side: const BorderSide(color: Colors.transparent)),
                        child: const Text(
                          'Request OTP',
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
    );
  }
}
