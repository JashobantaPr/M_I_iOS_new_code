import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'controller/view_profile_controller.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class ViewProfileScreen extends GetWidget<ViewProfileController> {
  const ViewProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Obx(
                    () => Text(
                      '${controller.userData.firstName.value} ${controller.userData.lastName.value}',
                      style: TextStyle(fontSize: 25, color: appTheme.white),
                    ),
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
                Get.toNamed(AppRoutes.myProfile);
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



// Center(
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.black,
//                   shape: BoxShape.circle,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.5),
//                       spreadRadius: 5,
//                       blurRadius: 7,
//                       offset: Offset(0, 3), // changes position of shadow
//                     ),
//                   ],
//                 ),
//                 child: controller.userData.profileImage.value.isNotEmpty
//                     ? ClipOval(
//                         child: Image.network(
//                           '${Url.imageUrl}${controller.userData.profileImage.value}',
//                           width: 80.w,
//                           height: 80.h,
//                           fit: BoxFit.cover,
//                           loadingBuilder: (BuildContext context, Widget child,
//                               ImageChunkEvent? loadingProgress) {
//                             if (loadingProgress == null) {
//                               return child;
//                             } else {
//                               return Center(
//                                 child: CircularProgressIndicator(
//                                   value: loadingProgress.expectedTotalBytes !=
//                                           null
//                                       ? loadingProgress.cumulativeBytesLoaded /
//                                           loadingProgress.expectedTotalBytes!
//                                       : null,
//                                 ),
//                               );
//                             }
//                           },
//                           errorBuilder: (BuildContext context, Object exception,
//                               StackTrace? stackTrace) {
//                             return Icon(Icons.person, size: 40);
//                           },
//                         ),
//                       )
//                     : CircleAvatar(
//                         radius: 90.r,
//                         child: Icon(
//                           Icons.person,
//                           color: Colors.white,
//                           size: 60.sp,
//                         ),
//                       ),
//               ),
//             ),
