import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // Added correct import for Material package
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/hub_screens/controller/hub_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';

class HubScreen extends GetView<HubController> {
  const HubScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HubController controller = Get.put(HubController());

    return Container(
      color: Color(0XFFE41C39),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Text(
              "Hub",
              style: TextStyle(
                color: Colors.white,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
            backgroundColor: Color(0XFFE41C39),
            iconTheme: const IconThemeData(
              color: Colors.white,
            ),
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: SvgPicture.asset(
                ImageConstant.arrowback,
                width: 26.75.w,
                height: 19.76.h,
              ),
            ),
            actions: [
              Obx(() => controller.isSearchVisible.value
                  ? Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        width: 340,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: TextField(
                          onChanged: (value) {
                            controller.search(value); //
                            controller.clearSearch();
                          },
                          onSubmitted: (value) {
                            controller
                                .search(value); // Perform search when submitted
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search Document within all section',
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w100,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                            contentPadding: EdgeInsets.only(left: 15),
                            prefixIcon: IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                controller.toggleSearch1();
                              },
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.cancel),
                              onPressed: () {
                                controller.search('');
                                controller.clearSearch();
                              },
                            ),
                          ),
                        ),
                      ),
                    )
                  : IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        controller.toggleSearch();
                      },
                    )),
            ],
          ),
          body: Container(
            color: Color(0xFFF0F0F0),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: _buildTrainingInfo(controller),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTrainingInfo(HubController controller) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Ensuring full width
        children: [
          if (controller.isSearching.value) // Check if search is active
            ...controller.searchResults.map((searchContent) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  // Display files based on file type
                  for (var file in searchContent.files)
                    ListTile(
                      title: Text(file.documentName),
                      subtitle: Text(file.createdDate),
                      leading: Image.network(file.pdfIcon),
                      onTap: () {
                        // Implement functionality to open or download file
                      },
                    ),
                ],
              );
            }),
          Container(
            height: 500, // Fixed height for the ListView
            child: ListView.builder(
              itemCount: controller.traininghub.length,
              itemBuilder: (context, index) {
                final section = controller.traininghub[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (controller.expandedSectionIndex.value == index) {
                          controller.expandedSectionIndex.value = -1;
                        } else {
                          controller.expandedSectionIndex.value = index;
                        }
                      },
                      child: Container(
                        height: 40,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  section.sectionName,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                  ),
                                ),
                              ),
                            ),
                            Obx(() => Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Icon(
                                    controller.expandedSectionIndex.value ==
                                            index
                                        ? Icons.expand_less
                                        : Icons.arrow_forward_ios_rounded,
                                    color: Colors.grey,
                                    size:
                                        controller.expandedSectionIndex.value ==
                                                index
                                            ? 35
                                            : 20,
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ),
                    Obx(() {
                      if (controller.expandedSectionIndex.value == index) {
                        return Column(
                          children: List.generate(
                            section.subSection.length,
                            (subIndex) {
                              final subsection = section.subSection[subIndex];
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.hub1,
                                      arguments: subsection.hubSectionIdPk);
                                  print('asasasas${subsection.hubSectionIdPk}');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 8, bottom: 8),
                                  child: Text(
                                    subsection.sectionName,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    }),
                    SizedBox(height: 16),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
