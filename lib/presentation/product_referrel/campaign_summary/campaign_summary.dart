import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/model/gridItem.dart';
import 'package:incentivesgit/presentation/product_referrel/campaign_summary/controller/campaign_summary_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/popupview.dart';

class CampaignSummaryScreen extends GetWidget<CampaignSummaryController> {
  const CampaignSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              dashboard(context),
              SizedBox(
                height: 19.h,
              ),
              Text(
                'Basic Information',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: appTheme.black600,
                ),
              ),
              const SizedBox(height: 10),
              _basicInformationSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget dashboard(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Points Dashboard',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                  color: const Color.fromRGBO(25, 25, 25, 1),
                ),
              ),
              SizedBox(width: 3.w),
              const PopoverButton(),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.campaignearnedpoints);
              },
              child: OptionCard(
                imagePath: ImageConstant.earnedpoints,
                points: 6400,
                text: 'Earned Points',
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.campaignredeemedpoints);
              },
              child: OptionCard(
                imagePath: ImageConstant.redeemedpoints,
                points: 4657,
                text: 'Redeemed Points',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.campaignexpiredpoints),
              child: OptionCard(
                imagePath: ImageConstant.expiredpoints,
                points: 2314,
                text: 'Expired Points',
              ),
            ),
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.campaignbalancepoints),
              child: OptionCard(
                imagePath: ImageConstant.balancepoints,
                points: 0,
                text: 'Balance Points',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _basicInformationSection() {
    return IntrinsicHeight(
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: appTheme.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _basicinformation('Campaign Id', 'PID000077'),
            _basicinformation('Campaign Name', 'Dell Storm Trooper1'),
            _basicinformation('Start Date', '29-03-2023'),
            _basicinformation('End Date', '29-03-2023'),
            _basicinformation('Banner', '-'),
            _basicinformation('Description', 'Dell Storm Trooper1'),
            _basicinformation('Owner', 'Nikhil Patil'),
            _basicinformation('Co-Owners', '-'),
            _basicinformation('Points Owners', '-'),
            _basicinformation('Sponsor Name', '-'),
            _basicinformation('Expiry date', '29/03/2023'),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }

  Widget _basicinformation(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align the start of the row elements
        children: [
          SizedBox(
            width: 120.w,
            child: Text(
              label,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 12.sp,
                color: appTheme.black600,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const Text(':'),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.left,
              maxLines: 3, // Allow text to wrap into multiple lines
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 12.sp,
                color: appTheme.black600,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
