import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myProfile/upi_profile/controller/upi_profile_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/customTextField.dart';
import 'package:incentivesgit/widgets/dialoguebox.dart';

class UpiProfileScreen extends GetWidget<UpiProfileController> {
  const UpiProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ScreenUtilInit(
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10.h),
              child: Column(
                children: [
                  controller.isUpdated.value
                      ? _profileData()
                      : profile(context),
                  SizedBox(
                    height: 20.h,
                  ),
                  _submitbuttons(context)
                ],
              )),
        ),
      );
    });
  }

  Widget profile(BuildContext context) {
    return Obx(
      () => Column(
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
          _bankName(),
        ],
      ),
    );
  }

  Widget _textData() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'UPI Profile(IN) Details',
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
                    text: controller
                            .upiDetails.value.upiDetails?.approvalStatus ??
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
    });
  }

  Widget _cardnumber() {
    return Container(
      height: 60.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: appTheme.grey500,
          width: 1.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          controller.upiDetails.value.approvalDetails?.upiApprovalId == '1'
              ? Container(
                  height: double.maxFinite,
                  width: 3,
                  color: appTheme.green,
                )
              : const SizedBox.shrink(),
          SizedBox(
            width: 20.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'UPI Id',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.greytextcolour,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  controller.decryptedupiId.value,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.black600,
                  ),
                  overflow: TextOverflow.ellipsis, // Adjust overflow handling
                ),
              ],
            ),
          ),
          controller.upiDetails.value.approvalDetails?.upiApprovalId == '1'
              ? Padding(
                  padding: const EdgeInsets.only(right: 17),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.check_circle_outline_rounded,
                        color: Colors.green,
                        size: 20,
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        'Approved',
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: Colors.green,
                          fontStyle: FontStyle.italic,
                        ),
                      )
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(right: 17),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.cancel_outlined,
                        color: Colors.red,
                        size: 20,
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        'Rejected',
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: Colors.red,
                          fontStyle: FontStyle.italic,
                        ),
                      )
                    ],
                  ),
                )
        ],
      ),
    );
  }

  Widget _cardName() {
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          controller.upiDetails.value.approvalDetails?.upiFirstnameApproved ==
                  '1'
              ? Container(
                  height: double.maxFinite,
                  width: 3,
                  color: appTheme.green,
                )
              : const SizedBox.shrink(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'First Name (as register in UPI/Bank AC)',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.greytextcolour,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  controller.decryptedFirstName.value,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.black600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          controller.upiDetails.value.approvalDetails?.upiFirstnameApproved ==
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
                    SizedBox(height: 2.h),
                    Text(
                      'Approved',
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: Colors.green,
                        fontStyle: FontStyle.italic,
                      ),
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
                    SizedBox(height: 2.h),
                    Text(
                      'Rejected',
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: Colors.red,
                        fontStyle: FontStyle.italic,
                      ),
                    )
                  ],
                )
        ],
      ),
    );
  }

  Widget _bankName() {
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
          controller.upiDetails.value.approvalDetails?.upiFirstnameApproved ==
                  '1'
              ? Container(
                  height: double.maxFinite,
                  width: 3,
                  color: appTheme.green,
                )
              : const SizedBox.shrink(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Last Name (as register in UPI/Bank AC)',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.greytextcolour,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  controller.decryptedLastName.value,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.black600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          controller.upiDetails.value.approvalDetails?.upiLastnameApproved ==
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
                    SizedBox(height: 2.h),
                    Text(
                      'Approved',
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: Colors.green,
                        fontStyle: FontStyle.italic,
                      ),
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
                    SizedBox(height: 2.h),
                    Text(
                      'Rejected',
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                        color: Colors.red,
                        fontStyle: FontStyle.italic,
                      ),
                    )
                  ],
                )
        ],
      ),
    );
  }

  Widget _profileData() {
    return Container(
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
                  'UPI Profile(IN) Details',
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
                            ' ${controller.upiDetails.value.upiDetails?.approvalStatus}',
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
              labelText: 'UPI Id',
              controller: controller.upiIdcontroller,
              hintText: controller.decryptedupiId.value),
          Obx(() {
            return controller.upiIdcontroller.text.isEmpty
                ? Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: Text(
                      controller.errors['upiId'] ?? "",
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
              labelText: 'First Name (as register in UPI/Bank AC)',
              controller: controller.firstnamecontroller,
              hintText: controller.decryptedFirstName.value),
          Obx(() {
            return controller.firstnamecontroller.text.isEmpty
                ? Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: Text(
                      controller.errors['firstName'] ?? "",
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
              labelText: 'Last Name (as register in UPI/Bank AC)',
              controller: controller.lastnamecontroller,
              hintText: controller.decryptedLastName.value),
          Obx(() {
            return controller.lastnamecontroller.text.isEmpty
                ? Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: Text(
                      controller.errors['lastName'] ?? "",
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
            '-Please enter your own UPI Id',
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
            '-Please enter first name and last name as register with your UPI/Bank A/C. In case of name mismatch, the UPI profile will be rejected.',
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
            '-Please note that the UPI verification will happen with the bank account linked with entered UPI Id.',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                fontStyle: FontStyle.italic,
                fontSize: 12.sp,
                color: appTheme.black600),
          ),
        ],
      ),
    );
  }

  Widget _submitbuttons(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
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
              child: Text(
                'Cancel',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14.sp,
                    color: appTheme.greydownarrow),
              ),
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
                          : 'Your PAN profile will move to unverified stage and you will not be able to redeem any reward. Are you sure you want to continue?',
                      onYesPressed: () async {
                        if (controller.isUpdated.value) {
                          if (controller.validateForm()) {
                            controller.panConfirm();
                          } else {
                            //..
                          }
                        } else {
                          controller.upiUpdateStatus(controller.upiDetails.value
                                  .upiDetails?.approvalStatusId ??
                              '');
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
