import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/custom_snackbar.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzz_32/controller/buzz_32_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/custom_image_view.dart';

class Buzz32Screen extends GetWidget<Buzz32Controller> {
  Buzz32Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
        maintainBottomViewPadding: true,
        bottom: false,
        child: Scaffold(
          backgroundColor: Colors.grey, // appTheme.grey,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Text(
              "Chetana Shelar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
            backgroundColor: Colors.black,
            iconTheme: IconThemeData(color: Colors.white),
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: SvgPicture.asset(
                ImageConstant.arrowback,
                width: 26.75.w,
                height: 19.76.h,
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: 761,
                    color: Colors.black,
                  ),
                  Positioned(
                    top: 120,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                            child: CircleAvatar(
                              radius: 95,
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  AssetImage(ImageConstant.profilepic),
                            ),
                          ),
                          const SizedBox(height: 50),
                          _buildBasicDetails(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBasicDetails() {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.buzz33);
        },
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color:appTheme.rediconbackground,
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
          child: Text(
            "View Profile",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.normal,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
        ),
      ),
    );
  }
}
