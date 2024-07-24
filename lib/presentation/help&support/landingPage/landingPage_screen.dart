import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/help&support/landingPage/controller/landingPage_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class HelpandSupportLandingPageScreen
    extends GetWidget<HelpandSupportLandingPageController> {
  const HelpandSupportLandingPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: appTheme.rediconbackground));

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) {
        return Scaffold(
          appBar: _customAppBar(),
          body: SingleChildScrollView(
            child: Container(
              width: 385,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildHelpandSupport(),
                  ],
                ),
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
        'Help & Support',
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

  Widget _buildHelpandSupport() {
    return Container(
      width: 413,
      // height: 400,
      child: Column(
        children: [
          Container(
              width: 413,
              height: 328,
              child: Image.asset(
                ImageConstant.helpandsupport,
                fit: BoxFit.contain,
              )),
          const SizedBox(height: 20),
          _buildHelpManual('Help Manual'),
          _buildCustomerSupport('Support'),
          _buildScheduledUpgrade('Scheduled Upgrade'),
          _buildAboveMyIncentives('About My Incentives'),
        ],
      ),
    );
  }

  Widget _buildHelpManual(String text) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.helpandsupporthelpmanual1);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      ImageConstant.helpmanual,
                      width: 19.71,
                      height: 19.71,
                    ),
                    const SizedBox(width: 8.0),
                    Transform.translate(
                      offset: const Offset(15.0, 0.0),
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: appTheme.black900,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 22.0,
                  color: appTheme.greytextcolour,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Divider(
              color: appTheme.grey500,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerSupport(String text) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.helpandsupportcustomersupport1);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      ImageConstant.customersupport,
                      width: 19.71,
                      height: 19.71,
                    ),
                    const SizedBox(width: 8.0),
                    Transform.translate(
                      offset: const Offset(15.0, 0.0),
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: appTheme.black900,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 22.0,
                  color: appTheme.greytextcolour,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Divider(
              color: appTheme.grey500,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduledUpgrade(String text) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.helpandsupportscheduledupgrade);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      ImageConstant.scheduledupgrade,
                      width: 19.71,
                      height: 19.71,
                    ),
                    const SizedBox(width: 8.0),
                    Transform.translate(
                      offset: const Offset(15.0, 0.0),
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: appTheme.black900,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 22.0,
                  color: appTheme.greytextcolour,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Divider(
              color: appTheme.grey500,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboveMyIncentives(String text) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.helpandsupportaboutmyincentives);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      ImageConstant.aboutmyincentives,
                      width: 19.71,
                      height: 19.71,
                    ),
                    const SizedBox(width: 8.0),
                    Transform.translate(
                      offset: const Offset(15.0, 0.0),
                      child: Text(
                        text,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                          color: appTheme.black900,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 22.0,
                  color: appTheme.greytextcolour,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
