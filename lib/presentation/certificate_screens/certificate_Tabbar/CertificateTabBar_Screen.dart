import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/certificate_screens/My%20achievement/myAchievement_Screen.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_10/certificate_10_screen.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_Tabbar/controller/buzzeTabBar_Controller.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_Tabbar/drawer_screen.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_leaderboard/CertificateLeader_Screen.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import '../get_all_certificate_screen/get_all_certificate_screen.dart';

class CertificatetabBarScreens extends StatelessWidget {
  final List<String> titles = [
    "Posts",
    "My Achievement",
    "Trending Certificate"
  ];

  CertificatetabBarScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CertificateTabBarController>(
      builder: (controller) {
        return DefaultTabController(
          initialIndex: 0,
          length: titles.length,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: appTheme.redappbar,
              automaticallyImplyLeading: false, // Add this line
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
                        'Scope: ${controller.selectedScopeName.value}',
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
              bottom: TabBar(
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
                GetAllCertificateScreen(),
                MyAchievementScreen(),
                CertificateTabbarLeaderBoardScreen()
              ],
            ),
          ),
        );
      },
    );
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
                borderRadius:
                    const BorderRadius.only(topLeft: Radius.circular(10.0)),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.9,
                  color: Colors.white,
                  child: CertificateDialougeScreen(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
