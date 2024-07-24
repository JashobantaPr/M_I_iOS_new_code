import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/help&support/helpmanual_4/controller/helpmanual_4_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class HelpandSupportHelpManual4Screen
    extends GetWidget<HelpandSupportHelpManual4Controller> {
  const HelpandSupportHelpManual4Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller if it hasn't been initialized already
    final controller = Get.put(HelpandSupportHelpManual4Controller());

    return Container(
      color: const Color(0XFFE41C39),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "All Modules",
            style: TextStyle(
              color: Colors.white,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 18,
              fontWeight: FontWeight.w400,
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
              width: 26.75,
              height: 19.76,
            ),
          ),
        ),
        body: Obx(
          () {
            if (controller.helpManualResponse.value == null) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.red,
                strokeWidth: 2,
              ));
            }
            final searchContent =
                controller.helpManualResponse.value?.searchContent;
            if (searchContent == null || searchContent.isEmpty) {
              return const Center(child: Text('No data available'));
            }

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: searchContent.map((module) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: module.modulesTopic.values.where((topic) {
                            return controller.topicname == topic.topicName;
                          }).map((topic) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                _buildRegisterTitle(topic.topicName ?? ''),
                                SizedBox(height: 10),
                                _buildSteps(topic.topicContent ?? ''),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildRegisterTitle(text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Align(
          alignment: Alignment(-0.7, 0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: appTheme.black900,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSteps(String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(height: 13),
        Padding(
          padding: EdgeInsets.only(left: 19.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  stripHtmlTags(description),
                  style: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF575656),
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 6),
      ],
    );
  }

  String stripHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }
}
