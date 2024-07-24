import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/model/gridItem.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/campaigndetailstargetmeter3tails/controller/campaigndetailstargetmeter3tailscontroller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/arcpainter.dart';

class CampaignDetailsTargetMeter3trialsScreen
    extends GetWidget<CampaignDetailsTargetMeter3trialsController> {
  const CampaignDetailsTargetMeter3trialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: SafeArea(
        top: true,
        bottom: true,
        child: Scaffold(
          backgroundColor: appTheme.grey,
          appBar: _customAppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Campaigns Points Dashboard',
                          style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                              color: const Color.fromRGBO(25, 25, 25, 1)),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.info_outline_rounded,
                            size: 18.sp,
                            color: const Color.fromRGBO(109, 109, 109, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OptionCard(
                        imagePath: ImageConstant.calculatedpoints,
                        points: 3900,
                        text: 'Calculated Points',
                      ),
                      OptionCard(
                        imagePath: ImageConstant.redeemedpoints,
                        points: 3900,
                        text: 'Earned Point',
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OptionCard(
                        imagePath: ImageConstant.redeemedpoints,
                        points: 4927,
                        text: 'Redeemed Point',
                      ),
                      OptionCard(
                        imagePath: ImageConstant.redeemedpoints,
                        points: 0,
                        text: 'Expired Point',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      OptionCard(
                        imagePath: ImageConstant.redeemedpoints,
                        points: 3900,
                        text: 'Balance Point',
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                 Text(
                        'My Performance',
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          color: appTheme.black900,
                        ),
                      ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: 3,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 164.w,
                        height: 186.h,
                        color: appTheme.white,
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Number of engaged\nleads in the sales funnel',
                              style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontWeight: FontWeight.bold,
                                fontSize: 10.sp,
                                color: appTheme.black600,
                              ),
                            ),
                            Text(
                              '(in Number)',
                              style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontWeight: FontWeight.normal,
                                fontSize: 10.sp,
                                color: appTheme.black900,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Your Rank:',
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 10.sp,
                                    color: appTheme.greytextcolour,
                                  ),
                                ),
                                Text(
                                  ' 01',
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.sp,
                                    color: appTheme.black600,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  width: 48.w,
                                  height: 18.h,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(20.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: appTheme.gray80003,
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    '75%',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width: 152,
                                  height: 77,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: appTheme.white,
                    ),
                    child: Column(
                      children: [
                        _basicinformation('Campaign Id', 'PID000077'),
                        _basicinformation(
                            'Campaign Name', 'Quarterly JC Target'),
                        _basicinformation('Start Date', '01 - 04 - 2023'),
                        _basicinformation('End Date', '30 - 06 - 2023'),
                        _basicinformation('Banner', ImageConstant.accountactive),
                        _basicinformation(
                            'Description', 'Individual incentive for JCs'),
                        _basicinformation('Owner', 'Nikhil Patil'),
                        _basicinformation('Co-Owners', 'Ankush Shinde'),
                        _basicinformation('Points Owners', 'Ganesh Jagtap'),
                        _basicinformation('Report Owners', 'Mahesh Aggarwal'),
                        _basicinformation('Sponsor Name', 'Company X'),
                        _basicinformation(
                            '1st level Approval', 'Chetana Shelar'),
                        _basicinformation('2nd level Approval', 'Juhi Arora'),
                        _basicinformation(
                            '3rd level Approval', 'Pallavi Gulati'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _customAppBar() {
    return AppBar(
      backgroundColor: appTheme.redappbar,
      automaticallyImplyLeading: true,
      leading: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: IconButton(
          onPressed: () => Get.back(),
          icon: SvgPicture.asset(
            ImageConstant.arrowback,
            width: 27.w,
            height: 18.h,
          ),
        ),
      ),
      title: Text(
        'Campaign Details',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: GoogleFonts.roboto().fontFamily,
          fontWeight: FontWeight.w600,
          fontSize: 20.sp,
          color: appTheme.white,
        ),
      ),
    );
  }

  Widget _basicinformation(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              width: 104.w,
              child: Text(
                label,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 12.sp,
                    color: appTheme.black600,
                    fontWeight: FontWeight.normal),
              )),
          const Text(':'),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: SizedBox(
              width: 110.w,
              child: Text(
                value,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 12.sp,
                    color: appTheme.black600,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
