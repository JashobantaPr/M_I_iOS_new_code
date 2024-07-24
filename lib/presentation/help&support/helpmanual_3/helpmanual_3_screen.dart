import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/help&support/helpmanual_3/controller/helpmanual_3_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

import '../helpmanual_1/controller/helpmanual_1_controller.dart';
import '../helpmanual_1/model/helpmanual_1_model.dart';

class HelpandSupportHelpManual3Screen
    extends GetWidget<HelpandSupportHelpManual3Controller> {
  const HelpandSupportHelpManual3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HelpandSupportHelpManual3Controller());

    final arguments = Get.arguments;
    String? moduleName;

    if (arguments != null && arguments is Map<String, dynamic>) {
      moduleName = arguments['moduleName'];
    } else {}

    return Scaffold(
      backgroundColor: appTheme.white,
      appBar: AppBar(
        title: Text(
          "All Modules",
          style: TextStyle(
              color: Colors.white,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 18,
              fontWeight: FontWeight.w400),
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
      ),
      body: Obx(() => ListView.builder(
            itemCount: controller.helpusermanualList.length,
            itemBuilder: (context, index) {
              var userManual = controller.helpusermanualList[index];

              List<ManualDetails> filteredModules;
              if (moduleName == "All Modules") {
                filteredModules = userManual.manualDetails!;
              } else {
                filteredModules = userManual.manualDetails!
                    .where((module) => module.moduleName == moduleName)
                    .toList();
              }
              if (filteredModules.isNotEmpty) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: filteredModules.map((module) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.only(left: 25.0),
                          child: Text(
                            module.moduleName ?? '',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                              color: appTheme.black900,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 3.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: module.moduleTopics!.map((topic) {
                              return _buildUserLoginDetails(
                                  topic.topicName ?? '');
                            }).toList(),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          )),
    );
  }

  Widget _buildUserLoginDetails(String text) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.helpandsupporthelpmanual4, arguments: {'topictext': text});
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 8.0),
              Expanded(
                child: Transform.translate(
                  offset: Offset(15.0, 0.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: appTheme.black900,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 19.0),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 22.0,
                  color: appTheme.greytextcolour,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 25),
          child: Divider(
            color: appTheme.grey500,
            thickness: 1,
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }
}
