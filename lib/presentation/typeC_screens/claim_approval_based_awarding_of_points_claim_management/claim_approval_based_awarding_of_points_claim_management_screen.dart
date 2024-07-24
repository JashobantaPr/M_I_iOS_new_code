import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/model/gridItem.dart';
import 'package:incentivesgit/presentation/typeC_screens/claim_approval_based_awarding_of_points_claim_management/controller/claimapprovalbasedawardingofpointsclaimmanagementController.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class ClaimApprovalBasedAwardingofPointsClaimManagement extends GetWidget<
    ClaimApprovalBasedAwardingofPointsClaimManagementController> {
  const ClaimApprovalBasedAwardingofPointsClaimManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        backgroundColor: appTheme.grey,
        body: SafeArea(
          top: true,
          child: claimManagement(context),
        ),
        floatingActionButton: Obx(
          () => controller.showAddClaimButton.value
              ? FloatingActionButton(
                  backgroundColor: appTheme.rediconbackground,
                  foregroundColor: appTheme.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  onPressed: () {
                    if (controller.claimType.value == '1') {
                      Get.toNamed(AppRoutes.typeccreateclaim,
                          arguments: Get.arguments);
                    } else {
                      Get.toNamed(AppRoutes.createclaimmanagement,
                          arguments: Get.arguments);
                    }
                  },
                  child: Icon(
                    Icons.add,
                    size: 23.9.sp,
                  ),
                )
              : const SizedBox(),
        ),
      ),
    );
  }

  Widget claimManagement(BuildContext context) {
    final controller =
        Get.find<ClaimApprovalBasedAwardingofPointsClaimManagementController>();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      color: appTheme.grey,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                right: 190,
                bottom: 10,
              ),
              child: Text(
                'Claims Summary',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                  color: appTheme.black900,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Obx(
                      () => OptionCard(
                        imagePath: ImageConstant.cornerdownright,
                        points: controller.points.value.submitted,
                        text: 'Submitted',
                      ),
                    ),
                  ),
                  const SizedBox(width: 5), // Minimal spacing between cards
                  Flexible(
                    child: Obx(
                      () => OptionCard(
                        imagePath: ImageConstant.rejectedclaims,
                        points: controller.points.value.rejected,
                        text: 'Rejected',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Obx(
                      () => OptionCard(
                        imagePath: ImageConstant.approved,
                        points: controller.points.value.approved,
                        text: 'Approved',
                      ),
                    ),
                  ),
                  const SizedBox(width: 5), // Minimal spacing between cards
                  Flexible(
                    child: Obx(
                      () => OptionCard(
                        imagePath: ImageConstant.pending,
                        points: controller.points.value.pending,
                        text: 'Pending',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 160,
                    child: Obx(
                      () => OptionCard(
                        imagePath: ImageConstant.delete,
                        points: controller.points.value.discarded,
                        text: 'Discarded',
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15, right: 240),
              child: Text(
                'All Claims',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: appTheme.black900,
                ),
              ),
            ),
            Obx(
              () => ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.allClaims.value.length,
                itemBuilder: (context, index) {
                  return _rejecteddata(context, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rejecteddata(BuildContext context, int index) {
    final controller =
        Get.find<ClaimApprovalBasedAwardingofPointsClaimManagementController>();
    final claim = controller.allClaims.value[index];
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(ImageConstant.recipientlong),
                  SizedBox(width: 8.0.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          claim.claimCode,
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: appTheme.black900,
                          ),
                        ),
                        Text(
                          'Claim Id',
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                            color: appTheme.cyan800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (String value) {
                      if (value == 'viewDetails') {
                        Get.toNamed(
                          AppRoutes.typeCClaimDetails,
                          arguments: claim.claimId,
                        );
                        print('sdadszx${claim.claimId}');
                      } else if (value == 'approvalHistory') {
                        Get.toNamed(AppRoutes.typecflexiformapproval,
                            arguments: claim.claimId);
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
                        onTap: () {
                          print('NEWCLAIMID${claim.claimId}');
                          Get.toNamed(
                            AppRoutes.typeCClaimDetails,
                            arguments: claim.claimId,
                          );
                        },
                        value: 'viewDetails',
                        child: Text(
                          'View Details',
                          style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.sp,
                            color: appTheme.black900,
                          ),
                        ),
                      ),
                      PopupMenuItem<String>(
                        value: 'approvalHistory',
                        child: Text(
                          'Approval History',
                          style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.normal,
                            fontSize: 14.sp,
                            color: appTheme.black900,
                          ),
                        ),
                      ),
                    ],
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: SvgPicture.asset(
                        ImageConstant.morevert,
                        width: 3.75.w,
                        height: 15.02.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0.h),
            Divider(
              color: appTheme.greydivider,
              thickness: 1,
            ),
            SizedBox(height: 12.0.h),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Column(
                  //   children: [
                  //     Text(
                  //       "${claim.skuCode}",
                  //       style: TextStyle(
                  //         fontFamily: GoogleFonts.roboto().fontFamily,
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 17.sp,
                  //         color: appTheme.black900,
                  //       ),
                  //     ),
                  //     Text(
                  //       "SKU ID",
                  //       style: TextStyle(
                  //         fontFamily: GoogleFonts.roboto().fontFamily,
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 13.sp,
                  //         color: appTheme.greytextcolour,
                  //       ),
                  //     )
                  //   ],
                  // ),
                  Column(
                    children: [
                      Text(
                        claim.invoiceId,
                        style: TextStyle(
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.sp,
                          color: appTheme.black900,
                        ),
                      ),
                      Text(
                        "Invoice ID",
                        style: TextStyle(
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                          color: appTheme.greytextcolour,
                        ),
                      )
                    ],
                  ),
                  VerticalDivider(
                    color: appTheme.greydivider,
                    thickness: 1,
                    width: 1,
                    indent: 12,
                    endIndent: 7,
                  ),
                  Column(
                    children: [
                      Text(
                        claim.claimType,
                        style: TextStyle(
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                          color: appTheme.black900,
                        ),
                      ),
                      Text(
                        "Total invoice value claim",
                        style: TextStyle(
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp,
                          color: appTheme.greytextcolour,
                        ),
                      )
                    ],
                  ),
                  VerticalDivider(
                    color: appTheme.greydivider,
                    thickness: 1,
                    width: 1,
                    indent: 12,
                    endIndent: 7,
                  ),
                  Column(
                    children: [
                      Text(
                        claim.totalPoints,
                        style: TextStyle(
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.sp,
                          color: appTheme.black900,
                        ),
                      ),
                      Text(
                        "Points",
                        style: TextStyle(
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                          color: appTheme.greytextcolour,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 120.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: _getColorByStatus(claim.statusName),
                    ),
                    padding: const EdgeInsets.all(2.0),
                    child: Center(
                      child: Text(
                        claim.statusName,
                        style: TextStyle(
                          color: appTheme.black900,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                      // Parse the string to a DateTime object and format it to display the date in "d MMMM yyyy" format
                      DateFormat('d MMMM yyyy')
                          .format(DateTime.parse(claim.createDate)),
                      style: TextStyle(
                        color: appTheme.greytextcolour,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColorByStatus(String statusName) {
    switch (statusName) {
      case 'Pending For Approval':
        return Colors.pink.shade100;
      case 'Rejected':
        return Colors.red.shade300;
      case 'Approved':
        return Colors.green.shade100;
      case 'Discarded':
        return Colors.red.shade200;
      default:
        return Colors.white; // Set a default color if needed
    }
  }
}
