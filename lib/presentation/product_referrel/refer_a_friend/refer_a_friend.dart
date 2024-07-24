import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/product_referrel/refer_a_friend/controller/refer_a_friend_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/customTextField.dart';
import 'package:incentivesgit/widgets/customdropdown1.dart';
import 'package:incentivesgit/widgets/customtextfield1.dart';
import 'package:incentivesgit/widgets/dialoguebox.dart';

class ReferAFriendScreen extends GetWidget<ReferAFriendController> {
  const ReferAFriendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        appBar: _customAppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 20.h),
            child: Column(
              children: [
                CustomTextField(
                    labelText: 'Name of the referee',
                    controller: controller.namecontroller,
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
                  height: 10.h,
                ),
                CustomTextField(
                    labelText: 'Mobile number ',
                    controller: controller.phonenumbercontroller,
                    hintText: ''),
                SizedBox(
                  height: 30.h,
                ),
                CustomTextField1(
                    labelText: 'Email',
                    controller: controller.emailcontroller,
                    hintText: '',
                    keyboardType: TextInputType.emailAddress),
                SizedBox(
                  height: 30.h,
                ),
                searchProduct(),
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
                  labelText: 'Dealership',
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
        'Refer a Friend​',
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

  Widget searchProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Product referred',
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
              ),
            ],
          ),
        ),
        const SizedBox(height: 7),
        DecoratedBox(
          decoration: BoxDecoration(
            color: appTheme.white,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
              color: appTheme.grey500,
              width: 1.0,
            ),
          ),
          child: GetBuilder<ReferAFriendController>(
            init: ReferAFriendController(),
            builder: (controller) => Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller.textFieldController,
                    cursorColor: appTheme.black600,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: 'Select',
                      hintStyle: TextStyle(
                        color: appTheme.black900,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 15.0),
                      suffixIcon: IconButton(
                        icon: SvgPicture.asset(
                          ImageConstant.search,
                          width: 15,
                          height: 15,
                        ),
                        onPressed: () {
                          // Implement your logic to open search and select data
                          openSearchDialog();
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void openSearchDialog() {
    // Implement your logic to show a dialog or navigate to a search page
    // where users can select multiple items
    Get.defaultDialog(
      title: 'Select Items',
      content: Column(
        children: [
          // Replace with your logic to show selectable items
          CheckboxListTile(
            value: controller.selectedItems.contains('Item 1'), // Example item
            onChanged: (bool? value) {
              if (value != null && value) {
                controller.selectedItems.add('Item 1'); // Example item
              } else {
                controller.selectedItems.remove('Item 1'); // Example item
              }
            },
            title: Text('Item 1'), // Example item
          ),
        ],
      ),
      confirm: ElevatedButton(
        onPressed: () => Get.back(),
        child: Text('Confirm'),
      ),
    );
  }
}
