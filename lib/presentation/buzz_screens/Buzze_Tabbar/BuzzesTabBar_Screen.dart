import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/buzz_screens/Buzz_summary/buzzSummary_Screen.dart';
import 'package:incentivesgit/presentation/buzz_screens/Buzze_Tabbar/controller/buzzeTabBar_Controller.dart';
import 'package:incentivesgit/presentation/buzz_screens/Buzze_Tabbar/drawer_screen.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzzes_tabbar_leaderboard/leaderboard_screen.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzzes_tabbar_post/buzzes_tabbar_post.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class BuzzestabBarScreens extends StatelessWidget {
  final List<String> titles = ["Posts", "Buzzzes Summary", "Leaderboard"];

  BuzzestabBarScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final BuzzesTabBarController buzzcontroller =
        Get.put<BuzzesTabBarController>(BuzzesTabBarController());

    return GetBuilder<BuzzesTabBarController>(
      builder: (controller) {
        return DefaultTabController(
          initialIndex: 0,
          length: titles.length,
          child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: appTheme.redappbar,
              title: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: SvgPicture.asset(
                        ImageConstant.arrowback,
                        width: 27.w,
                        height: 18.h,
                      ),
                    ),
                  ),
                  Text(
                    '${controller.title}',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: GoogleFonts.roboto().fontFamily,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Obx(() => Text(
                        'Scope: ${buzzcontroller.selectedScopeName.value}',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: GoogleFonts.roboto().fontFamily,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      )),
                  IconButton(
                    icon: const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: () {
                      _showTopRightModalSheet(context);
                    },
                  ),
                ],
              ),
              notificationPredicate: (ScrollNotification notification) {
                return notification.depth == 1;
              },
              scrolledUnderElevation: 4.0,
              shadowColor: Theme.of(context).shadowColor,
              bottom: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3,
                unselectedLabelColor: appTheme.white.withOpacity(0.5),
                tabs: titles.map((title) {
                  return Tab(
                    child: Text(
                      title,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: GoogleFonts.poppins().fontFamily,
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
                BuzzesTabbarPostScreen(),
                BuzzSummaryScreen(),
                BuzzesTabbarLeaderBoardScreen(),
              ],
            ),
          ),
        );
      },
    );
  }
}

void _showTopRightModalSheet(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black.withOpacity(0.5),
    transitionDuration: const Duration(milliseconds: 600),
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.only(top: 80, right: 5),
          child: Material(
            type: MaterialType.transparency,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.9,
                color: Colors.white,
                child: DialougeScreen(), // Replace this line
              ),
            ),
          ),
        ),
      );
    },
  );
}
