import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/product_referrel/succesful_referrels/controller/succesful_referrels_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class SuccesfulreferrelScreen extends GetWidget<SuccesfulReferrelsController> {
  const SuccesfulreferrelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SuccesfulReferrelsController());
    return ScreenUtilInit(
        child: Scaffold(
            backgroundColor: appTheme.background,
            appBar: _customAppBar(),
            body: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 9,
                      right: 9,
                    ),
                    child: Card(
                      elevation: 3.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Container(
                        width: double.maxFinite,
                        color: appTheme.white,
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
                                      if (value == 'view_details') {}
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
                                          value: 'view_details',
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
                              _buildDataRow('Referee Name', 'Chetana Shelar'),
                              SizedBox(
                                height: 3.h,
                              ),
                              _buildDataRow('​Product Purchased', 'Tata Nexon'),
                              SizedBox(
                                height: 3.h,
                              ),
                              _buildDataRow(
                                'Points Earned',
                                "5,000",
                              ),
                              SizedBox(
                                height: 3.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )));
  }

  Widget _buildDataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 104.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 12.sp,
                    color: appTheme.black600,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          const Text(':'),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: SizedBox(
              width: 149,
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
                ),
              ),
            ),
          ),
        ],
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
            ImageConstant.backarrow,
            width: 27.w,
            height: 18.h,
          ),
        ),
      ),
      title: Text(
        'Successful Referrals: 5,000',
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
}
