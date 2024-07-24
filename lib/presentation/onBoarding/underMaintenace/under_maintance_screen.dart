import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/onBoarding/splash_screen/splash_screen.dart';
import 'controller/under_maintenance_controller.dart';

class UnderMaintenenceScreen extends GetWidget<UnderMaintenenceController> {
  const UnderMaintenenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: true,
        child: ScreenUtilInit(
          child: Obx(() {
            if (controller.isInMaintenance.value) {
              return Scaffold(
                body: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1)),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: 30.h, left: 16, right: 16, bottom: 10),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(61, 60, 60, 1),
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.elliptical(
                              MediaQuery.of(context).size.width,
                              200.0,
                            ),
                          ),
                        ),
                        child: Image.asset(
                          'assetes/images/Maintenance-mode.png',
                          fit: BoxFit.fill,
                          height: 362.h,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Text(
                        'MY INCENTIVES WILL BE\nBACK SOON',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            color: const Color.fromRGBO(228, 28, 58, 1)),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'We are upgrading My incentives with technology\nenhancements and features to increase the\nengagement at your workplace.we will return soon!\n\n\nYou may not be able to access My incentives Services\nduring the upgrade.We apologize for the\ninconvenience!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w300,
                            fontSize: 12.sp,
                            color: const Color.fromRGBO(0, 0, 0, 1)),
                      )
                    ],
                  ),
                ),
              );
            } else {
              return const SplashScreen();
            }
          }),
        ));
  }
}
