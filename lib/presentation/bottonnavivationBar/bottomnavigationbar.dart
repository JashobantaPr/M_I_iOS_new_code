import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/presentation/bottonnavivationBar/controller/bottomnavigationbarcontroller.dart';

class BottomNavScreen extends GetWidget<BottomNavigationBarController> {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBarController controller =
        Get.put(BottomNavigationBarController());

    controller.terminlogytext();

    bool doubleBackPressed = false;

    return WillPopScope(
      onWillPop: () async {
        if (doubleBackPressed) {
          // If back button pressed twice, exit the app
          SystemNavigator.pop();
          return true;
        }

        // Show the custom dialog
        showDialog(
          context: context,
          barrierDismissible: false, // Prevent dismissing by tapping outside
          builder: (BuildContext context) {
            // Close the dialog automatically after 2 seconds
            Future.delayed(const Duration(seconds: 1), () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
                // Reset the flag when the dialog is dismissed
                doubleBackPressed = false;
              }
            });

            return Padding(
              padding: const EdgeInsets.only(top: 630),
              child: AlertDialog(
                backgroundColor: Colors.black.withOpacity(0.8),
                content: const SizedBox(
                  height: 15,
                  width: 500,
                  child: Center(
                    child: Text(
                      'Press back again to exit app.',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );

        // Set the flag to true indicating that back button has been pressed once
        doubleBackPressed = true;

        // Don't exit immediately, wait for user's interaction
        return false;
      },
      child: Scaffold(
        body: ScreenUtilInit(
          child: Scaffold(
            body: Obx(() => controller.pages[controller.selectedIndex.value]),
            bottomNavigationBar: Obx(() {
              return BottomNavigationBar(
                currentIndex: controller.selectedIndex.value,
                onTap: controller.changePage,
                selectedItemColor: const Color.fromRGBO(228, 28, 57, 1),
                unselectedItemColor: const Color.fromRGBO(109, 109, 109, 1),
                selectedFontSize: 8.sp,
                unselectedFontSize: 8.sp,
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(228, 28, 57, 1),
                ),
                unselectedLabelStyle: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(109, 109, 109, 1),
                ),
                showUnselectedLabels: true,
                items: controller.bottomMenuList.map((menuItem) {
                  bool isSelected = menuItem.isSelected;
                  return BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      isSelected ? menuItem.activeIcon : menuItem.icon,
                      width: 21.97.w,
                      height: 22.57.h,
                      color: isSelected
                          ? const Color.fromRGBO(228, 28, 57, 1)
                          : const Color.fromRGBO(109, 109, 109, 1),
                    ),
                    label: menuItem.title.value,
                  );
                }).toList(),
              );
            }),
          ),
        ),
      ),
    );
  }
}

enum BottomBarEnum {
  campaign,
  engagement,
  reward,
  account,
}
