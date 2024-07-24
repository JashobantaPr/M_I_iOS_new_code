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
import 'package:incentivesgit/presentation/typeC_screens/TypeC_KpiSku_Regression_awardingpoints_claim_management/controller/TypeC_KpiSku_Regression_awardingpoints_claim_management_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class TypeCKpiSkuAwardingPointsClaimManagementScreen
    extends GetWidget<TypeCKpiSkuAwardingPointsClaimManagementController> {
  const TypeCKpiSkuAwardingPointsClaimManagementScreen({super.key});

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
                      print('Getss ${Get.arguments}');
                      Get.toNamed(AppRoutes.typeccreateclaim,
                          arguments: Get.arguments);
                    } else {
                      print('Getss ${Get.arguments}');
                      Get.toNamed(AppRoutes.createclaimmanagement,
                          arguments: Get.arguments);
                    }
                  },
                  child: Icon(
                    Icons.add,
                    size: 23.9.sp,
                  ),
                )
              : SizedBox(),
        ),
      ),
    );
  }

  Widget claimManagement(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: appTheme.grey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 5,
                bottom: 4,
              ),
              child: Text(
                'Claim Summary',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                  color: appTheme.black900,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => OptionCard(
                    imagePath: ImageConstant.cornerdownright,
                    points: controller.points.value.submitted,
                    text: 'Submitted',
                  ),
                ),
                Obx(
                  () => OptionCard(
                    imagePath: ImageConstant.rejectedclaims,
                    points: controller.points.value.rejected,
                    text: 'Rejected',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => OptionCard(
                    imagePath: ImageConstant.approved,
                    points: controller.points.value.approved,
                    text: 'Approved',
                  ),
                ),
                Obx(
                  () => OptionCard(
                    imagePath: ImageConstant.pending,
                    points: controller.points.value.pending,
                    text: 'Pending',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Obx(
                  () => OptionCard(
                    imagePath: ImageConstant.delete,
                    points: controller.points.value.discarded,
                    text: 'Discarded',
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 10, right: 240),
              child: Text(
                'Claims',
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
                physics: NeverScrollableScrollPhysics(),
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
    final claim = controller.allClaims[index];
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
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
                          '${claim.claimCode}',
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
                        Get.toNamed(AppRoutes.typeckpiskuclaimdetails,
                            arguments: claim.claimId);
                        print(
                            'View Details selected, Claim ID: ${claim.claimId}');
                      } else if (value == 'approvalHistory') {
                        Get.toNamed(AppRoutes.claimapprovahistory,
                            arguments: claim.claimId);
                        print(
                            'Approval History selected, Claim ID: ${claim.claimId}');
                      }
                    },
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem<String>(
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
            SizedBox(height: 5.0.h),
            IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Expanded(
                  //   child: Column(
                  //     children: [
                  //       Text(
                  //         "${claim.skuCode}",
                  //         style: TextStyle(
                  //           fontFamily: GoogleFonts.roboto().fontFamily,
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 14.sp,
                  //           color: appTheme.black900,
                  //           overflow: TextOverflow.ellipsis,
                  //         ),
                  //       ),
                  //       Text(
                  //         "SKU ID",
                  //         style: TextStyle(
                  //           fontFamily: GoogleFonts.roboto().fontFamily,
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 12.sp,
                  //           color: appTheme.greytextcolour,
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "${claim.invoiceId}",
                          style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: appTheme.black900,
                          ),
                        ),
                        Text(
                          "Invoice ID",
                          style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: appTheme.greytextcolour,
                          ),
                        )
                      ],
                    ),
                  ),
                  VerticalDivider(
                    color: appTheme.greydivider,
                    thickness: 1,
                    width: 1,
                    indent: 12,
                    endIndent: 7,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "${claim.claimType}",
                          style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: appTheme.black900,
                          ),
                        ),
                        Text(
                          "Claim Type",
                          style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: appTheme.greytextcolour,
                          ),
                        )
                      ],
                    ),
                  ),
                  VerticalDivider(
                    color: appTheme.greydivider,
                    thickness: 1,
                    width: 1,
                    indent: 12,
                    endIndent: 7,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "${claim.totalPoints}",
                          style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: appTheme.black900,
                          ),
                        ),
                        Text(
                          "Points",
                          style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: appTheme.greytextcolour,
                          ),
                        )
                      ],
                    ),
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
                      width: 97.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: appTheme.lightpink,
                      ),
                      // padding: const EdgeInsets.all(2.0),
                      child: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(height: 0), 
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Text(
              "${claim.statusName}",
              style: TextStyle(
                color: appTheme.redtext,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ],
  ),
)
),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                      // DateFormat.yMd().format(DateTime.parse(claim.createDate)),
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
}
