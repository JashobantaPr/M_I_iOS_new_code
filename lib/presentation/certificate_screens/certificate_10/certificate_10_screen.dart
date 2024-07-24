import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_10/controller/certificate_10_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

import '../../../routes/app_routes.dart';

class Certificate10Screen extends GetWidget<Certificate10Controller> {
  const Certificate10Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: ScreenUtilInit(
          child: Scaffold(
            backgroundColor: appTheme.grey,
            // appBar: AppBar(
            //   title: const Text(
            //     "View Post",
            //     style: TextStyle(color: Colors.white),
            //   ),
            //   backgroundColor: const Color(0XFFE41C39),
            //   iconTheme: const IconThemeData(color: Colors.white),
            //   leading: IconButton(
            //     icon: const Icon(Icons.arrow_back),
            //     onPressed: () {
            //       Get.back();
            //     },
            //   ),
            // ),
            body: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 556.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: appTheme.grey,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 46.w,
                              height: 46.h,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: appTheme.rediconbackground,
                                  width: 2.0,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 23.w,
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage(
                                  ImageConstant.profilepic,
                                ),
                              ),
                            ),

                            SizedBox(width: 7.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Chetana Shelar ',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          color: appTheme.cyan800,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'has given a certificate',
                                        style: TextStyle(
                                          fontSize: 12.sp,
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
                                      '04 February 2020 11:42 am',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        color: appTheme.greytextcolour,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    SizedBox(width: 5.w),
                                    SvgPicture.asset(
                                      ImageConstant.public,
                                      width: 13.42.w,
                                      height: 13.42.h,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Spacer(), // Added Spacer widget to push the dots to the right corner
                            Transform.translate(
                              offset: Offset(0,
                                  -5), // Adjust the vertical offset as needed
                              child: Icon(
                                Icons.more_vert,
                                color: appTheme.greydownarrow,
                                size: 26.0, // Adjust the size as needed
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.all(
                              1.0), // You can specify the padding value here
                          child: Container(
                            width: 359.w,
                            height: 254.h,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  ImageConstant
                                      .profilepic, // Using AssetImage with ImageConstant.profilepic
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(0),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Row(
                          children: [
                            Text(
                              'Thanks Anurupa for the help on ABC project!',
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                color: appTheme.cyan800,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.w),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '150 ',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: appTheme.cyan800,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Likes',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: appTheme.cyan800,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '20 ',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: appTheme.cyan800,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Comments',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: appTheme.cyan800,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 11.5.h),
                        Divider(color: appTheme.greydivider),
                        SizedBox(height: 5.5.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  ImageConstant.like,
                                  width: 16.27.w,
                                  height: 16.27.h,
                                ),
                                SizedBox(width: 6.w),
                                Text(
                                  'Like',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    color: appTheme.cyan800,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                            SizedBox(width: 40.27.w),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                  ImageConstant.comment,
                                  width: 16.27.w,
                                  height: 16.27.h,
                                ),
                                SizedBox(width: 6.w),
                                Text(
                                  'Comment',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    color: appTheme.cyan800,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 8.5.h),
                        Divider(color: appTheme.greydivider),
                        SizedBox(height: 5.5.h),
                        Expanded(child: _profileData()),
                        Divider(color: appTheme.greydivider),
                        SizedBox(height: 12.5.h),
                        sendcomment(),
                        SizedBox(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed(AppRoutes.awardCertificate);
                                  },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.add),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        'Buzz',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 2,
                                color: Colors.grey,
                              ),
                              Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    // Get.toNamed(AppRoutes.);
                                  },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(Icons.filter_list),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        'Filter',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _profileData() {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              leading: Container(
                width: 46.w,
                height: 46.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: appTheme.rediconbackground,
                    width: 2.0,
                  ),
                ),
                child: CircleAvatar(
                  radius: 23.w,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage(
                    ImageConstant.profilepic,
                  ),
                ),
              ),
              title: Text(
                'Kalpita More',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: appTheme.cyan800,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Great work team.',
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: appTheme.cyan800,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Image.asset(
                          ImageConstant.likeblack,
                          width: 20.w,
                          height: 20.h,
                        ),
                        SizedBox(
                          width: 12.5.w,
                        ),
                        VerticalDivider(
                          color: appTheme.greyverticaldevider,
                          thickness: 1.0,
                          width: 1.0,
                        ),
                        SizedBox(
                          width: 12.5.w,
                        ),
                        Text(
                          '1 Like',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            color: appTheme.black900,
                            fontWeight: FontWeight.normal,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              trailing: Text(
                '1hr ago',
                style: TextStyle(
                  fontSize: 10.sp,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: appTheme.greytextcolour,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            if (index != 3)
              Divider(
                color: appTheme.greydivider,
                indent: 70,
              ),
          ],
        );
      },
    );
  }

  Widget sendcomment() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 46.w,
          height: 46.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: appTheme.rediconbackground,
              width: 2.0,
            ),
          ),
          child: CircleAvatar(
            radius: 23.w,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage(
              ImageConstant.profilepic,
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Container(
            height: 40.h,
            decoration:
                BoxDecoration(border: Border.all(color: appTheme.gray500)),
            child: TextField(
              cursorColor: appTheme.black600,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 15),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: appTheme.greybordercolour.withOpacity(1),
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                hintText: 'Type a comment',
                hintStyle: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: appTheme.greytextcolour),
              ),
            ),
          ),
        ),
        SizedBox(width: 8.w),
        GestureDetector(
          onTap: () {
            // Handle send button tap
          },
          child: Container(
              width: 60,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: appTheme.rediconbackground,
              ),
              padding:
                  const EdgeInsets.only(top: 9, bottom: 9, right: 21, left: 21),
              child: SvgPicture.asset(
                ImageConstant.send,
                fit: BoxFit.contain,
              )),
        ),
      ],
    );
  }
}
