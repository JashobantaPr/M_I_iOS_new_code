import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/Birthdays/Birthday_1/controller/birthday_1_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class Birthady1Screen extends GetWidget<Birthday1Controller> {
  const Birthady1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> staticData = [
      {'name': 'User 1'},
      {'name': 'User 2'},
      {'name': 'User 3'},
      // Add more static data as needed
    ];

    return ScreenUtilInit(
      child: Scaffold(
        backgroundColor: appTheme.grey,
        body: ListView.builder(
          itemCount: 3,
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
                    SingleChildScrollView(
                      child: Container(
                        width: 360.sp,
                        height: 200.sp,
                        color: const Color.fromARGB(255, 174, 173, 173),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 0,
                            right: 0,
                            bottom: 5,
                            top: 5,
                          ),
                          child: Column(
                            children: [
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: staticData.map((data) {
                                    return SizedBox(
                                      height: 190,
                                      width: 130,
                                      child: Card(
                                        elevation: 4,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Stack(
                                                children: [],
                                              ),
                                              const SizedBox(width: 10),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: Colors.red,
                                                        width: 1.5,
                                                      ),
                                                    ),
                                                    child: ClipOval(
                                                      child: const Icon(
                                                        Icons.person,
                                                        size: 60,
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    data['name']!,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  Container(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    decoration:
                                                        const BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: Colors.red,
                                                    ),
                                                    child: const Text(
                                                      '1',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  const Text(
                                                    'years',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Happy Service Anniversary from all of us..!!',
                                style: TextStyle(
                                  fontFamily: 'Niconne',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF383853),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                '11 December 2022 07:00am',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF383853),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "120",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontFamily:
                                                    GoogleFonts.poppins()
                                                        .fontFamily,
                                                color: appTheme.cyan800,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' Likes',
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontFamily:
                                                    GoogleFonts.poppins()
                                                        .fontFamily,
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
                                              text: "20",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontFamily:
                                                    GoogleFonts.poppins()
                                                        .fontFamily,
                                                color: appTheme.cyan800,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            TextSpan(
                                              text: ' Comments',
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontFamily:
                                                    GoogleFonts.poppins()
                                                        .fontFamily,
                                                color: appTheme.cyan800,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 11.5.h),
                              Divider(color: appTheme.gray900),
                              SizedBox(height: 5.5.h),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () {},
                                          child: const Icon(
                                            Icons.thumb_up_alt_outlined,
                                          ),
                                        ),
                                        SizedBox(width: 2.w),
                                        Text(
                                          'Like',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily,
                                            color: appTheme.cyan800,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 40.27.w),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          ImageConstant.comment,
                                          width: 16.27.w,
                                          height: 16.27.h,
                                        ),
                                        SizedBox(width: 2.w),
                                        Text(
                                          'Comment',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily,
                                            color: appTheme.cyan800,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.5.h),
                              _profileData(), // Display profile data widget here
                              Divider(color: appTheme.greydivider),
                              SizedBox(height: 12.5.h),
                              sendcomment(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () {
                    // Get.toNamed(AppRoutes.createarticle);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'Article',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.filter_list),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'Filter',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileData() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              leading: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
                child: ClipOval(
                  child: Image.network(
                    '', // Replace with actual image URL
                    width: 40.w,
                    height: 40.h,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      }
                    },
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                      return Icon(Icons.person, size: 40);
                    },
                  ),
                ),
              ),
              title: Text(
                'Kalpita More',
                style: TextStyle(
                  fontSize: 11.sp,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: appTheme.cyan800,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Great",
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
                          width: 15.w,
                          height: 15.h,
                        ),
                        SizedBox(
                          width: 5.5.w,
                        ),
                        VerticalDivider(
                          color: appTheme.greyverticaldevider,
                          thickness: 1.0,
                          width: 1.0,
                        ),
                        SizedBox(
                          width: 5.5.w,
                        ),
                        Text(
                          '10',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            color: appTheme.black900,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          width: 5.5.w,
                        ),
                        Text(
                          'Likes',
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
                "1hr ago",
                style: TextStyle(
                  fontSize: 10.sp,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: appTheme.greytextcolour,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            if (index != 2) // Add divider if not the last item
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
        ClipOval(
          child: Container(
            width: 40.w,
            height: 40.h,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
            ),
            child: CircleAvatar(
              child: Image.network(
                '',
                width: 40.w,
                height: 40.h,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  }
                },
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return const Icon(
                    Icons.person,
                    size: 20,
                    color: Colors.white,
                  );
                },
              ),
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
              // controller: controller.commentcontroller,
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
            // final firstName = author!.firstName ?? "";
            // final lastName = author.lastName ?? "";
            // final postId = userPosts.postIdPk ?? "";
            // controller.addcomment(firstName, lastName, postId);
          },
          child: Container(
              width: 60,
              height: 40,
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
