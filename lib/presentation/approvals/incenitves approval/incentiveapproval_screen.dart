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
import 'package:incentivesgit/presentation/Approvals/incenitves%20approval/controller/incetive_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class IncentiveApprovalScreen extends GetWidget<IncentiveApprovalController> {
  const IncentiveApprovalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: appTheme.rediconbackground),
    );

    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, _) {
        return Scaffold(
          appBar: _customAppBar(),
          body: Obx(
            () => Container(
              width: 385,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: [
                    _buildSectionHeaderWithStatus(
                      'Automated Incentives Request Form',
                      controller
                              .myIncentiveApprovals.value?.detail?.statusName ??
                          '',
                    ),

                    _buildDivider(),
                    _buildBudgetHistory(
                        'Campaign Name',
                        ':',
                        controller.myIncentiveApprovals.value?.detail
                                ?.campaignName ??
                            ''),
                    _buildBudgetHistory(
                        'Campaign Description',
                        ':',
                        controller.myIncentiveApprovals.value?.detail
                                ?.campaignName ??
                            ''),
                    // _buildBudgetHistory('Date of request', ':', 'Roopa Rao'),
                    _buildBudgetHistory2(
                        'Status',
                        ':',
                        controller.myIncentiveApprovals.value?.detail
                                ?.statusName ??
                            ''),
                    // _buildSectionHeader('Incentives Payout Details'),
                    _buildSectionHeader('Incentives Payout Details'),
                    _buildDivider(),
                    _buildBudgetHistory(
                        'Campaign Budget Available',
                        ':',
                        controller.myIncentiveApprovals.value?.campaignBudget ??
                            ''),
                    _buildPayoutDetails(),
                    _buildNotesSection(),
                    //  _buildDateTimeRow(),
                    _buildSectionHeader('Approver Details'),
                    _buildDivider(),
                    _buildBudgetHistory(
                        'Approver ',
                        ':',
                        '${controller.myIncentiveApprovals.value?.approver?.firstName ?? ''} '
                            '${controller.myIncentiveApprovals.value?.approver?.lastName ?? ''}'),
                    _buildBudgetHistory(
                        'Approver Email Id',
                        ':',
                        controller
                                .myIncentiveApprovals.value?.approver?.email ??
                            ''),
                    _buildBudgetHistory(
                        'Comments',
                        ':',
                        controller
                                .myIncentiveApprovals.value?.detail?.comment ??
                            ''),
                    _buildBudgetHistory(
                        ' Approval Date',
                        ':',
                        controller.myIncentiveApprovals.value?.detail
                                ?.approvedDate ??
                            ''),
                    //_buildCommentsSection(),
                    _buildActionButtons(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSectionHeaderWithStatus(String title, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                "Status :",
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 4),
              Text(
                status,
                style: TextStyle(
                  fontSize: 12.0,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
              height: 5), // Adjust spacing between title and status if needed
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

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 10.0, bottom: 10.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.poppins().fontFamily,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Column(
      children: [
        SizedBox(height: 5),
        Divider(
          color: appTheme.gray500,
          thickness: 1.0,
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildBudgetHistory(String label1, String separator, String label2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
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
        SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildBudgetHistory2(String label1, String separator, String label2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
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
                  color: const Color.fromARGB(255, 0, 0, 0),
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
                  color: Color.fromARGB(255, 157, 4, 12),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildPayoutDetails() {
    return Container(
      width: 330.w,
      height: 253.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Column(
        children: [
          _buildPayoutHeaderRow(),
          _buildPayoutRow('Positive Payout', '200', '2500'),
          _buildPayoutRow('Negative Payout', '0', '0'),
          _buildPayoutRow('Zero Payout', '0', '-'),
          _buildPayoutRow('Error/Bank Payout', '0', '-'),
        ],
      ),
    );
  }

  Widget _buildPayoutHeaderRow() {
    return Column(
      children: [
        Container(
          color: Color.fromARGB(
              255, 245, 238, 238), // Set grey color for the background
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPayoutHeaderCell('Description'),
              _buildPayoutHeaderCell('User'),
              _buildPayoutHeaderCell('Points'),
            ],
          ),
        ),
        Divider(
          color: Colors.grey,
          thickness: 1.0,
        ),
      ],
    );
  }

  Widget _buildPayoutHeaderCell(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      width: 100.w,
      //color: Colors.grey, // Set grey color for the background
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.poppins().fontFamily,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildPayoutRow(String description, String user, String points) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildPayoutCell(description),
            _buildPayoutCell(user),
            _buildPayoutCell(points),
          ],
        ),
        Divider(
          color: Colors.grey,
          thickness: 1.0,
        ),
      ],
    );
  }

  Widget _buildPayoutCell(String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      width: 100.w,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
          fontFamily: GoogleFonts.poppins().fontFamily,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildNotesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Text(
        'Note - Points distribution will be done only for users with positive payout.',
        style: TextStyle(
          fontSize: 14.sp,
          color: Color(0xFF383853),
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
      ),
    );
  }

  // Widget _buildDateTimeRow() {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 10.0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         _buildDateTimeCell('Last Updated at', '22-02-2022 17:12:46'),
  //         _buildDateTimeCell('Next Update Expected at', '23-02-2022 17:12:46'),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildDateTimeCell(String title, String dateTime) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         title,
  //         style: TextStyle(
  //           fontSize: 14.sp,
  //           fontWeight: FontWeight.bold,
  //           color: Color(0xFF383853),
  //           fontFamily: GoogleFonts.poppins().fontFamily,
  //         ),
  //       ),
  //       SizedBox(height: 5.h),
  //       Text(
  //         dateTime,
  //         style: TextStyle(
  //           fontSize: 14.sp,
  //           color: Colors.black,
  //           fontFamily: GoogleFonts.poppins().fontFamily,
  //         ),
  //       ),
  //     ],
  //   );
  // }

  // Widget _buildCommentsSection() {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         'Comments * :',
  //         style: TextStyle(
  //           fontSize: 16.sp,
  //           fontWeight: FontWeight.bold,
  //           color: Color(0xFF383853),
  //           fontFamily: GoogleFonts.poppins().fontFamily,
  //         ),
  //       ),
  //       SizedBox(height: 5.h),
  //       Container(
  //         width: 330.w,
  //         height: 110.h,
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           border: Border.all(
  //             color: Colors.grey,
  //             width: 1.0,
  //           ),
  //           borderRadius: BorderRadius.circular(5.r),
  //         ),
  //         child: TextField(
  //           maxLines: null,
  //           decoration: InputDecoration(
  //             hintText: 'Enter your comments here',
  //             border: InputBorder.none,
  //             contentPadding:
  //                 EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildActionButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Container(
          //   width: 98.w,
          //   height: 48.h,
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     border: Border.all(
          //       color: Color(0xFF7B8191),
          //       width: 1.0,
          //     ),
          //     borderRadius: BorderRadius.circular(5.r),
          //   ),
          //   child: TextButton(
          //     onPressed: () {
          //       // Handle Reject action
          //     },
          //     child: Text(
          //       'Reject',
          //       style: TextStyle(
          //         color: Color(0xFF7B8191),
          //         fontSize: 14.sp,
          //         fontWeight: FontWeight.bold,
          //         fontFamily: GoogleFonts.poppins().fontFamily,
          //       ),
          //     ),
          //   ),
          // ),
          Container(
            width: 125.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: appTheme.redappbar,
            ),
            child: TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                'Ok',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
