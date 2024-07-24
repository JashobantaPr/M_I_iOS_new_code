import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/typeF_screens/campaigndetails_allreferrals/controller/campaigndetails_allreferrals_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class CampaignDetailsAllReferralsScreen
    extends GetWidget<CampaignDetailsAllReferralsController> {
  const CampaignDetailsAllReferralsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        backgroundColor: appTheme.background,
        // appBar: _customAppBar(),
        body: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              // var mycampaigns = controller.mycampaigns[index];
              return Column(
                children: [
                  if (index == 0) _buildAllReferrals(), // Call only once
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                    child: Card(
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Container(
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            color: appTheme.white,
                            borderRadius: BorderRadius.circular(4)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 14, bottom: 3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildDataRow('Referral Id', '1020'),
                                  PopupMenuButton<String>(
                                    position: PopupMenuPosition.under,
                                    offset: const Offset(-13, 0),
                                    onSelected: (String value) {
                                      if (value == 'View Details') {}
                                    },
                                    itemBuilder: (
                                      BuildContext context,
                                    ) {
                                      return [
                                        PopupMenuItem<String>(
                                          height: 25,
                                          textStyle: TextStyle(
                                              fontFamily: GoogleFonts.poppins()
                                                  .fontFamily,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                              color: appTheme.black600),
                                          padding: EdgeInsets.only(
                                              left: 10.w,
                                              right: 40.w,
                                              top: 8.h,
                                              bottom: 8.h),
                                          value: 'View Details',
                                          onTap: () {},
                                          child: const Text('View Details'),
                                        ),
                                      ];
                                    },
                                    icon: SvgPicture.asset(
                                        ImageConstant.morevert),
                                  ),
                                ],
                              ),
                              _buildDataRow('Referee Name​', 'Chetana Shelar'),
                              SizedBox(
                                height: 3.h,
                              ),
                              _buildDataRow('Product Purchased', 'Tata Nexon'),
                              SizedBox(
                                height: 3.h,
                              ),
                              _buildDataRow(
                                'Points Earned',
                                '5,000',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
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
        'Successful Referrals: 5,000',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: GoogleFonts.roboto().fontFamily,
          fontWeight: FontWeight.w600,
          fontSize: 18.sp,
          color: appTheme.white,
        ),
      ),
    );
  }

  Widget _buildAllReferrals() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'All Referrals',
            style: TextStyle(
              fontSize: 14.0,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.bold,
              color: appTheme.black900,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.file_download_outlined,
                size: 20.0,
                color: appTheme.blue50,
              ),
              const SizedBox(width: 4.0),
              Text(
                'All Referrals',
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: appTheme.black900,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDataRow(String label, String value) {
    return Row(
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
                fontWeight: FontWeight.normal,
                height: 1),
          ),
        ),
        const Text(':'),
        Padding(
          padding: const EdgeInsets.only(left: 7),
          child: Text(
            value,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 12.sp,
                color: appTheme.black600,
                fontWeight: FontWeight.bold,
                height: 1),
          ),
        ),
      ],
    );
  }
}
