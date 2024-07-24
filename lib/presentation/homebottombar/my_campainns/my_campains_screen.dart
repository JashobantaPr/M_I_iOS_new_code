import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

import 'controller/my_campains_controller.dart';

class MyCapmainsScreen extends GetWidget<MyCampainsController> {
  const MyCapmainsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: SafeArea(
        top: true,
        child: Scaffold(
            backgroundColor: appTheme.background,
            body: Obx(() {
              if (controller.mycampaigns.isEmpty) {
                return const Center(child: Text('No campaigns'));
              }
              if (controller.isLoading.isTrue) {
                return const Center(
                  child: SpinKitFadingCircle(
                    color: Colors.black,
                    size: 50.0,
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                  itemCount: controller.mycampaigns.length,
                  itemBuilder: (context, index) {
                    var mycampaigns = controller.mycampaigns[index];
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
                                    _buildDataRow(
                                        '${controller.terminologytext} id',
                                        mycampaigns.programCode ?? ''),
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
                                                fontFamily:
                                                    GoogleFonts.poppins()
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
                                            onTap: () {
                                              if (mycampaigns.name!
                                                  .isCaseInsensitiveContains(
                                                      'Type A')) {
                                                Get.toNamed(
                                                    AppRoutes
                                                        .directawardingofpoints,
                                                    arguments:
                                                        mycampaigns.programId);
                                              } else if (mycampaigns.name!
                                                  .isCaseInsensitiveContains(
                                                      'Type B')) {
                                                Get.toNamed(
                                                    AppRoutes
                                                        .typebcampaignDetails,
                                                    arguments:
                                                        mycampaigns.programId);
                                              } else if (mycampaigns.name!.isCaseInsensitiveContains('Type C') &&
                                                  mycampaigns.name!
                                                      .isCaseInsensitiveContains(
                                                          'hierarchy')) {
                                                Get.toNamed(
                                                    AppRoutes
                                                        .typectotalinvoiceregression,
                                                    arguments:
                                                        mycampaigns.programId);
                                              } else if (mycampaigns.name!.isCaseInsensitiveContains('Type C') &&
                                                  mycampaigns.name!
                                                      .isCaseInsensitiveContains(
                                                          'KPI SKU')) {
                                                Get.toNamed(
                                                    AppRoutes
                                                        .typeckpiskuregression,
                                                    arguments:
                                                        mycampaigns.programId);
                                              } else if (mycampaigns.name!.isCaseInsensitiveContains('Type C') &&
                                                  mycampaigns.name!
                                                      .isCaseInsensitiveContains(
                                                          'Total Invoice')) {
                                                Get.toNamed(
                                                    AppRoutes
                                                        .typectotalinvoiceregression,
                                                    arguments:
                                                        mycampaigns.programId);
                                              } else if (mycampaigns.name!
                                                  .isCaseInsensitiveContains(
                                                      'Type C SKU')) {
                                                Get.toNamed(
                                                    AppRoutes
                                                        .typeckpiskuregression,
                                                    arguments:
                                                        mycampaigns.programId);
                                              } else if (mycampaigns.name!.isCaseInsensitiveContains('Type D') &&
                                                  mycampaigns.name!
                                                      .isCaseInsensitiveContains(
                                                          'progress bar')) {
                                                Get.toNamed(
                                                    AppRoutes
                                                        .campaigndetailscardprogressbar,
                                                    arguments:
                                                        mycampaigns.programId);
                                              } else if (mycampaigns.name!
                                                      .isCaseInsensitiveContains('Type D') &&
                                                  mycampaigns.name!.isCaseInsensitiveContains('Card')) {
                                                Get.toNamed(
                                                    AppRoutes
                                                        .campaigndetailscardscreen,
                                                    arguments:
                                                        mycampaigns.programId);
                                              } else if (mycampaigns.name!.isCaseInsensitiveContains('Type D') && mycampaigns.name!.isCaseInsensitiveContains('target meter')) {
                                                Get.toNamed(
                                                    AppRoutes
                                                        .campaigndetailstargetmeter,
                                                    arguments:
                                                        mycampaigns.programId);
                                              } else if (mycampaigns.name!.isCaseInsensitiveContains('Type E')) {
                                                Get.toNamed(
                                                    AppRoutes
                                                        .campaigndetailstargetmeter,
                                                    arguments:
                                                        mycampaigns.programId);
                                              } else if (mycampaigns.name!.isCaseInsensitiveContains('Type F')) {
                                                Get.toNamed(
                                                    AppRoutes
                                                        .directawardingofpoints,
                                                    arguments:
                                                        mycampaigns.programId);
                                              }
                                            },
                                            child: const Text('View Details'),
                                          ),
                                        ];
                                      },
                                      icon: SvgPicture.asset(
                                          ImageConstant.morevert),
                                    ),
                                  ],
                                ),
                                _buildDataRow(
                                    '${controller.terminologytext} Name',
                                    mycampaigns.name ?? ''),
                                SizedBox(
                                  height: 3.h,
                                ),
                                _buildDataRow(
                                    '${controller.terminologytext} Owner',
                                    mycampaigns.owner ?? ''),
                                SizedBox(
                                  height: 3.h,
                                ),
                                _buildDataRow(
                                  'Status',
                                  mycampaigns.freezeStatus == '0'
                                      ? "Active"
                                      : "Inactive",
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
              );
            })),
      ),
    );
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
}
