// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // Added correct import for Material package
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/homebottombar/engagement/controller/engagementcontroller.dart';
import 'package:incentivesgit/presentation/homebottombar/engagement/model/engagementmodel.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class EngagementScreen extends GetWidget<EngagementController> {
  const EngagementScreen({super.key}); // Corrected constructor declaration

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appTheme.rediconbackground,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: const Text(
              "Engagement",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: appTheme.rediconbackground,
            iconTheme: const IconThemeData(color: Colors.white),
            automaticallyImplyLeading: false,
          ),
          body: Obx(() {
            if (controller.engagementList.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.engagementList.length,
                    itemBuilder: (context, index) {
                      final menu = controller.engagementList[index];
                      return _buildMenuItem(menu);
                    },
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildMenuItem(EngagementModel menu) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: GestureDetector(
            onTap: () {
              if (menu.menuName == "Buzzzes") {
                Get.toNamed(AppRoutes.buzzetabbar,
                    arguments: {'title': menu.menuName});
              } else if (menu.menuName.isCaseInsensitiveContains('Qui')) {
                Get.toNamed(AppRoutes.quizzesTabBarScreen);
              } else {
                Get.toNamed(AppRoutes.certificatetabbar,
                    arguments: {'title': menu.menuName});
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  menu.menuName.startsWith('Buzz')
                      ? SvgPicture.asset(
                          ImageConstant.buzzes1,
                          width: 20,
                          height: 20,
                        )
                      : menu.menuName.startsWith('Bir')
                          ? SvgPicture.asset(
                              ImageConstant.birthday,
                              width: 20,
                              height: 20,
                            )
                          : menu.menuName.startsWith('Ann')
                              ? SvgPicture.asset(
                                  ImageConstant.anniversarie,
                                  width: 20,
                                  height: 20,
                                )
                              : menu.menuName.startsWith('News')
                                  ? SvgPicture.asset(
                                      ImageConstant.news1,
                                      width: 20,
                                      height: 20,
                                    )
                                  : menu.menuName.startsWith('Know')
                                      ? SvgPicture.asset(
                                          ImageConstant.knowledgecenter1,
                                          width: 20,
                                          height: 20,
                                        )
                                      : menu.menuName.startsWith('Cert')
                                          ? SvgPicture.asset(
                                              ImageConstant.certificate,
                                              width: 20,
                                              height: 20,
                                            )
                                          : menu.menuName.startsWith('Gall')
                                              ? SvgPicture.asset(
                                                  ImageConstant.gallery1,
                                                  width: 20,
                                                  height: 20,
                                                )
                                              : menu.menuName.startsWith('Quiz')
                                                  ? SvgPicture.asset(
                                                      ImageConstant.quizzes,
                                                      width: 20,
                                                      height: 20,
                                                    )
                                                  : const SizedBox(width: 20),
                  Expanded(
                    child: Padding(
                      // Added padding here
                      padding: const EdgeInsets.only(
                          left: 15), // Adjust the value as needed
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  menu.menuName,
                                  style: TextStyle(
                                      color: appTheme.black900,
                                      fontSize: 14,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    right: 10), // Adjust the value as needed
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 17),
                          const Padding(
                            padding: EdgeInsets.only(right: 16.0),
                            child: Divider(
                              color: Color(0xFFD5D5D5),
                              thickness: 1,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
