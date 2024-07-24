import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/Approvals/Approval_MyRequest/controller/myrequestController.dart';
import 'package:incentivesgit/presentation/Approvals/Approval_MyRequest/module/myrequestModule.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class MyRequestScreen extends GetWidget<MyRequestController> {
  const MyRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          body: Container(
            width: 1.sw,
            color: appTheme.grey500,
            child: Padding(
              padding: EdgeInsets.all(10.0.w),
              child: Column(
                children: [
                  _buildSearchBar(),
                  SizedBox(height: 10.h),
                  Obx(() {
                    if (controller.budgetRequests.isEmpty) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: controller.budgetRequests.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                _buildOrderContainer(
                                    controller.budgetRequests[index]),
                                if (index !=
                                    controller.budgetRequests.length - 1) ...[
                                  SizedBox(height: 10.h),
                                  Divider(
                                      color: appTheme.gray500, thickness: 1.0),
                                ],
                              ],
                            );
                          },
                        ),
                      );
                    }
                  }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
            ),
            Expanded(
              child: TextField(
                cursorColor: appTheme.black600,
                onChanged: (value) {},
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search',
                    contentPadding: EdgeInsets.only(bottom: 4)),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderContainer(Request budgetRequest) {
    return Container(
      padding: EdgeInsets.symmetric(),
      height: 180.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(3.r)),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40.h),
                    _buildBudgetHistory(
                        'Request Id', ':', budgetRequest.budgetRequestId),
                    SizedBox(height: 2.h),
                    _buildBudgetHistory(
                        'Request Date', ':', budgetRequest.requestedDate),
                    SizedBox(height: 2.h),
                    _buildBudgetHistory(
                        'Request Type', ':', budgetRequest.requestType),
                  ],
                ),
              ),
              SizedBox(width: 10.w),
              Padding(
                padding: const EdgeInsets.only(top: 30, right: 10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 35.r,
                            backgroundColor: Colors.red,
                            child: CircleAvatar(
                              radius: 32.r,
                              backgroundImage: NetworkImage(
                                  '${budgetRequest.profileImgLink}${budgetRequest.profile}'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      budgetRequest.requestBy,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 190.w,
              height: 36.h,
              decoration: BoxDecoration(
                color: budgetRequest.status == 'Approved'
                    ? Color(0xFF47990B)
                    : Colors.red,
                borderRadius: BorderRadius.circular(3.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    budgetRequest.status,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Icon(
                    budgetRequest.status == 'Approved'
                        ? Icons.check_circle_outline
                        : Icons.cancel,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -2,
            right: -5,
            child: PopupMenuButton<String>(
              position: PopupMenuPosition.under,
              offset: const Offset(-13, 0),
              onSelected: (String value) {
                switch (budgetRequest.name) {
                  case 'Type C Total hierarchy changes':
                    Get.toNamed(AppRoutes.requestpendingg);
                    break;

                  case 'Alexa One':
                    Get.toNamed(AppRoutes.approveddetails);
                    break;
                  default:
                    // Handle the default case if needed
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String>(
                    height: 25,
                    textStyle: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: appTheme.black600,
                    ),
                    padding: EdgeInsets.only(
                      left: 10.w,
                      right: 40.w,
                      top: 8.h,
                      bottom: 8.h,
                    ),
                    value: 'View Details',
                    child: const Text('View Details'),
                  ),
                ];
              },
              icon: SvgPicture.asset(ImageConstant.morevert),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBudgetHistory(String label1, String separator, String label2) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80.w,
            child: Text(
              label1,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: appTheme.black600,
              ),
            ),
          ),
          Text(
            separator,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              label2,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: appTheme.black600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
