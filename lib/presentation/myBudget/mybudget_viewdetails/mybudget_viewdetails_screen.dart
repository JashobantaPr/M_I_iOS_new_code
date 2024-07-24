import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/myBudget/mybudget_viewdetails/controller/mybudget_viewdetails_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class MyBudgetViewDetailsScreen
    extends GetWidget<MyBudgetViewDetailsController> {
  const MyBudgetViewDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: appTheme.rediconbackground));

    return ScreenUtilInit(
      builder: (context, _) {
        return Scaffold(
          appBar: _customAppBar(),
          body: Obx(() {
            if (controller.isLoading.value) {
              // Show a loading indicator or skeleton loader while data is loading
              return Center(
                child: CircularProgressIndicator(), // Example loading indicator
              );
            } else {
              // Show the actual content once data is loaded
              return Container(
                width: 385,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildAuditDetails(),
                      SizedBox(height: 10),
                      _buildBudgetHistory('Transaction Id', ':',
                          controller.details.first.transactionCode ?? ''),
                      _buildBudgetHistory('Transaction Date', ':',
                          controller.details.first.transactionDate ?? ''),
                      _buildBudgetHistory('From', ':',
                          '${controller.details.first.fromUserFirstname ?? ''} ${controller.details.first.fromUserLastname ?? ''}'),
                      _buildBudgetHistory(
                          'To', ':', controller.details.first.name ?? ''),
                      _buildBudgetHistory('Amount', ':',
                          controller.details.first.transactionPoints ?? ''),
                      _buildBudgetHistory(
                          'Description',
                          ':',
                          controller.details.first.transactionDescription ??
                              ''),
                      SizedBox(height: 35),
                      Divider(
                        color: appTheme.gray500,
                        thickness: 1.0,
                      ),
                      SizedBox(height: 15),
                      _buildButtons(),
                    ],
                  ),
                ),
              );
            }
          }),
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
        'Budget History',
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

  Widget _buildAuditDetails() {
    return Row(
      children: [
        Spacer(),
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.mybudgetauditdetails);
          },
          child: Text(
            'Audit Details',
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: appTheme.blue50,
            ),
          ),
        ),
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

  Widget _buildButtons() {
    return Column(
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(appTheme.redappbar),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(
                    color: Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  EdgeInsets.symmetric(horizontal: 38, vertical: 13),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1.0),
                  ),
                ),
              ),
              child: Text(
                'Ok',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
