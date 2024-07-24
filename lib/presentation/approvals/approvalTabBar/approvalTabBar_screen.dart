import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/Approvals/Approval_MyApproval/myapproval_screen.dart';
import 'package:incentivesgit/presentation/Approvals/Approval_MyRequest/myrequest_screen.dart';

import 'package:incentivesgit/theme/theme_helper.dart';

class MyApprovalTabBarScreens extends StatelessWidget {
  final List<String> titles = [
    "My Approvals",
    "My Request",
  ];

  MyApprovalTabBarScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: titles.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: appTheme.redappbar,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              IconButton(
                onPressed: () => Get.back(),
                icon: SvgPicture.asset(
                  ImageConstant.arrowback,
                  width: 26.75.w,
                  height: 19.76.h,
                ),
              ),
              Text(
                'Approvals',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3,
            tabs: titles.map((title) {
              return Tab(
                child: Text(
                  title,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            MyApprovalScreen(),
            MyRequestScreen(),
          ],
        ),
      ),
    );
  }
}
