import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/rewards/rewards_superchequescredit/controller/rewards_superchequescredit_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class RewardsSuperchequesCreditScreen
    extends GetWidget<RewardsSuperchequesCreditController> {
  const RewardsSuperchequesCreditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0XFFE41C39),
      child: Scaffold(
        backgroundColor: appTheme.white,
        appBar: AppBar(
          backgroundColor: const Color(0XFFE41C39),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: SvgPicture.asset(
              ImageConstant.arrowback,
              width: 26.75.w,
              height: 19.76.h,
            ),
          ),
          title: Text(
            'Supercheques Credit',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRewardsSuperCheques(),
              SizedBox(
                height: 15.h,
              ),
              Divider(
                color: appTheme.greydivider,
                indent: TextSelectionToolbar.kToolbarContentDistanceBelow,
              ),
              _buildRewardsSuperCheques1(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRewardsSuperCheques() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.supercheque);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    SvgPicture.asset(
                      ImageConstant.anniversarie,
                      width: 19.71,
                      height: 19.71,
                    ),
                    const SizedBox(width: 18.0),
                    Text(
                      'Enter Supercheque Code',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10.0),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 22.0,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRewardsSuperCheques1() {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.scanqrcode);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          ImageConstant.anniversarie,
                          width: 19.71,
                          height: 19.71,
                        ),
                        const SizedBox(width: 18.0),
                        Text(
                          'Scan OR code',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                            // Adjust colors as needed
                            color: Colors.black, // appTheme.black900,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10.0),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 22.0,
                      // Adjust colors as needed
                      color: Colors.grey, // appTheme.greytextcolour,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
