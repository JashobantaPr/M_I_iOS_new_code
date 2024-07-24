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
import 'package:incentivesgit/presentation/myBudget/auditdetails/controller/auditdetails_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class AuditDetailsScreen
    extends GetWidget<AuditDetailsController> {
  const AuditDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: appTheme.redappbar));

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) {
        return Scaffold(
          appBar: _customAppBar(),
          body: Container(
            width: 385,
            color: appTheme.grey500,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      height: 140,
                      decoration:const  BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(3))),
                      child: Column(
                        children: [
                          _buildBudgetHistory('Date', ':', '6-04-2020'),
                          const SizedBox(height: 2),
                          _buildBudgetHistory('Comments', ':',
                              'Recognition for Going Extra Mile'),
                          const SizedBox(height: 2),
                          _buildBudgetHistory(
                              'Edited By', ':', 'Chetana Shelar'),
                          const SizedBox(height: 2),
                          _buildBudgetHistory('Original value', ':', '300'),
                          const SizedBox(height: 2),
                          _buildBudgetHistory('Changed value', ':', ' N/A'),
                        ],
                      )),
                  const SizedBox(height: 10),
                  Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      height: 140,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                      ),
                      child: Column(
                        children: [
                          _buildBudgetHistory('Date', ':', '6-04-2020'),
                          const SizedBox(height: 2),
                          _buildBudgetHistory('Comments', ':',
                              'Recognition for const Going Extra Mile'),
                          const SizedBox(height: 2),
                          _buildBudgetHistory(
                              'Edited By', ':', 'Chetana Shelar'),
                          const SizedBox(height: 2),
                          _buildBudgetHistory('Original value', ':', '300'),
                          const SizedBox(height: 2),
                          _buildBudgetHistory('Changed value', ':', ' N/A'),
                        ],
                      )),
                 
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

  Widget _buildBudgetHistory(String label1, String separator, String label2) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
                  color: appTheme.black600,
                ),
              ),
            ),
            // const SizedBox(width: 5.0),
            Text(
              separator,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Text(
                label2,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: appTheme.black600,
                ),
              ),
            ),
          ],
        ),
        // SizedBox(height: 2),
      ],
    );
  }
}
