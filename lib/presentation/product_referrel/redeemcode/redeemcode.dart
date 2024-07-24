import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/model/gridItem.dart';
import 'package:incentivesgit/presentation/product_referrel/redeemcode/controller/redeemcode_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class RedeemcodeScreen extends GetWidget<RedeemCodeController> {
  const RedeemcodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RedeemCodeController());
    return ScreenUtilInit(
      child: Scaffold(
        backgroundColor: appTheme.background,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                dashboard(context),
                SizedBox(
                  height: 19.h,
                ),
                Text(
                  'My Claims',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.black600,
                  ),
                ),
                const SizedBox(height: 15),
                _basicInformationSection()
              ],
            ),
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.redeemcode);
          },
          child: Container(
            height: 57.h,
            width: double.maxFinite,
            decoration: BoxDecoration(color: appTheme.white, boxShadow: [
              BoxShadow(
                  color: appTheme.greytextcolour,
                  blurRadius: 2,
                  blurStyle: BlurStyle.outer,
                  offset: const Offset(2, 4))
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.add),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  'Redeem Code​​',
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: appTheme.black600),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget dashboard(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(), // Disable scrolling for inner ListView
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Claims Summary​',
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    color: const Color.fromRGBO(25, 25, 25, 1)),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            OptionCard(
              imagePath: ImageConstant.cornerdownright,
              points: 100,
              text: 'Total',
            ),
            OptionCard(
              imagePath: ImageConstant.pending,
              points: 30,
              text: 'Pending',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OptionCard(
              imagePath: ImageConstant.approved,
              points: 1,
              text: 'Approved',
            ),
            OptionCard(
              imagePath: ImageConstant.rejectedclaims,
              points: 10,
              text: 'Rejected​',
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            OptionCard(
              imagePath: ImageConstant.discarded,
              points: 9,
              text: 'Discarded​',
            ),
            OptionCard(
              imagePath: ImageConstant.earnedpoints,
              points: 10000,
              text: 'Earned​​ Points',
            ),
          ],
        ),
      ],
    );
  }

  Widget _basicInformationSection() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return IntrinsicHeight(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 10.h),
                decoration: BoxDecoration(
                  color: appTheme.white,
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _basicinformation('Claim Id', 'PID000077'),
                    _basicinformation('Referee Name', 'Dell Storm Trooper1'),
                    _basicinformation('Product Purchased', 'Tata Nexon'),
                    _basicinformation('Status', '29-03-2023'),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Positioned(
                top: 13,
                right: 10,
                child: PopupMenuButton<String>(
                  onSelected: (String value) {
                    if (value == 'viewDetails') {
                    } else if (value == 'approvalHistory') {}
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
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _basicinformation(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align the start of the row elements
        children: [
          SizedBox(
            width: 120.w,
            child: Text(
              label,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 12.sp,
                color: appTheme.black600,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const Text(':'),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.left,
              maxLines: 3, // Allow text to wrap into multiple lines
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 12.sp,
                color: appTheme.black600,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
