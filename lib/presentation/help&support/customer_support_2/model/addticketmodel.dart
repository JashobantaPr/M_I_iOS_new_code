import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class AddTicketModal extends StatelessWidget {
  const AddTicketModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: 330.sp,
          height: 220,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AppBar(
                  backgroundColor: Color(0XFFE21D39),
                  toolbarHeight: 50,
                  automaticallyImplyLeading: false,
                  title: Text(
                    'Confirmation',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 12, right: 12.5, bottom: 12),
                      child: GestureDetector(
                          onTap: () => Get.back(),
                          child: Image.asset(
                            ImageConstant.cancel,
                            width: 14.93,
                            height: 14.93,
                          )),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 70,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //  Text(
                    //   'Thank you.!',
                    //   style: TextStyle(
                    //     fontFamily: GoogleFonts.poppins().fontFamily,
                    //     fontWeight: FontWeight.w400,
                    //     fontSize: 14.sp,
                    //     color: appTheme.grey100,
                    //   ),
                    // ),
                    Text(
                      'Are you sure you want to raise a ticket??',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: appTheme.grey100,
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Divider(
                        color: appTheme.gray500,
                        thickness: 1.0,
                      ),
                    ),
                    SizedBox(height: 20),
                    const SizedBox(width: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            Get.back();
                            Get.back();
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: appTheme.greydownarrow),
                            minimumSize: const Size(120, 60),
                            // backgroundColor: const Color(0XFFE21D39),
                          ),
                          child: Text(
                            'No',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        OutlinedButton(
                          onPressed: () {
                            Get.back();
                            Get.back();
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.red),
                            minimumSize: const Size(120, 60),
                            backgroundColor: const Color(0XFFE21D39),
                          ),
                          child: Text(
                            'Yes',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                        ),
                      ],
                    )
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
