import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/product_referrel/redeemcode1/controller/redeemcode1_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/customTextField.dart';
import 'package:incentivesgit/widgets/customdropdown1.dart';
import 'package:incentivesgit/widgets/dialoguebox.dart';
import 'package:incentivesgit/widgets/imagedialogbox.dart';
import 'package:intl/intl.dart';

class Redeemcode1Screen extends GetWidget<Redeemcode1Controller> {
  const Redeemcode1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        appBar: _customAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomDropdowncompulsory<String?>(
                  hintText: 'Select',
                  items: [''],
                  value: null,
                  onChanged: (value) {},
                  getLabel: (String? value) {
                    return '$value';
                  },
                  labelText: '#BU n-1',
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomDropdowncompulsory<String?>(
                  hintText: 'Select',
                  items: [''],
                  value: null,
                  onChanged: (value) {},
                  getLabel: (String? value) {
                    return '$value';
                  },
                  labelText: '#BU n',
                ),
                SizedBox(
                  height: 30.h,
                ),
                CustomDropdowncompulsory<String?>(
                  hintText: 'Select',
                  items: [''],
                  value: null,
                  onChanged: (value) {},
                  getLabel: (String? value) {
                    return '$value';
                  },
                  labelText: 'Select Purchased Product ',
                ),
                SizedBox(
                  height: 10.h,
                ),
                _buildLabelWithStar(),
                SizedBox(
                  height: 10.h,
                ),
                _buildTextFieldWithCalendar(),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextField(
                    labelText: 'Invoice Id',
                    controller: controller.invoiceidcontroller,
                    hintText: 'Enter'),
                SizedBox(
                  height: 30.h,
                ),
                _buildLabelWithStar1(),
                SizedBox(
                  height: 10.h,
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
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, // Align items to the edges
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
                                return DialogueBoxChooseImage(
                                  onGalleryTap: () {
                                    controller.chooseFile();
                                  },
                                  onCameraTap: () {
                                    controller.chooseFileCamera();
                                  },
                                );
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
                SizedBox(
                  height: 15.h,
                ),
                CustomTextField(
                    labelText: 'Referral Code',
                    controller: controller.referrelcodecontroller,
                    hintText: ''),
                SizedBox(
                  height: 10.h,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text('0 characters (100 characters)',
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          color: appTheme.greydownarrow)),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Divider(
                  color: appTheme.greydivider,
                  indent: BorderSide.strokeAlignCenter,
                  thickness: 1,
                ),
                SizedBox(
                  height: 30.h,
                ),
                _buildButtons(context),
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
        'Redeem Code​',
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

  Widget _buildButtons(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialog(
                        title: 'Confirmation',
                        message: 'Are you sure you want to cancel?',
                        onYesPressed: () {
                          Get.back();
                        });
                  },
                );
              },
              style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(Size(98, 40)),
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
                        title: 'Confirmation',
                        message:
                            'Are you sure you want to submit the Referrals request?',
                        onYesPressed: () {
                          Get.offNamed(AppRoutes.productreferreltabbar);
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
                fixedSize: const MaterialStatePropertyAll(Size(98, 40)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: BorderSide(color: appTheme.grey500)),
                ),
              ),
              child: const Text('Submit'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTextFieldWithCalendar() {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: appTheme.white,
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: appTheme.grey500,
          width: 1.0,
        ),
      ),
      child: GetBuilder<Redeemcode1Controller>(
        init: Redeemcode1Controller(),
        builder: (controller) => Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller.calendercontroller,
                cursorColor: appTheme.black600,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'Select',
                  hintStyle: TextStyle(
                    color: appTheme.greytextcolour,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 15.0.h, horizontal: 15.0.w), // Adjust padding
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.calendar_month,
                      color: appTheme.greytextcolour,
                    ),
                    onPressed: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: Get.context!,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null) {
                        String formattedDate = DateFormat('dd-MM-yyyy')
                            .format(pickedDate); // Format date
                        controller.calendercontroller.text = formattedDate;
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabelWithStar() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Date of Purchase ',
            style: TextStyle(
              color: appTheme.greytextcolour,
              fontWeight: FontWeight.w500,
              fontSize: 10,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
          TextSpan(
            text: '*',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w500,
              fontSize: 14,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabelWithStar1() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Attachment ',
            style: TextStyle(
              color: appTheme.greytextcolour,
              fontWeight: FontWeight.w500,
              fontSize: 10,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
          TextSpan(
            text: '*',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w500,
              fontSize: 14,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
        ],
      ),
    );
  }
}
