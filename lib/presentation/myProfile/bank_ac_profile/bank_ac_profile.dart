import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myProfile/bank_ac_profile/controller/bank_ac_profile_controller..dart';
import 'package:incentivesgit/presentation/myProfile/bank_ac_profile/model/bank_acc_data_model.dart';
import 'package:incentivesgit/presentation/myProfile/view_document.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:get/get.dart';
import 'package:incentivesgit/widgets/customTextField.dart';
import 'package:incentivesgit/widgets/customdropdown1.dart';
import 'package:incentivesgit/widgets/dialoguebox.dart';

class BankAccountProfileScreen extends GetWidget<BankAccountProfileController> {
  const BankAccountProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Obx(() {
        return Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                controller.isUpdated.value
                    ? _bankProfiledetails(context)
                    : profileData(context),
                SizedBox(
                  height: 20.h,
                ),
                _submitbuttons(context)
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _bankProfiledetails(BuildContext context) {
    return Container(
      color: appTheme.white,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Bank Profile Details',
                style: TextStyle(
                  color: appTheme.cyan800,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              RichText(
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
                          '${controller.bankData.value.bankDetails?.approvalStatus}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          _toggleData(),
          SizedBox(
            height: 25.h,
          ),
          CustomTextField(
            labelText: 'Name of the Bank Account Holder',
            controller: controller.holderNamecontroller,
            hintText: '${controller.decryptedaccountholderName}',
          ),
          Obx(() {
            return controller.holderNamecontroller.text.isEmpty
                ? Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: Text(
                      controller.errors['userName'] ?? "",
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
            labelText: 'Bank Account Number',
            controller: controller.accountnumbercontroller,
            hintText: controller.decryptedAccountNumber.value,
          ),
          Obx(() {
            return controller.accountnumbercontroller.text.isEmpty
                ? Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: Text(
                      controller.errors['accountNumber'] ?? "",
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
          CustomDropdowncompulsory<String?>(
            labelText: 'Bank Name',
            items: controller.bankData.value.bankList
                    ?.map((bank) => bank.bankName)
                    .toList() ??
                [],
            value: null,
            hintText: controller.bankData.value.bankDetails?.bankName ??
                'Select Bank',
            onChanged: (value) {
              var index = controller.bankData.value.bankList
                  ?.indexWhere((bank) => bank.bankName == value);
              if (index != null && index >= 0) {
                controller.selectedBankIndex.value = index;
              }
            },
            getLabel: (value) {
              return '$value';
            },
          ),
          Obx(() {
            return controller.selectedBankIndex.value == null
                ? Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: Text(
                      controller.errors['accountNumber'] ?? "",
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
            labelText: 'IFSC Code',
            controller: controller.ifsccontroller,
            hintText: '${controller.decryptedIfscCode}',
          ),
          Obx(() {
            return controller.ifsccontroller.text.isEmpty
                ? Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: Text(
                      controller.errors['ifscCode'] ?? "",
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
          _toggleData1(),
          SizedBox(
            height: 20.h,
          ),
          SizedBox(
            width: 250,
            child: Text(
              'Upload Copy of the Cancelled Cheque OR Passbook(1st page) OR Bank Statement*',
              style: TextStyle(
                color: appTheme.greytextcolour,
                fontWeight: FontWeight.w500,
                fontSize: 12,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: appTheme.grey500,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Align items to the edges
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: controller.singlefilecontroller,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 5.0),
                      hintText: 'No file chosen',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return dialoguebox(context);
                        },
                      );
                    },
                    child: Container(
                      width: 100,
                      height: 48,
                      decoration: BoxDecoration(
                          color: const Color(0XFFE41C39),
                          borderRadius: BorderRadius.circular(4)),
                      child: const Center(
                        child: Text(
                          'Choose File',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            width: 250,
            child: Text(
              'Attachment should be of .pdf, .png, .jpg, .jpeg file formats Maxmimum size limit : 5MB',
              style: TextStyle(
                color: appTheme.greytextcolour,
                fontWeight: FontWeight.w500,
                fontSize: 9,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _toggleData() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bank Account Profile type',
          style: TextStyle(
            color: Colors.grey[900],
            fontWeight: FontWeight.w500,
            fontSize: 12,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
        const SizedBox(height: 7),
        Wrap(
          spacing: 20.0,
          children: List<Widget>.generate(
            controller.bankData.value.listProfileTypes?.length ?? 0,
            (index) {
              var profileType =
                  controller.bankData.value.listProfileTypes?[index];
              if (profileType == null) return const SizedBox.shrink();

              int radioValue = index + 1;

              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(
                    () => Radio<int>(
                      activeColor: appTheme.cyan800,
                      value: radioValue,
                      groupValue: controller.selectedProfileTypeIndex.value,
                      onChanged: (value) {
                        if (value != null) {
                          controller.selectedProfileTypeIndex.value = value;
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    profileType.profileTypeName ?? '',
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        Obx(() {
          return controller.selectedProfileTypeIndex.value == null
              ? Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: Text(
                    controller.errors['profileType'] ?? "",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: appTheme.redtext),
                  ))
              : const SizedBox();
        }),
      ],
    );
  }

  Widget _toggleData1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
            text: TextSpan(children: [
          TextSpan(
            text: 'Type of the Account',
            style: TextStyle(
              color: appTheme.greytextcolour,
              fontWeight: FontWeight.w500,
              fontSize: 12,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
          TextSpan(
            text: '*',
            style: TextStyle(
              color: appTheme.redappbar,
              fontWeight: FontWeight.w500,
              fontSize: 12,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          )
        ])),
        const SizedBox(height: 7),
        Wrap(
          spacing: 20.0,
          children: List<Widget>.generate(
            controller.bankData.value.listAccountTypes?.length ?? 0,
            (index) {
              var accountType =
                  controller.bankData.value.listAccountTypes?[index];
              if (accountType == null) return const SizedBox.shrink();

              int radioValue = index + 1;

              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(
                    () => Radio<int>(
                      activeColor: appTheme.cyan800,
                      value: radioValue,
                      groupValue: controller.selectedAccountTypeIndex.value,
                      onChanged: (value) {
                        if (value != null) {
                          controller.selectedAccountTypeIndex.value = value;
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    accountType.typeName ?? '',
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        Obx(() {
          return controller.selectedAccountTypeIndex.value == null
              ? Align(
                  alignment: AlignmentDirectional.bottomStart,
                  child: Text(
                    controller.errors['accountindex'] ?? "",
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: appTheme.redtext),
                  ))
              : const SizedBox();
        }),
      ],
    );
  }

  Widget dialoguebox(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      child: Container(
        height: 199,
        decoration: BoxDecoration(
          color: appTheme.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: appTheme.rediconbackground,
                toolbarHeight: 40,
                automaticallyImplyLeading: false,
                title: const Text(
                  'Select Image',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                actions: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 12, right: 12.5, bottom: 12),
                    child: GestureDetector(
                        onTap: () => Get.back(),
                        child: Icon(
                          color: appTheme.white,
                          Icons.close,
                          size: 18,
                        )),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 78.h,
              left: 50.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.chooseFile();
                          Get.back();
                        },
                        child: Image.asset(
                          'assetes/images/gallery.png',
                          width: 60.w,
                          height: 60.h,
                        ),
                      ),
                      Text(
                        'Gallery',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 14.sp,
                            color: appTheme.black600),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.chooseFileCamera();
                          Get.back();
                        },
                        child: Image.asset(
                          'assetes/images/camera.png',
                          width: 60.w,
                          height: 60.h,
                        ),
                      ),
                      Text(
                        'Camera',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 14.sp,
                            color: appTheme.black600),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
                            : 'Your Bank profile will move to unverified stage and you will not be able to redeem any reward. Are you sure you want to continue?',
                        onYesPressed: () async {
                          if (controller.isUpdated.value) {
                            if (controller.validateForm()) {
                              controller.bankConfirm();
                            } else {
                              //..
                            }
                          } else {
                            controller.bankUpdateStatus();
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
                child: Text(controller.isUpdated.value ? 'Submit' : 'Edit')),
          ],
        ),
        SizedBox(
          height: 20.h,
        )
      ],
    );
  }

  Widget profileData(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _textData(),
        SizedBox(
          height: 15.h,
        ),
        _profileType(),
        SizedBox(
          height: 10.h,
        ),
        _cardName(),
        SizedBox(
          height: 10.h,
        ),
        _cardnumber(),
        SizedBox(
          height: 10.h,
        ),
        _bankName(context),
        SizedBox(
          height: 10.h,
        ),
        _ifscCode(),
        SizedBox(
          height: 10.h,
        ),
        _accountType(),
        SizedBox(
          height: 10.h,
        ),
        _cardDocument(context),
        SizedBox(
          height: 10.h,
        ),
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
            'Bank Ac(${controller.bankData.value.countryIsoCode}) Details',
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
                  text: controller.bankData.value.bankDetails?.approvalStatus,
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

  Widget _profileType() {
    var profileId = controller.bankData.value.bankDetails?.profileTypeId;
    String profileTypeName = '';
    if (profileId != null) {
      var matchedProfileType = controller.bankData.value.listProfileTypes
          ?.firstWhere((profileType) => profileType.profileTypeId == profileId,
              orElse: () => ProfileType());

      if (matchedProfileType != null) {
        profileTypeName = matchedProfileType.profileTypeName ?? '';
      }
    }
    return Container(
        height: 60.h,
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: appTheme.grey500,
            width: 1.0,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bank Account Profile Type',
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
              profileTypeName,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: appTheme.black600),
            ),
          ],
        ));
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
                'Bank Account Number',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.greytextcolour),
              ),
              SizedBox(
                height: 2.h,
              ),
              Obx(() {
                return Text(
                  controller.decryptedAccountNumber.value,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: appTheme.black600),
                );
              })
            ],
          ),
          controller.bankData.value.approvalDetails
                      ?.bankAccountNumberApproved ==
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Name of the Bank Account Holder',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.greytextcolour),
              ),
              SizedBox(
                height: 2.h,
              ),
              Obx(() {
                return Text(
                  controller.decryptedaccountholderName.value,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: appTheme.black600),
                );
              })
            ],
          ),
          controller.bankData.value.approvalDetails
                      ?.accountHolderNameApproved ==
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

  Widget _bankName(BuildContext context) {
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
                'Bank Name',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.greytextcolour),
              ),
              SizedBox(
                height: 2.h,
              ),
              Obx(() {
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    controller.bankData.value.bankDetails?.bankName ?? "",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: appTheme.black600),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              })
            ],
          ),
          controller.bankData.value.approvalDetails
                      ?.accountHolderNameApproved ==
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

  Widget _ifscCode() {
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
                'IFSC Code',
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
                controller.decryptedIfscCode.value,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.black600),
              ),
            ],
          ),
          controller.bankData.value.approvalDetails
                      ?.bankAccountNumberApproved ==
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

  Widget _accountType() {
    var profileId = controller.bankData.value.bankDetails?.accountType;
    String accountTypeName = '';
    if (profileId != null) {
      var matchedaccountType = controller.bankData.value.listAccountTypes
          ?.firstWhere(
              (accountType) => accountType.accountTypeIdPk == profileId,
              orElse: () => AccountType());

      if (matchedaccountType != null) {
        accountTypeName = matchedaccountType.typeName ?? '';
      }
    }
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
                'Type of the Account',
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
                accountTypeName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.black600),
              ),
            ],
          ),
          controller.bankData.value.approvalDetails
                      ?.bankAccountNumberApproved ==
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

  Widget _cardDocument(BuildContext context) {
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Upload Copy of the Cancelled Cheque OR Passbook (1st page) OR Bank Statement',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.greytextcolour,
                  ),
                ),
                SizedBox(height: 2.h),
                GestureDetector(
                  onTap: () {
                    final imageUrl = controller
                            .bankData.value.bankDetails?.cancelledChequeImage ??
                        '';
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DocumentViewScreen(imageUrl: imageUrl),
                      ),
                    );
                  },
                  child: Text(
                    'View Document',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: appTheme.blue50,
                    ),
                  ),
                ),
              ],
            ),
          ),
          controller.bankData.value.approvalDetails
                      ?.bankAccountNumberApproved ==
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
}
