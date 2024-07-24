import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class DialogueBoxChooseImage extends StatelessWidget {
  final VoidCallback onGalleryTap;
  final VoidCallback onCameraTap;

  const DialogueBoxChooseImage({
    super.key,
    required this.onGalleryTap,
    required this.onCameraTap,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Container(
        height: 199,
        decoration: BoxDecoration(
          color: appTheme.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: appTheme.rediconbackground,
                toolbarHeight: 40,
                automaticallyImplyLeading: false,
                title: const Text(
                  'Select Image',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                actions: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 12, right: 12.5, bottom: 12),
                    child: GestureDetector(
                        onTap: () => Get.back(),
                        child: Icon(
                          color: appTheme.white,
                          Icons.close,
                          size: 18,
                        )),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 78.h,
              left: 50.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          onGalleryTap();
                          Get.back();
                        },
                        child: Image.asset(
                          'assetes/images/gallery.png',
                          width: 60.w,
                          height: 60.h,
                        ),
                      ),
                      Text(
                        'Gallery',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 14.sp,
                            color: appTheme.black600),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          onCameraTap();
                          Get.back();
                        },
                        child: Image.asset(
                          'assetes/images/camera.png',
                          width: 60.w,
                          height: 60.h,
                        ),
                      ),
                      Text(
                        'Camera',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 14.sp,
                            color: appTheme.black600),
                      )
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
