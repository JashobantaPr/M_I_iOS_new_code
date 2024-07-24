import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/buzz_screens/Buzz_summary/controller/buzzSummary_Controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:get/get.dart';

class BuzzSummaryScreen extends GetWidget<BuzzeSummaryController> {
  const BuzzSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
      final BuzzeSummaryController controller = Get.put(BuzzeSummaryController());

  
    return Scaffold(
      backgroundColor: appTheme.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  size: 15.0,
                  color: appTheme.greytextcolour,
                ),
                const SizedBox(width: 7.0),
                Text(
                  'Overview of the year',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.greytextcolour,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Obx(() {
              return _buildBuzzes(controller.leaderforme.value,
                  controller.leaderbyme.value);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildBuzzes(String byMe, String forMe) {
    return Container(
      height: 150,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, top: 17.0), // Add top padding here
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: appTheme.rediconbackground,
                  child: Text(
                    forMe,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                ),
                const SizedBox(width: 15.0),
                Text(
                  'Buzzes for me',
                  style: TextStyle(
                    color: appTheme.cyan800,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Divider(
              color: appTheme.greydivider,
              height: 1,
              thickness: 1,
              indent: 12,
              endIndent: 12,
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: appTheme.rediconbackground,
                  child: Text(
                    byMe,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                ),
                const SizedBox(width: 15.0),
                Text(
                  'Buzzes by me',
                  style: TextStyle(
                    color: appTheme.cyan800,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
