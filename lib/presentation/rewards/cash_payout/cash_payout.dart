import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/campaign_calculatedpoints_programId/model/dropdown.dart';
import 'package:incentivesgit/presentation/rewards/cash_payout/controller/cash_payout_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class CashPayoutScreen extends GetWidget<CashPayoutController> {
  const CashPayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        backgroundColor: appTheme.background,
        appBar: _customAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 14.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _bankData(),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Delivery Details',
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 12.sp,
                      color: appTheme.black600,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 13.h,
                ),
                _pointsconvert(),
                SizedBox(
                  height: 20.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          backgroundColor: MaterialStatePropertyAll(
                              appTheme.rediconbackground),
                          fixedSize:
                              const MaterialStatePropertyAll(Size(138, 38))),
                      onPressed: () {},
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: appTheme.white,
                        ),
                      )),
                ),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _customAppBar() {
    return AppBar(
      title: Text(
        "View Details",
        style: TextStyle(
          color: appTheme.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
      ),
      backgroundColor: appTheme.rediconbackground,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: SvgPicture.asset(
          ImageConstant.arrowback,
          width: 26.75.w,
          height: 19.76.h,
        ),
      ),
    );
  }

  Widget _bankData() {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: appTheme.white, borderRadius: BorderRadius.circular(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 19.h,
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 124.w,
              height: 64.h,
              child: SvgPicture.asset(
                ImageConstant.rewards,
                width: 132,
                height: 87,
                color: appTheme.redappbar,
              ),
            ),
          ),
          SizedBox(
            height: 27.h,
          ),
          Text(
            'Cash Payout',
            style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: appTheme.black600),
          ),
          SizedBox(
            height: 7.h,
          ),
          _buildDataRow('Reward Code', 'GV843'),
          SizedBox(
            height: 22.h,
          ),
          Text(
            'Select Wallet',
            style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 12.sp,
                color: appTheme.black600,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8.h,
          ),
          CustomDropdown<String?>(
            items: const ['Common Wallet'],
            value: null,
            onChanged: (value) {},
            getLabel: (String? value) {
              return '$value';
            },
            hintText: 'All',
          ),
          SizedBox(
            height: 7.h,
          ),
          Text(
            'Wallet Point: 1,000',
            style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: appTheme.greytextcolour,
                fontStyle: FontStyle.italic),
          ),
          SizedBox(
            height: 16.h,
          ),
          Text(
            'Description',
            style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 12.sp,
                color: appTheme.black600,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.h,
          ),
          Divider(
            color: appTheme.greydivider,
            indent: BorderSide.strokeAlignCenter,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Cash Payout',
            style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: appTheme.black600),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'Electronic registration. Eligible persons who have a local Hong Kong dollar savings or current bank account in their sole name with any of the participating retail banks',
            style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: appTheme.black600),
          ),
        ],
      ),
    );
  }

  Widget _buildDataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              width: 165.w,
              child: Text(
                label,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 12.sp,
                    color: appTheme.black600,
                    fontWeight: FontWeight.normal),
              )),
          const Text(':'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 19),
              child: Text(
                value,
                maxLines: 3,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 12.sp,
                    color: appTheme.black600,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _pointsconvert() {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: appTheme.white, borderRadius: BorderRadius.circular(4)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Enter the points to be converted in cash transfer:',
            style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 12.sp,
                color: appTheme.black600,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8.h,
          ),
          SizedBox(
            height: 48,
            width: double.maxFinite,
            child: TextField(
              cursorColor: appTheme.black600,
              keyboardType: TextInputType.number,
              maxLines: 1,
              controller: controller.numberController,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: appTheme.grey500)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: appTheme.grey500))),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Select the mode transfer',
            style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 12.sp,
                color: appTheme.black600,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Obx(() => Radio<String>(
                        value: 'Bank Account (IN)',
                        groupValue: controller.selectedProfileType.value,
                        onChanged: (value) {
                          controller.updateProfileType(value!);
                        },
                      )),
                  const SizedBox(width: 4),
                  Text(
                    'Bank Account (IN)',
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              Obx(() {
                if (controller.showError.value) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Bank account status:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12.sp,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: Colors
                                          .black, // Replace with appTheme.black600
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' Not Submitted',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12.sp,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: Colors
                                          .red, // Replace with appTheme.redtext
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '(To update or view, ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12.sp,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: Colors
                                          .black, // Replace with appTheme.black600
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Click here)',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12.sp,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: Colors
                                          .blue, // Replace with appTheme.blue50
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'You need to update and get your NEFT Account details verified to use this mode transfer.',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 12.sp,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            color:
                                Colors.black, // Replace with appTheme.black600
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container(); // Empty container if no error
                }
              }),
            ],
          ),
          Row(
            children: [
              Obx(() => Radio<String>(
                    value: 'UPI Account (IN) ',
                    groupValue: controller.selectedProfileType.value,
                    onChanged: (value) {
                      controller.updateProfileType(value!);
                    },
                  )),
              const SizedBox(width: 4),
              Text(
                'UPI Account (IN)',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.black,
                ),
              )
            ],
          ),
          Row(
            children: [
              Obx(() => Radio<String>(
                    value: ' PayTM Account (IN)',
                    groupValue: controller.selectedProfileType.value,
                    onChanged: (value) {
                      controller.updateProfileType(value!);
                    },
                  )),
              const SizedBox(width: 4),
              Text(
                ' PayTM Account (IN)',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.black,
                ),
              )
            ],
          ),
          Row(
            children: [
              Obx(() => Radio<String>(
                    value: 'Salary Credit (IN)',
                    groupValue: controller.selectedProfileType.value,
                    onChanged: (value) {
                      controller.updateProfileType(value!);
                    },
                  )),
              const SizedBox(width: 4),
              Text(
                'Salary Credit (IN)',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.black,
                ),
              )
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'Mobile Number Linked To Paytm',
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 10.sp,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: appTheme.black600),
          ),
          SizedBox(
            height: 8.h,
          ),
          SizedBox(
            height: 48,
            width: double.infinity,
            child: Obx(
              () => TextField(
                cursorColor: Colors.black54,
                keyboardType: TextInputType.number,
                maxLines: 1,
                maxLength: 10,
                onChanged: (value) {
                  value.length == 10
                      ? controller.isValid.value == true
                      : controller.isValid.value == true;
                },
                controller: controller.mobilenumberController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: appTheme.grey500),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: appTheme.grey500),
                  ),
                  suffixIcon: controller.isValid.value
                      ? const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        )
                      : null,
                  counterText: "",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
