import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/buzz_screens/likesdata/controller/likedatacontroller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class LikeDataScreen extends GetWidget<LikedataController> {
  const LikeDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.background,
      appBar: AppBar(
        backgroundColor: appTheme.redappbar,
        leading: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: IconButton(
            onPressed: () => Get.back(),
            icon: SvgPicture.asset(
              ImageConstant.arrowback,
              width: 27.w,
              height: 18.h,
            ),
          ),
        ),
        title: Text(
          'Likes',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: GoogleFonts.roboto().fontFamily,
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            color: appTheme.white,
          ),
        ),
      ),
      body: Obx(() {
        var userDetails = controller.userDetailsResponse;
        return ListView.builder(
          itemCount: userDetails.length,
          itemBuilder: (context, index) {
            var user = userDetails[index];
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: appTheme.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: user.profile != null
                        ? NetworkImage(
                            'https://your_image_base_url/${user.profile}')
                        : null,
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.firstName ?? '',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
