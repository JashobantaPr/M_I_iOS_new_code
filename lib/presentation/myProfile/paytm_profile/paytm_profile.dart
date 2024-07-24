import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myProfile/paytm_profile/controller/paytm_profile_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/customTextField.dart';
import 'package:incentivesgit/widgets/dialoguebox.dart';

class PaytmProfileScreen extends GetWidget<PaytmProfileController> {
  const PaytmProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(child: Obx(() {
      return SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.h,
            ),
            child: Column(
              children: [
                controller.isUpdated.value ? _profileData() : profile(context),
                SizedBox(
                  height: 20.h,
                ),
                _submitbuttons(context)
              ],
            )),
      );
    }));
  }

  Widget profile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _textData(),
        SizedBox(
          height: 15.h,
        ),
        _cardnumber(),
        SizedBox(
          height: 10.h,
        ),
        _cardName(),
        SizedBox(
          height: 10.h,
        ),
        _lastName(),
      ],
    );
  }

  Widget _textData() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Bank Ac(IN) Details',
            style: TextStyle(
              color: appTheme.cyan800,
              fontWeight: FontWeight.bold,
              fontSize: 12,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'Status: ',
              style: TextStyle(
                color: appTheme.cyan800,
                fontWeight: FontWeight.normal,
                fontSize: 12,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
              children: [
                TextSpan(
                  text:
                      controller.paytmData.value.paytmDetails?.approvalStatus ??
                          '',
                  style: TextStyle(
                    color: appTheme.cyan800,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardnumber() {
    return Container(
      height: 60.h,
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: appTheme.grey500,
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Mobile Number linked to Paytm wallet',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.greytextcolour),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                '${controller.decryptedMobileNumber}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.black600),
              ),
            ],
          ),
          controller.paytmData.value.approvalDetails?.approvalStatusId == '1'
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.check_circle_outline_rounded,
                      color: Colors.green,
                      size: 20,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      'Approved',
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: Colors.green,
                          fontStyle: FontStyle.italic),
                    )
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.cancel_outlined,
                      color: Colors.red,
                      size: 20,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      'Rejected',
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: Colors.red,
                          fontStyle: FontStyle.italic),
                    )
                  ],
                )
        ],
      ),
    );
  }

  Widget _cardName() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: appTheme.grey500,
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'First Name (As register in Paytm)',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.greytextcolour),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                '${controller.decryptedFirstName}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.black600),
              ),
            ],
          ),
          controller.paytmData.value.approvalDetails?.paytmFirstnameApproved ==
                  '1'
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.check_circle_outline_rounded,
                      color: Colors.green,
                      size: 20,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      'Approved',
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: Colors.green,
                          fontStyle: FontStyle.italic),
                    )
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.cancel_outlined,
                      color: Colors.red,
                      size: 20,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      'Rejected',
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: Colors.red,
                          fontStyle: FontStyle.italic),
                    )
                  ],
                )
        ],
      ),
    );
  }

  Widget _lastName() {
    return Container(
      height: 60.h,
      padding: EdgeInsets.symmetric(horizontal: 17.w),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: appTheme.grey500,
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Last Name (As register in Paytm)',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.greytextcolour),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                '${controller.decryptedLastName}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.black600),
              ),
            ],
          ),
          controller.paytmData.value.approvalDetails?.paytmLastnameApproved ==
                  '1'
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.check_circle_outline_rounded,
                      color: Colors.green,
                      size: 20,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      'Approved',
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: Colors.green,
                          fontStyle: FontStyle.italic),
                    )
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.cancel_outlined,
                      color: Colors.red,
                      size: 20,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text(
                      'Rejected',
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: Colors.red,
                          fontStyle: FontStyle.italic),
                    )
                  ],
                )
        ],
      ),
    );
  }

  Widget _profileData() {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: appTheme.grey500,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 124.w,
                  child: Text(
                    'Paytm Profile(IN) Details',
                    style: TextStyle(
                      color: appTheme.cyan800,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: RichText(
                    textAlign: TextAlign.end,
                    text: TextSpan(
                      text: 'Status: ',
                      style: TextStyle(
                        color: appTheme.cyan800,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      children: [
                        TextSpan(
                          text:
                              ' ${controller.paytmData.value.paytmDetails?.approvalStatus}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomTextField(
                labelText: 'Mobile Number linked to Paytm wallet',
                controller: controller.mobilenumbercontroller,
                hintText: '${controller.decryptedMobileNumber}'),
            Obx(() {
              return controller.mobilenumbercontroller.text.isEmpty
                  ? Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: Text(
                        controller.errors['mobilenumber'] ?? "",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            color: appTheme.redtext),
                      ))
                  : const SizedBox();
            }),
            SizedBox(
              height: 20.h,
            ),
            CustomTextField(
                labelText: 'First Name (As register in Paytm)',
                controller: controller.firstnamecontroller,
                hintText: '${controller.decryptedFirstName}'),
            Obx(() {
              return controller.firstnamecontroller.text.isEmpty
                  ? Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: Text(
                        controller.errors['userFirstName'] ?? "",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            color: appTheme.redtext),
                      ))
                  : const SizedBox();
            }),
            SizedBox(
              height: 20.h,
            ),
            CustomTextField(
                labelText: 'Last Name (As register in Paytm)',
                controller: controller.lastnamecontroller,
                hintText: '${controller.decryptedLastName}'),
            Obx(() {
              return controller.lastnamecontroller.text.isEmpty
                  ? Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: Text(
                        controller.errors['userLastName'] ?? "",
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            color: appTheme.redtext),
                      ))
                  : const SizedBox();
            }),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 14.h,
            ),
            Text(
              'Note:',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.italic,
                  fontSize: 12.sp,
                  color: appTheme.black600),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              '-Please enter the mobile number linked to your own mobile wallet',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.italic,
                  fontSize: 12.sp,
                  color: appTheme.black600),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              '-Please enter first name and last name as register with your Paytm AC. In case of name mismatch, the Paytm profile will be rejected.',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  fontStyle: FontStyle.italic,
                  fontSize: 12.sp,
                  color: appTheme.black600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _submitbuttons(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(appTheme.white),
                foregroundColor:
                    MaterialStateProperty.all<Color>(appTheme.black600),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(
                    color: appTheme.greydownarrow,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: BorderSide(color: appTheme.grey500)),
                ),
              ),
              child: const Text('Cancel'),
            ),
            const SizedBox(width: 20),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialog(
                      title: 'Confirmation',
                      message: controller.isUpdated.value
                          ? 'Please ensure that the provided details are correct. Once submitted, they cannot be changed. Do you want to continue?'
                          : 'Your PAYTM profile will move to unverified stage and you will not be able to redeem any reward. Are you sure you want to continue?',
                      onYesPressed: () async {
                        if (controller.isUpdated.value) {
                          if (controller.validateForm()) {
                            controller.paytmConfirm();
                          } else {
                            //..
                          }
                        } else {
                          controller.paytmUpdateStatus();
                          Get.back();
                        }
                      },
                    );
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
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
              child: Text(controller.isUpdated.value ? 'Submit' : 'Edit'),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        )
      ],
    );
  }
}
