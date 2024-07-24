import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/typeF_screens/allreferrals_viewdetails/controller/allreferrals_viewdetails_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class AllReferralsViewDetailsScreen
    extends GetWidget<AllReferralsViewDetailsController> {
  const AllReferralsViewDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: appTheme.rediconbackground),
    );

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) {
        return Scaffold(
          appBar: _customAppBar(),
          body: Container(
            width: 385,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: [
                  _buildStatus(),
                  _buildSectionHeader('Referral Details'),
                  _buildDivider(),
                  _buildViewdetails('Referral Id', ':', '1020'),
                  _buildViewdetails('Requested By', ':', ' Chetana Shelar'),
                  _buildViewdetails('Mobile number', ':', '91+ 9920556644'),
                  _buildViewdetails(
                      'Email id', ':', 'chetanashelar@grgindia.in'),
                  _buildViewdetails(
                      'Product(s)', ':', 'Tata nexon Tata Harrier'),
                  _buildViewdetails('#BU n-1', ':', 'Dadar'),
                  _buildViewdetails('#BU n', ':', 'Khar'),
                  _buildViewdetails('Points Earned', ':', '5,000'),
                  _buildViewdetails('Referral Date', ':', '29-9-2323'),
                  _buildViewdetails('Referral code', ':', 'Chetana1234'),
                  
                ],
              ),
            ),
          ),
        );
      },
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
            ImageConstant.backarrow,
            width: 27.w,
            height: 18.h,
          ),
        ),
      ),
      title: Text(
        'View Details',
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
            color: appTheme.white,
          ),
        ),
      ),
    );
  }

  Widget _buildStatus() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Spacer(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Status: ',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: Colors.black,
              ),
            ),
            Text(
              'Sent',
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 13.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.poppins().fontFamily,
          color: appTheme.black600,
        ),
      ),
    );
  }

  Widget _buildViewdetails(String label1, String separator, String label2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 13.0, right: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 140,
                child: Text(
                  label1,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              Text(
                separator,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 25.0),
              Expanded(
                child: Text(
                  label2,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildViewdetails1(String label1, String label2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 13.0, right: 5),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: label1,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const TextSpan(
                  text: '  ',
                ),
                TextSpan(
                  text: label2,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.cyan800,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildDivider() {
    return Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Divider(
            color: appTheme.gray500,
            thickness: 1.0,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
