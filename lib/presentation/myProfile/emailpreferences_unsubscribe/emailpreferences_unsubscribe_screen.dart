import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/myProfile/emailpreferences_unsubscribe/controller/emailpreferences_unsubscribe_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/dialoguebox.dart';

class EmailPreferencesUnsubscribeScreen
    extends GetWidget<EmailPreferencesUnsubscribeController> {
  const EmailPreferencesUnsubscribeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final EmailPreferencesUnsubscribeController controller =
        Get.put(EmailPreferencesUnsubscribeController());

    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: appTheme.rediconbackground));

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, _) {
        return Scaffold(
          appBar: _customAppBar(),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildAccount(),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(
                    color: appTheme.gray500,
                    thickness: 1.0,
                  ),
                ),
                const SizedBox(height: 10),
                _buildButtons(context),
              ],
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
        'Unsubscribe',
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

  Widget _buildAccount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 2),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(1.0),
          child: Text(
            'Account Activation Reminder Email',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14.0,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.bold,
              color: appTheme.black600,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            _buildRadioList(),
          ],
        ),
      ],
    );
  }

  Widget _buildRadioList() {
    List<String> radioValues = [
      '10 days',
      '20 days',
      '30 days',
      '90 days',
      'Permanently'
    ];

    return GetBuilder<EmailPreferencesUnsubscribeController>(
      builder: (controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: radioValues.map((value) {
            return Row(
              children: [
                Radio<String>(
                  value: value,
                  groupValue: controller.selectedValue,
                  onChanged: (newValue) {
                    controller.updateSelectedValue(newValue!);
                  },
                  activeColor: Colors.lightBlue,
                ),
                const SizedBox(width: 4),
                Text(
                  value,
                  style: TextStyle(
                    color: appTheme.black600,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
                const SizedBox(height: 38),
              ],
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(Size(98, 48)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: BorderSide(color: appTheme.grey500)),
                ),
              ),
              child: Text(
                'Cancel',
                style: TextStyle(
                  color: appTheme.greydownarrow,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(width: 20),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialog(
                        title: 'Success',
                        message:
                            'Your null has been unsubscribed successfully.',
                        onYesPressed: () {
                          controller.unSubscribe();
                        });
                  },
                );
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
                fixedSize: const MaterialStatePropertyAll(Size(98, 48)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: BorderSide(color: appTheme.grey500)),
                ),
              ),
              child: const Text('Save'),
            ),
          ],
        ),
      ],
    );
  }
}
