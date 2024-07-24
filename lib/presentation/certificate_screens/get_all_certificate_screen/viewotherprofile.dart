import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:incentivesgit/presentation/certificate_screens/get_all_certificate_screen/controller/get_all_certificate_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

import 'model/get_all_certificate_model.dart';

class ViewOtherProfileScreen extends GetWidget<GetAllCertificateController> {
  const ViewOtherProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Post arg = Get.arguments;
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        backgroundColor: appTheme.black600,
        body: Column(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Ensure button is at the bottom
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 30.0, horizontal: 20.0), // Adjust padding as needed
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.close_rounded,
                      size: 30,
                      color: appTheme.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  Text(
                    arg.certificateRecipientName ?? '',
                    style: TextStyle(fontSize: 25, color: appTheme.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 90.r,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 60.sp,
                  ),
                ),
              ),
            ),
            SizedBox(width: 150.w),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.buzz33, arguments: arg.taggedUsers);
              },
              child: Container(
                width: 200.w, // Adjust width as needed
                height: 50.h, // Adjust height as needed
                decoration: const BoxDecoration(
                  color: Color(0XFFE41C39),
                ),
                child: Center(
                  child: Text(
                    'View Profile',
                    style: TextStyle(color: appTheme.white, fontSize: 15),
                  ),
                ),
              ),
            ),
            SizedBox(width: 120.w),
          ],
        ),
      ),
    );
  }
}
