import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/myProfile/bank_ac_profile/bank_ac_profile.dart';
import 'package:incentivesgit/presentation/myProfile/myprofile/controller/myprofilecontroller.dart';
import 'package:incentivesgit/presentation/myProfile/pan_profile/pan_profile.dart';
import 'package:incentivesgit/presentation/myProfile/paytm_profile/paytm_profile.dart';
import 'package:incentivesgit/presentation/myProfile/primary_profile/primary_profile.dart';
import 'package:incentivesgit/presentation/myProfile/upi_profile/upi_profile.dart';
import 'package:incentivesgit/presentation/myProfile/vpa_profile/vpa_profile.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';

class MyProfileScreen extends GetWidget<MyProfileController> {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MyProfileController>();
    return ScreenUtilInit(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: appTheme.background,
          appBar: AppBar(
            title: Text(
              "My Profile",
              style: TextStyle(
                color: appTheme.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
            backgroundColor: appTheme.rediconbackground,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: SvgPicture.asset(
                ImageConstant.arrowback,
                width: 26.75.w,
                height: 19.76.h,
              ),
            ),
          ),
          body: Column(
            children: [
              Obx(() {
                return Container(
                  height: 150,
                  color: appTheme.rediconbackground,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: appTheme.white, width: 1),
                      ),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(
                            '${Url.profileimageUrl}${controller.profilePic}'),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  color: appTheme.rediconbackground,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: appTheme.white,
                                    width: 1,
                                  ),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return dialoguebox(context);
                                      },
                                    );
                                  },
                                  icon: const Icon(Icons.camera_alt_outlined),
                                  color: appTheme.white,
                                  iconSize: 18,
                                  alignment: Alignment.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
              Obx(
                () => controller.isLoading.value
                    ? Center(child: CircularProgressIndicator())
                    : Column(
                        children: [
                          Container(
                            color: appTheme.rediconbackground,
                            child: controller.details.isEmpty
                                ? Center(child: Text('No data available'))
                                : TabBar(
                                    isScrollable: true,
                                    tabAlignment: TabAlignment.start,
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                    ),
                                    physics:
                                        const AlwaysScrollableScrollPhysics(),
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    indicatorWeight: 3,
                                    tabs: controller.details
                                        .map((detail) =>
                                            Tab(text: detail.menuName))
                                        .toList(),
                                    labelColor: appTheme.white,
                                    unselectedLabelColor: Colors.white54,
                                    indicatorColor: appTheme.white,
                                  ),
                          ),
                        ],
                      ),
              ),
              Obx(() {
                return Expanded(
                  child: TabBarView(
                    children: controller.details.map((detail) {
                      final menuName = detail.menuName!.toLowerCase();
                      print('dkffj $menuName');
                      if (menuName.contains('primary')) {
                        return const PrimaryProfileScreen();
                      } else if (menuName.contains('pan')) {
                        return const PanProfileSceen();
                      } else if (menuName.contains('bank')) {
                        return const BankAccountProfileScreen();
                      } else if (menuName.contains('paytm')) {
                        return const PaytmProfileScreen();
                      } else if (menuName.contains('vpa')) {
                        return const VpaProfileScreen();
                      } else if (menuName.contains('upi')) {
                        return const UpiProfileScreen();
                      } else {
                        return const Center(child: Text('No data available'));
                      }
                    }).toList(),
                  ),
                );
              })
            ],
          ),
        ),
      ),
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
}
