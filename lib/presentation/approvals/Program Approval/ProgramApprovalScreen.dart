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
import 'package:incentivesgit/presentation/Approvals/Program%20Approval/controller/programApproval_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class ProgramApprovalScreen extends GetWidget<ProgramApprovalController> {
  const ProgramApprovalScreen({super.key});

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
          body: Container(
            width: 385,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  _buildSectionHeader('Claim Submission For'),
                  _buildDivider(),
                  _buildBudgetHistory('Campaign Name', ':', 'T000002315'),
                  _buildBudgetHistory('Requested By', ':', '18-11-2019'),
                  _buildBudgetHistory('Request Type ', ':', 'Roopa Rao'),
                  _buildBudgetHistory('Date of reques ', ':', 'Roopa Rao'),
                  _buildBudgetHistory('Hierarchy Level ', ':', 'Roopa Rao'),
                  _buildBudgetHistory2('Status', ':', 'Pending'),
                  _buildSectionHeader(
                      'Points Summary Till Now (Before this approval)'),
                  _buildDivider(),
                  _buildBudgetHistory(
                      'Total Allocation Points', ':', 'T000002315'),
                  _buildBudgetHistory(
                      'Awarded/Awarding Progress in Points', ':', '18-11-2019'),
                  _buildBudgetHistory('Balance Points', ':', 'Roopa Rao'),
                  _buildBudgetHistory1('See Less', '', ''),
                  _buildSectionHeader('Approver Details'),
                  _buildDivider(),
                  _buildMethodOfAwardingPoints(),
                  _buildPointsInfoBox('James Gordon - 1000 points'),
                  _buildPointsInfoBox('Sunil Shinde - 1000 points'),
                  _buildSectionHeader('Participant Wallet & Rewards'),
                  _buildDivider(),
                  _buildBudgetHistory('Total Awarding Points in this Approval',
                      ':', 'T000002315'),
                  _buildBudgetHistory(
                      'Awarded/Awarding Progress in Points', ':', '18-11-2019'),
                  _buildBudgetHistory(
                      'Remaining Points After this Approval', ':', 'Roopa Rao'),
                  _buildCommentsSection(),
                  _buildActionButtons(),
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
                  color: Color.fromARGB(255, 228, 105, 5),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildBudgetHistory1(String label1, String separator, String label2) {
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
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Color.fromARGB(255, 58, 8, 238),
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
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: Color.fromARGB(255, 58, 8, 238),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.0),
      ],
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

  Widget _buildMethodOfAwardingPoints() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Method of Awarding Points',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.poppins().fontFamily,
            color: Colors.black,
          ),
        ),
        Row(
          children: [
            Row(
              children: [
                Radio(
                  value: 'equal',
                  groupValue: 'award',
                  onChanged: (value) {
                    // Handle radio button state
                  },
                ),
                Text(
                  'Equal Awarding',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 'custom',
                  groupValue: 'award',
                  onChanged: (value) {
                    // Handle radio button state
                  },
                ),
                Text(
                  'Custom Awarding',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPointsInfoBox(String text) {
    return Obx(() {
      return GestureDetector(
        onTap: () {
          controller.toggleExpansion();
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          width: 330.w,
          height: controller.isExpanded.value ? 110.h : 38.h,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: controller.isExpanded.value
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildExpandedInfo('Designation', ':', 'Engineer'),
                    _buildExpandedInfo('UserStatus', ':', 'Active'),
                    _buildExpandedInfo('Points', ':', '1,000'),
                    _buildExpandedInfo('Approval Status', ':', 'Pending'),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: Colors.black,
                      ),
                    ),
                    Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                      size: 16.w,
                    ),
                  ],
                ),
        ),
      );
    });
  }

  Widget _buildExpandedInfo(String label1, String separator, String label2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
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
    );
  }

  Widget _buildCommentsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Comments * :',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Color(0xFF383853),
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
        SizedBox(height: 5.h),
        Container(
          width: 330.w,
          height: 110.h,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: TextField(
            maxLines: null,
            decoration: InputDecoration(
              hintText: 'Enter your comments here',
              border: InputBorder.none,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 98.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Color(0xFF7B8191),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: TextButton(
              onPressed: () {
                // Handle Reject action
              },
              child: Text(
                'Reject',
                style: TextStyle(
                  color: Color(0xFF7B8191),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ),
          ),
          Container(
            width: 98.w,
            height: 48.h,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(5.r),
            ),
            child: TextButton(
              onPressed: () {
                // Handle Approve action
              },
              child: Text(
                'Approval',
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
