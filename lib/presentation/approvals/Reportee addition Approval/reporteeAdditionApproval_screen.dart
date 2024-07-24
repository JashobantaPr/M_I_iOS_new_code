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
import 'package:incentivesgit/presentation/Approvals/Reportee%20addition%20Approval/controller/reporteecontroller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class ReporteeAdditionApprovalScreen
    extends GetWidget<ReporteeAdditionApprovalController> {
  const ReporteeAdditionApprovalScreen({super.key});

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
                      'Request Details',
                      controller.myReporteeDetails.value?.detail?.isNotEmpty ==
                              true
                          ? controller
                              .myReporteeDetails.value!.detail![0].status
                          : '',
                    ),
                    _buildDivider(),
                    _buildBudgetHistoryy(
                      'Request Name',
                      ':',
                      '${controller.myReporteeDetails.value?.requester?.firstName ?? ''} ${controller.myReporteeDetails.value?.requester?.lastName ?? ''}',
                      controller.myReporteeDetails.value?.requester?.profile ??
                          '', // Ensure this is the correct image URL
                    ),

                    _buildBudgetHistory(
                        'Requester Email id',
                        ':',
                        controller.myReporteeDetails.value?.requester?.email ??
                            ''),
                    _buildBudgetHistory(
                        'Date of Request',
                        ':',
                        controller.myReporteeDetails.value?.detail
                                    ?.isNotEmpty ==
                                true
                            ? controller
                                .myReporteeDetails.value!.detail![0].recorddate
                            : ''),
                    _buildSectionHeader1('Reportee"s Request Form'),
                    _buildDivider(),
                    _buildBudgetHistoryy(
                      'Name',
                      ':',
                      controller.myReporteeDetails.value?.detail?.isNotEmpty ==
                              true
                          ? '${controller.myReporteeDetails.value!.detail![0].firstName} ${controller.myReporteeDetails.value!.detail![0].lastName}'
                          : null, // Provide null for the label2 if detail is empty
                      controller.myReporteeDetails.value?.requester?.profile ??
                          '', // Profile image URL
                    ),
                    _buildBudgetHistory(
                        'Email id',
                        ':',
                        controller.myReporteeDetails.value?.detail
                                    ?.isNotEmpty ==
                                true
                            ? controller
                                .myReporteeDetails.value!.detail![0].email
                            : ''),
                    _buildBudgetHistory(
                        'Emplyee id',
                        ':',
                        controller.myReporteeDetails.value?.detail
                                    ?.isNotEmpty ==
                                true
                            ? controller
                                .myReporteeDetails.value!.detail![0].empoyeeId
                            : ''),
                    _buildBudgetHistory(
                        'Role',
                        ':',
                        controller.myReporteeDetails.value?.rolesData?.name ??
                            ''),
                    _buildBudgetHistory(
                        'Phone number',
                        ':',
                        controller.myReporteeDetails.value?.detail
                                    ?.isNotEmpty ==
                                true
                            ? controller
                                .myReporteeDetails.value!.detail![0].phoneNumber
                            : ''),
                    _buildBudgetHistory(
                        'Department',
                        ':',
                        controller.myReporteeDetails.value?.department?.name ??
                            ''),
                    _buildBudgetHistory(
                        'Designation',
                        ':',
                        controller.myReporteeDetails.value?.designation?.name ??
                            ''),
                    _buildBudgetHistory(
                        'Scope',
                        ':',
                        controller.myReporteeDetails.value?.scopesData
                                ?.scopeName ??
                            ''),
                    _buildBudgetHistory(
                        'Hierarchy Level N_2',
                        ':',
                        controller.myReporteeDetails.value?.hierarchy
                                ?.hierarchyN2 ??
                            ''),
                    _buildBudgetHistory(
                        'Hierarchy Level N_1',
                        ':',
                        controller.myReporteeDetails.value?.hierarchy
                                ?.hierarchyN1 ??
                            ''),
                    _buildBudgetHistory(
                        'Hierarchy Level N',
                        ':',
                        controller.myReporteeDetails.value?.hierarchy
                                ?.hierarchyN ??
                            ''),
                    _buildSectionHeader1('Approver Details'),

                    _buildDivider(),
                    _buildBudgetHistory(
                      'Approver Email id',
                      ':',
                      controller.myReporteeDetails.value?.detail.isNotEmpty ==
                              true
                          ? controller.myReporteeDetails.value!.detail.first
                                  .approverEmail ??
                              ''
                          : '',
                    ),
                    _buildBudgetHistory(
                      'Approver Email id',
                      ':',
                      controller.myReporteeDetails.value?.detail.isNotEmpty ==
                              true
                          ? controller.myReporteeDetails.value!.detail.first
                                  .comment ??
                              ''
                          : '',
                    ),
                    _buildBudgetHistory(
                      'Approver Email id',
                      ':',
                      controller.myReporteeDetails.value?.detail.isNotEmpty ==
                              true
                          ? controller.myReporteeDetails.value!.detail.first
                                  .approverDate ??
                              ''
                          : '',
                    ),

                    // _buildDivider(),
                    // _buildCommentsSection(),
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

  Widget _buildSectionHeader1(String title) {
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

  Widget _buildSectionHeaderWithStatus(String title, String status) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
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
          Text(
            status,
            style: TextStyle(
                fontSize: 12.0,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: Colors.green.shade600,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildBudgetHistoryy(
      String label1, String separator, String? label2, String? profileImage) {
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
              child: Row(
                children: [
                  if (profileImage != null && profileImage.isNotEmpty)
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.red,
                          width: 2.0,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(profileImage),
                        radius: 14.0,
                        backgroundColor: Colors.white,
                      ),
                    )
                  else
                    CircleAvatar(
                      radius: 14.0,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      label2 ?? '',
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
          ],
        ),
        SizedBox(height: 16.0),
      ],
    );
  }

  Widget _buildBudgetHistory(String label1, String separator, String? label2) {
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
                label2 ?? '',
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
            width: 120.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: appTheme.redappbar,
              borderRadius: BorderRadius.circular(0.r),
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
