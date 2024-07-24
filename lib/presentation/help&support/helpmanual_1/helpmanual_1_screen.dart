import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/help&support/helpmanual_1/controller/helpmanual_1_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class HelpandSupportHelpManual1Screen
    extends GetWidget<HelpandSupportHelpManual1Controller> {
  const HelpandSupportHelpManual1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0XFFE41C39),
      child: Scaffold(
        backgroundColor: appTheme.white,
        appBar: AppBar(
          title: Text(
            "Help Manual",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
          backgroundColor: const Color(0XFFE41C39),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: SvgPicture.asset(
              ImageConstant.arrowback,
              width: 26.75.w,
              height: 19.76.h,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          //controller.searchQuery.value = value;
                        },
                        cursorColor: appTheme.black600,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'What are you looking for ?',
                          contentPadding: EdgeInsets.only(bottom: 10.0),
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(child: _buildHelpandSupport()),
      ),
    );
  }

  Widget _buildHelpandSupport() {
    final controller = Get.put(HelpandSupportHelpManual1Controller());

    return Column(
      children: [
        const SizedBox(height: 5),
        _buildAllModules('All Modules'),
        Obx(() {
          if (controller.helpusermanualList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Column(
              children: List.generate(
                controller.helpusermanualList.length,
                (index) {
                  var userManual = controller.helpusermanualList[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: userManual.modules!.map((module) {
                          return _buildAllModules(module.moduleName!);
                        }).toList(),
                      ),
                      const SizedBox(height: 10), // Spacer between manuals
                    ],
                  );
                },
              ),
            );
          }
        }),
      ],
    );
  }

  Widget _buildAllModules(String modulename) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          GestureDetector(
             onTap: () {
            Get.toNamed(AppRoutes.helpandsupporthelpmanual3, arguments: {'moduleName': modulename});
          },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(width: 8.0),
                Transform.translate(
                  offset: const Offset(15.0, 0.0),
                  child: Text(
                    modulename,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: appTheme.black900,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 22.0,
                    color: appTheme.greytextcolour,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 25),
            child: Divider(
              color: appTheme.grey500,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHelpUserManualList(String text) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.helpandsupporthelpmanual3);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const SizedBox(width: 8.0),
                Transform.translate(
                  offset: const Offset(15.0, 0.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: appTheme.black900,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 22.0,
                    color: appTheme.greytextcolour,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 25),
            child: Divider(
              color: appTheme.grey500,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
