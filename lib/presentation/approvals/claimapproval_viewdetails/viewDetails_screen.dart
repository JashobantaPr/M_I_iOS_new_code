import 'dart:convert';

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
import 'package:incentivesgit/presentation/Approvals/claimapproval_viewdetails/controller/claimapproval_viewdetails_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class ClaimApprovalViewDetailsScreen
    extends GetWidget<ClaimApprovalViewDetailsController> {
  const ClaimApprovalViewDetailsScreen({super.key});

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
              child: Obx(
                () => ListView(
                  children: [
                    _buildSectionHeaderWithStatus(
                      'Claim Submission For',
                      controller.myProductDetails.value?.viewReferral
                              ?.getProgram?.name ??
                          '',
                    ),
                    _buildDivider(),
                    _buildBudgetHistory(
                        'Campaign Name',
                        ':',
                        controller.myProductDetails.value?.viewReferral
                                ?.getProgram?.name ??
                            ''),
                    _buildBudgetHistory(
                        'Requested By',
                        ':',
                        controller.myProductDetails.value?.viewReferral
                                ?.requestedBy ??
                            ''),
                    _buildBudgetHistory(
                        'Approver Email Id',
                        ':',
                        controller.myProductDetails.value?.viewReferral
                                ?.approverEmail ??
                            ''),
                    _buildBudgetHistory(
                        'Status',
                        ':',
                        controller
                                .myProductDetails
                                .value
                                ?.viewReferral
                                ?.referral
                                ?.claimDetails
                                ?.campaignAwardingDetailsStatusName ??
                            ''),
                    _buildSectionHeader('Referral Details'),
                    _buildDivider(),
                    _buildBudgetHistory(
                        'Request Id',
                        ':',
                        controller.myProductDetails.value?.viewReferral
                                ?.referral?.details?.referralIdCode ??
                            ''),
                    _buildBudgetHistory(
                        'Referee Name',
                        ':',
                        controller.myProductDetails.value?.viewReferral
                                ?.referral?.details?.refereeName ??
                            ''),
                    _buildBudgetHistory(
                        'Mobile Number',
                        ':',
                        controller.myProductDetails.value?.viewReferral
                                ?.referral?.details?.refereeMobileNumber ??
                            ''),
                    _buildBudgetHistory(
                        'Email Id',
                        ':',
                        controller.myProductDetails.value?.viewReferral
                                ?.referral?.details?.refereeEmailId ??
                            ''),
                    _buildBudgetHistory(
                        'Product(s)',
                        ':',
                        controller.myProductDetails.value?.viewReferral
                                    ?.referral?.productDetails !=
                                null
                            ? controller.myProductDetails.value!.viewReferral!
                                .referral!.productDetails
                                .map((product) => product.code)
                                .join(', ')
                            : ''),
                    _buildBudgetHistory(
                        'City',
                        ':',
                        controller.myProductDetails.value?.viewReferral
                                ?.hierarchyParentNodeid ??
                            ''),
                    _buildBudgetHistory(
                        'Store',
                        ':',
                        controller.myProductDetails.value?.viewReferral
                                ?.referral?.hierarchyChildNodeid ??
                            ''),
                    _buildBudgetHistory(
                        'Referral Date',
                        ':',
                        controller.myProductDetails.value?.viewReferral
                                ?.referral?.details?.createDate ??
                            ''),
                    _buildBudgetHistory(
                        'Referral Code',
                        ':',
                        controller.myProductDetails.value?.viewReferral
                                ?.referral?.details?.referralCode ??
                            ''),
                    _buildSectionHeader('Claim Details'),
                    _buildDivider(),
                    _buildBudgetHistory(
                        'Claim Id',
                        ':',
                        controller.myProductDetails.value?.viewReferral
                                ?.referral?.claimDetails?.claimCode ??
                            ''),
                    _buildBudgetHistory(
                        'Referee Name',
                        ':',
                        controller.myProductDetails.value?.viewReferral
                                ?.refereeName ??
                            ''),
                    _buildBudgetHistory(
                        'City',
                        ':',
                        controller.myProductDetails.value?.viewReferral
                                ?.hierarchyParentNodeid ??
                            ''),
                    _buildBudgetHistory(
                        'Store',
                        ':',
                        controller.myProductDetails.value?.viewReferral
                                ?.hierarchyChildNodeid ??
                            ''),
                    _buildBudgetHistory(
                        'Product Purchased',
                        ':',
                        controller.myProductDetails.value?.viewReferral
                                ?.referral?.claimDetails?.skuCode ??
                            ''),
                    _buildBudgetHistory(
                        'Date of Purchase',
                        ':',
                        controller.myProductDetails.value?.viewReferral
                                ?.referral?.claimDetails?.createDate ??
                            ''),
                    _buildBudgetHistory(
                        'Invoice Id',
                        ':',
                        controller.myProductDetails.value?.viewReferral
                                ?.referral?.claimDetails?.invoiceId ??
                            ''),
                    _buildBudgetHistory(
                        'Referral Code',
                        ':',
                        controller.myProductDetails.value?.viewReferral
                                ?.referral?.claimDetails?.referralCode ??
                            ''),
                    _buildBudgetHistory1(
                      context, // Ensure this is a valid BuildContext
                      'Attachment',
                      ':',
                      'View Invoice Copy',
                      controller.myProductDetails.value?.viewReferral?.referral
                              ?.invoiceImageUrl ??
                          '',
                    ),

                    _buildSectionHeader('Earned Points'),
                    _buildDivider(),
                    _buildBudgetHistory(
                        'Referee Points',
                        ':',
                        controller.myProductDetails.value?.viewReferral
                                ?.referral?.claimDetails?.pointsToReferee ??
                            ''),
                    _buildBudgetHistory(
                        'Referrer Name',
                        ':',
                        controller.myProductDetails.value?.viewReferral
                                ?.referral?.claimDetails?.pointsToReferrer ??
                            ''),
                    // _buildCommentsSection(),
                    //_buildActionButtons(),
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
            mainAxisAlignment: MainAxisAlignment
                .spaceBetween, // Aligns children to start and end
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
              SizedBox(
                width: 6,
              ),
              Flexible(
                child: Row(
                  children: [
                    Text(
                      "Status :",
                      style: TextStyle(
                        fontSize: 11.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      status,
                      style: TextStyle(
                        fontSize: 8.0,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
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

  Widget _buildBudgetHistory1(
    BuildContext context,
    String title,
    String colon,
    String buttonText,
    String invoiceImage,
  ) {
    String displayText = buttonText; // Initially display the button text

    return GestureDetector(
      onTap: () {
        // Update displayText to show the invoice image filename when tapped
        displayText = invoiceImage;
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: Image.network(
              invoiceImage,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Text(
                    'No image Found',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                    ),
                  ),
                );
              },
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Close'),
              ),
            ],
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.black,
                  ),
                ),
                Text(
                  colon,
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 4),
                Text(
                  displayText,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
          ],
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

  // Widget _buildActionButtons() {
  //   return Padding(
  //     padding: EdgeInsets.symmetric(vertical: 20.h),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: [
  //         Container(
  //           width: 98.w,
  //           height: 48.h,
  //           decoration: BoxDecoration(
  //             color: Colors.white,
  //             border: Border.all(
  //               color: Color(0xFF7B8191),
  //               width: 1.0,
  //             ),
  //             borderRadius: BorderRadius.circular(5.r),
  //           ),
  //           child: TextButton(
  //             onPressed: () {
  //               // Handle Reject action
  //             },
  //             child: Text(
  //               'Reject',
  //               style: TextStyle(
  //                 color: Color(0xFF7B8191),
  //                 fontSize: 14.sp,
  //                 fontWeight: FontWeight.bold,
  //                 fontFamily: GoogleFonts.poppins().fontFamily,
  //               ),
  //             ),
  //           ),
  //         ),
  //         Container(
  //           width: 98.w,
  //           height: 48.h,
  //           decoration: BoxDecoration(
  //             color: Colors.red,
  //             borderRadius: BorderRadius.circular(5.r),
  //           ),
  //           child: TextButton(
  //             onPressed: () {
  //               // Handle Approve action
  //             },
  //             child: Text(
  //               'Approve',
  //               style: TextStyle(
  //                 color: Colors.white,
  //                 fontSize: 14.sp,
  //                 fontWeight: FontWeight.bold,
  //                 fontFamily: GoogleFonts.poppins().fontFamily,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
