import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

import 'controller/create_article_controller.dart';

class CreateArticleScreen extends GetWidget<CreateArticleController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0XFFE41C39),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 214, 213, 213),
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: const Text(
              "Create Article",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: const Color(0XFFE41C39),
            iconTheme: const IconThemeData(color: Colors.white),
            leading: Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: SvgPicture.asset(
                  ImageConstant.arrowback,
                  width: 6.7.w,
                  height: 8.7.h,
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                _buildBuzzCard(context),
                const SizedBox(
                  height: 10,
                ),
                //Cancel and Buzz Buttons
                Padding(
                  padding: const EdgeInsets.only(
                      left: 70, right: 70, top: 20, bottom: 50),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: 120,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: TextButton(
                            onPressed: () {
                              controller.toggleCancel();
                            },
                            child: const Text(
                              'Cancel',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          width: 120,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: TextButton(
                            onPressed: () {
                              showPopUpDialog(context);
                            },
                            child: Text(
                              'Preview',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: appTheme.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBuzzCard(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: const Color(0XFFFFFFFF),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Row(
                    children: [
                      Text(
                        'Select Post Type ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Obx(
                        () => Radio(
                          value: true,
                          groupValue: controller.isSelected.value,
                          onChanged: (value) {
                            controller.isSelected.value = value!;
                          },
                        ),
                      ),
                      const Text(
                        'Create post in existing scope -Mumbai',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(
                        () => Radio(
                          value: false,
                          groupValue: controller.isSelected.value,
                          onChanged: (value) {
                            controller.isSelected.value = value!;
                          },
                        ),
                      ),
                      const Text(
                        'Create global post for all scopes​',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Visibility(
              visible: controller.isSelected.value,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'News Title',
                          style: TextStyle(
                              color: appTheme.greytextcolour, fontSize: 12),
                        ),
                        Text(
                          '*',
                          style: TextStyle(
                              color: appTheme.redappbar, fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40.0, // Set the height
                      width:
                          double.infinity, // Set the width to occupy full width
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(5.0), // Set the border radius
                        border: Border.all(
                            color: appTheme.grey500), // Set the border color
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none, // Remove the default border
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10.0), // Add padding
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Obx(
                              () => Radio(
                                value: 1,
                                groupValue: controller.radioValue.value,
                                onChanged: (value) {
                                  controller.radioValue.value = value!;
                                  controller.update();
                                },
                              ),
                            ),
                            Text(
                              'Plain Textbox',
                              style: TextStyle(
                                  color: appTheme.greydownarrow, fontSize: 14),
                            ),
                            SizedBox(width: 20),
                            Obx(
                              () => Radio(
                                value: 2,
                                groupValue: controller.radioValue.value,
                                onChanged: (value) {
                                  controller.radioValue.value = value!;
                                  controller.update();
                                },
                              ),
                            ),
                            Text(
                              'Rich Textbox',
                              style: TextStyle(
                                  color: appTheme.greydownarrow, fontSize: 14),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          height: 128.h, // Set the height
                          width: double
                              .infinity, // Set the width to occupy full width
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                5.r), // Set the border radius
                            border: Border.all(
                                color:
                                    appTheme.grey500), // Set the border color
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              border:
                                  InputBorder.none, // Remove the default border
                              // hintText: 'Enter your text here',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Select image',
                      style: TextStyle(
                          color: appTheme.greytextcolour, fontSize: 12),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFD5D5D5)),
                            ),
                            child: Obx(
                              () => Center(
                                child: Text(
                                  controller.selectedFileName.value.isNotEmpty
                                      ? controller.selectedFileName.value
                                      : 'No file chosen',
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () async => await controller.pickFile(),
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Center(
                                child: Text(
                                  'Choose file',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Max file size up to 1MB',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );
  }

  void showPopUpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(8.0), // Adjust the radius as needed
          ),
          content: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: 516,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 40.0, // Set the width
                          height: 40.0, // Set the height
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                          ),
                          child: ClipOval(
                            child: Image.network(
                              '',
                              width: 40.0, // Set the width
                              height: 40.0, // Set the height
                              fit: BoxFit.cover,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                } else {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value:
                                          loadingProgress.expectedTotalBytes !=
                                                  null
                                              ? loadingProgress
                                                      .cumulativeBytesLoaded /
                                                  loadingProgress
                                                      .expectedTotalBytes!
                                              : null,
                                    ),
                                  );
                                }
                              },
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return Icon(Icons.person, size: 40.0);
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 7.0), // Adjusted width
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Chetana Shelar ',
                                  style: TextStyle(
                                    fontSize: 12.0, // Adjusted font size
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    color: appTheme.cyan800,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: ' published an Article .',
                                  style: TextStyle(
                                    fontSize: 12.0, // Adjusted font size
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    color: appTheme.cyan800,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "04 February 2020 11:42 am",
                                style: TextStyle(
                                  fontSize: 10.0, // Adjusted font size
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  color: appTheme.greytextcolour,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(width: 3.0), // Adjusted width
                              SvgPicture.asset(
                                ImageConstant.public,
                                width: 13.42, // Adjusted width
                                height: 13.42, // Adjusted height
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0), // Adjusted height
                  Divider(
                    color: appTheme.gray90001,
                    thickness: 1, // Adjust the thickness as needed
                  ),
                  SizedBox(height: 15.0), // Adjusted height
                  Text(
                    'Happy Chocolate Day..',
                    style: TextStyle(
                        fontSize: 12,
                        color: appTheme.black600,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 200,
                    child: Text(
                      'Life Is Like A Chocolate Box, Each Chocolate Is Like A Portion Of Life, Some Are Crunchy, Some Are Nutty, Some Are Soft, But All Are Delicious. Happy Chocolate Day...see more',
                      style: TextStyle(
                          fontSize: 10,
                          color: appTheme.cyan800,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 290.0, // Set the width
                    height: 205.0, // Set the height (adjust as needed)
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: appTheme.gray700, // Set the border color
                        width: 1.0, // Set the border width (adjust as needed)
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Image',
                        style: TextStyle(
                          fontSize: 10.0, // Ensure fontSize is a double value
                          color: appTheme.cyan800,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          actions: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: 120,
                    height: 48,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2),
                        border: Border.all(color: appTheme.black600)),
                    child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        'Cancel',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    width: 120,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Post',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: appTheme.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
