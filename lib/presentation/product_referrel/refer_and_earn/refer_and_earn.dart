import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/model/gridItem.dart';
import 'package:incentivesgit/presentation/product_referrel/refer_and_earn/controller/refer_and_earn_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class ReferAndEarnScreen extends GetWidget<referAndEarnController> {
  const ReferAndEarnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        backgroundColor: appTheme.background,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                dashboard(context),
                SizedBox(
                  height: 19.h,
                ),
                Text(
                  'My Referrals',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.black600,
                  ),
                ),
                const SizedBox(height: 15),
                _basicInformationSection()
              ],
            ),
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.referafriend);
          },
          child: Container(
            height: 57.h,
            width: double.maxFinite,
            decoration: BoxDecoration(color: appTheme.white, boxShadow: [
              BoxShadow(
                  color: appTheme.greytextcolour,
                  blurRadius: 2,
                  blurStyle: BlurStyle.outer,
                  offset: const Offset(2, 4))
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.add),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  'Refer a Friend​',
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: appTheme.black600),
                )
              ],
            ),
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
                'Referrals Summary​',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                  color: const Color.fromRGBO(25, 25, 25, 1),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.campaignbalancepoints),
              child: OptionCard(
                imagePath: ImageConstant.totalreferrel,
                points: 0,
                text: 'Total Referrals​',
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.succesfulreferrel);
              },
              child: OptionCard(
                imagePath: ImageConstant.succesfulreferrel,
                points: 4657,
                text: 'Successful Referrals​',
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                // Get.toNamed(AppRoutes.campaignearnedpoints);
              },
              child: OptionCard(
                imagePath: ImageConstant.earnedpoints,
                points: 6400,
                text: 'Earned​ Points​',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _basicInformationSection() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return IntrinsicHeight(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 10.h),
                decoration: BoxDecoration(
                  color: appTheme.white,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _basicinformation('Referral Id', 'PID000077'),
                    _basicinformation('Referee Name', 'Dell Storm Trooper1'),
                    _basicinformation('Referral Date', '29-03-2023'),
                    _basicinformation('Status', '29-03-2023'),
                    const SizedBox(
                        height: 10), // Add 10 height below the last content
                  ],
                ),
              ),
              Positioned(
                top: 13,
                right: 15,
                child: GestureDetector(
                    onTap: () {
                      // Handle the tap on the more_vert icon
                    },
                    child: SvgPicture.asset(
                      ImageConstant.morevert,
                      width: 3.w,
                      height: 13.h,
                    )),
              ),
            ],
          ),
        );
      },
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
