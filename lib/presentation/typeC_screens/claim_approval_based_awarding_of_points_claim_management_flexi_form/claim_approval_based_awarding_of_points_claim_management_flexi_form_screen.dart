import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/model/gridItem.dart';
import 'package:incentivesgit/presentation/typeC_screens/claim_approval_based_awarding_of_points_claim_management_flexi_form/controller/claim_approval_based_awarding_of_points_claim_management_flexi_form_Controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class ClaimApprovalBasedAwardingofPointsClaimManagementFlexiForm
    extends GetWidget<
        ClaimApprovalBasedAwardingofPointsClaimManagementFlexiFormController> {
  const ClaimApprovalBasedAwardingofPointsClaimManagementFlexiForm({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        backgroundColor: appTheme.grey,
        body: SafeArea(top: true, child: claimManagement(context)),
        floatingActionButton: FloatingActionButton(
          backgroundColor: appTheme.rediconbackground,
          foregroundColor: appTheme.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r)),
          onPressed: () {},
          child: Icon(
            Icons.add,
            size: 23.9.sp,
          ),
        ),
      ),
    );
  }

  Widget claimManagement(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      color: appTheme.grey,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'Claims Summary',
              style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                  color: appTheme.black900),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OptionCard(
                imagePath: ImageConstant.cornerdownright,
                points: 50,
                text: 'Submitted',
              ),
              OptionCard(
                imagePath: ImageConstant.rejectedclaims,
                points: 10,
                text: 'Rejected',
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OptionCard(
                imagePath: ImageConstant.approved,
                points: 20,
                text: 'Approved',
              ),
              OptionCard(
                imagePath: ImageConstant.pending,
                points: 10,
                text: 'Pending',
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              OptionCard(
                imagePath: ImageConstant.delete,
                points: 10,
                text: 'Discarded',
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              'All Claims',
              style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: appTheme.black900),
            ),
          ),
          _rejecteddata(context),
          SizedBox(
            height: 10.h,
          ),
          _accepteddata(context),
          SizedBox(
            height: 10.h,
          ),
          _rejecteddata(context),
        ],
      ),
    );
  }

  Widget _rejecteddata(BuildContext context) {
    return Container(
      height: 184.0,
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
                        'C10009',
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: appTheme.black900),
                      ),
                      Text(
                        'Claim Id',
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                            color: appTheme.cyan800),
                      ),
                    ],
                  )),
                  GestureDetector(
                      onTapDown: (TapDownDetails details) {
                        showMenu(
                          context: context,
                          position: RelativeRect.fromLTRB(
                            details.globalPosition.dx,
                            details.globalPosition.dy,
                            details.globalPosition.dx,
                            details.globalPosition.dy,
                          ),
                          items: <PopupMenuEntry>[
                            PopupMenuItem(
                              child: Text(
                                'View Details',
                                style: TextStyle(
                                    fontFamily: GoogleFonts.roboto().fontFamily,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.sp,
                                    color: appTheme.black900),
                              ),
                            ),
                            PopupMenuItem(
                              child: Text(
                                'Approval History',
                                style: TextStyle(
                                    fontFamily: GoogleFonts.roboto().fontFamily,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.sp,
                                    color: appTheme.black900),
                              ),
                            ),
                          ],
                        ).then((value) {
                          // Handle selected option
                          if (value != null) {
                            print('Selected: $value');
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SvgPicture.asset(
                          ImageConstant.morevert,
                          width: 3.75.w,
                          height: 15.02.h,
                        ),
                      )),
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
                  Column(
                    children: [
                      Text(
                        "123454",
                        style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: appTheme.black900),
                      ),
                      Text(
                        "Invoice Id",
                        style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                            color: appTheme.black900),
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
                        "4",
                        style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: appTheme.black900),
                      ),
                      Text(
                        "Total Invoice Value",
                        style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                            color: appTheme.black900),
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
                        "5,000",
                        style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: appTheme.black900),
                      ),
                      Text(
                        "Points",
                        style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                            color: appTheme.black900),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 97.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle, color: appTheme.lightpink),
                    padding: const EdgeInsets.all(2.0),
                    child: Center(
                      child: Text(
                        'Rejected',
                        style: TextStyle(
                          color: appTheme.redtext,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                      '17 May,2023',
                      style: TextStyle(
                          color: appTheme.gray40003,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic),
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

  Widget _accepteddata(BuildContext context) {
    return Container(
      height: 184.0,
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
                        'C10009',
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: appTheme.black900),
                      ),
                      Text(
                        'Claim Id',
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                            color: appTheme.cyan800),
                      ),
                    ],
                  )),
                  GestureDetector(
                      onTapDown: (TapDownDetails details) {
                        showMenu(
                          context: context,
                          position: RelativeRect.fromLTRB(
                            details.globalPosition.dx,
                            details.globalPosition.dy,
                            details.globalPosition.dx,
                            details.globalPosition.dy,
                          ),
                          items: <PopupMenuEntry>[
                            PopupMenuItem(
                              child: Text(
                                'View Details',
                                style: TextStyle(
                                    fontFamily: GoogleFonts.roboto().fontFamily,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.sp,
                                    color: appTheme.black900),
                              ),
                            ),
                            PopupMenuItem(
                              child: Text(
                                'Approval History',
                                style: TextStyle(
                                    fontFamily: GoogleFonts.roboto().fontFamily,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14.sp,
                                    color: appTheme.black900),
                              ),
                            ),
                          ],
                        ).then((value) {
                          // Handle selected option
                          if (value != null) {
                            print('Selected: $value');
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: SvgPicture.asset(
                          ImageConstant.morevert,
                          width: 3.75.w,
                          height: 15.02.h,
                        ),
                      )),
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
                  Column(
                    children: [
                      Text(
                        "123455",
                        style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: appTheme.black900),
                      ),
                      Text(
                        "Invoice Number",
                        style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                            color: appTheme.black900),
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
                        "4",
                        style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: appTheme.black900),
                      ),
                      Text(
                        "Total Invoice Value",
                        style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                            color: appTheme.black900),
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
                        "1,000",
                        style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                            color: appTheme.black900),
                      ),
                      Text(
                        "Points",
                        style: TextStyle(
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                            color: appTheme.black900),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 97.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle, color: appTheme.lightaqua),
                    padding: const EdgeInsets.all(2.0),
                    child: Center(
                      child: Text(
                        'Approved',
                        style: TextStyle(
                          color: appTheme.green,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                      '17 May,2023',
                      style: TextStyle(
                          color: appTheme.gray40003,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic),
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
