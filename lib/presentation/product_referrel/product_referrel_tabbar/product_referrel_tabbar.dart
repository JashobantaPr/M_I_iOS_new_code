import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/product_referrel/campaign_summary/campaign_summary.dart';
import 'package:incentivesgit/presentation/product_referrel/redeemcode/redeemcode.dart';
import 'package:incentivesgit/presentation/product_referrel/refer_and_earn/refer_and_earn.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class ProductReferrelTabbarScreen extends StatelessWidget {
  const ProductReferrelTabbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      "Campaign Summary",
      "Refer & Earn",
      "Redeem Code",
      "All Referrals"
    ];

    return ScreenUtilInit(
      child: DefaultTabController(
        length: titles.length,
        child: Builder(
          builder: (BuildContext context) {
            final TabController tabController =
                DefaultTabController.of(context);

            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: appTheme.redappbar,
                leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      ImageConstant.arrowback,
                      width: 27.w,
                      height: 18.h,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                title: Text(
                  'Campaign Details',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                scrolledUnderElevation: 4.0,
                shadowColor: Theme.of(context).shadowColor,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(kToolbarHeight),
                  child: TabBar(
                    controller: tabController,
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 3,
                    unselectedLabelColor: appTheme.white.withOpacity(0.5),
                    tabs: titles.map((title) {
                      return Tab(
                        child: AnimatedBuilder(
                          animation: tabController.animation!,
                          builder: (context, child) {
                            final isSelected =
                                tabController.index == titles.indexOf(title);
                            return Text(
                              title,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1, // Ensure text doesn't overflow
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: GoogleFonts.roboto().fontFamily,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                                    .withOpacity(isSelected ? 1.0 : 0.5),
                              ),
                            );
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              body: const TabBarView(
                physics: AlwaysScrollableScrollPhysics(),
                children: <Widget>[
                  CampaignSummaryScreen(),
                  ReferAndEarnScreen(),
                  RedeemcodeScreen(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
