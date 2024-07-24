import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/help&support/scheduledupgrade/controller/scheduledupgrade_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class HelpandSupportScheduledUpgradeScreen
    extends GetWidget<HelpandSupportScheduledUpgradeController> {
  const HelpandSupportScheduledUpgradeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HelpandSupportScheduledUpgradeController controller =
        Get.put(HelpandSupportScheduledUpgradeController());

    return Container(
      color: const Color(0XFFE41C39),
      child: Scaffold(
        backgroundColor: appTheme.white,
        appBar: AppBar(
          backgroundColor: const Color(0XFFE41C39),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: SvgPicture.asset(
              ImageConstant.arrowback,
              width: 27.w,
              height: 18.h,
            ),
          ),
          title: Text(
            'Scheduled Upgrade',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 8),
            _buildHelpAndSupport(),
            const SizedBox(height: 13),
            _buildButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpAndSupport() {
    final HelpandSupportScheduledUpgradeController controller =
        Get.put(HelpandSupportScheduledUpgradeController());

    return Obx(() {
      String scheduledUpgradeText =
          controller.scheduledUpgrade.value?.scheduledUpgrade ?? 'Loading...';

      return Column(
        children: [
          SizedBox(height: 5),
          Text(
            scheduledUpgradeText,
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.normal,
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: appTheme.black600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      );
    });
  }

  Widget _buildButtons(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
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
                  EdgeInsets.symmetric(horizontal: 50),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
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
