import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/hub%20-%201/controller/hub1_controller.dart';
import 'package:incentivesgit/presentation/hub%20-%201/model/hub1_model.dart';
import 'package:incentivesgit/presentation/hub%20-%201/pdfscreen.dart';
import 'package:incentivesgit/presentation/hub%20-%201/videoplayer.dart';
import 'package:incentivesgit/presentation/hub%20-%201/viewdocumentScreen.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class Hub1Screen extends GetWidget<Hub1Controller> {
  Hub1Screen({Key? key}) : super(key: key);

  void _performSearch(String query) {
    // Perform search for PDF or MP4 files by name
    controller.filterFilesByName(query);
  }

  @override
  Widget build(BuildContext context) {
    final Hub1Controller hub1Controller = Get.put(Hub1Controller());

    return Container(
      color: Color(0XFFE41C39),
      child: SafeArea(
        maintainBottomViewPadding: true,
        bottom: false,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Obx(
              () => Text(
                hub1Controller.sectionName.value,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ),
            backgroundColor: Color(0XFFE41C39),
            iconTheme: IconThemeData(color: Colors.white),
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: SvgPicture.asset(
                ImageConstant.arrowback,
                width: 26.75.w,
                height: 17.76.h,
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
                          onChanged:
                              _performSearch, // Call _performSearch method
                          controller: controller.searchController,
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
                                controller.clearSearch();
                                _performSearch('');
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
            child: Column(
              children: [
                SizedBox(height: 16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: _buildPdfFiles(hub1Controller, context),
                ),
                SizedBox(height: 22),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: _buildMp4Files(hub1Controller),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPdfFiles(Hub1Controller hub1Controller, context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'PDF Files',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
            Row(
              children: [
                Text(
                  'Year',
                  style: TextStyle(
                    color: appTheme.black900,
                    fontWeight: FontWeight.w900,
                    fontSize: 12,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
                SizedBox(width: 10),
                Obx(() => Container(
                      width: 80,
                      height: 35,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(2),
                        color: Colors.white,
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: hub1Controller.selectedYear.value,
                          padding: EdgeInsets.only(left: 14),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              hub1Controller.updateSelectedYear(newValue);
                            }
                          },
                          items: hub1Controller.years
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                              ),
                            );
                          }).toList(),
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            size: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Obx(() {
          if (hub1Controller.pdfFiles.isEmpty ||
              // ignore: unnecessary_null_comparison
              hub1Controller.pdfFiles == null) {
            return Center(child: Text("No PDF files available"));
          }
          return SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hub1Controller.pdfFiles.length,
              itemBuilder: (BuildContext context, int index) {
                var file = hub1Controller.pdfFiles[index];
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5 - 15,
                  height: 300,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 2),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(PdfViewerScreen(
                                      pdfUrl: file.pdfFileName,
                                    ));
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 110,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                      border: Border.all(
                                        color: Colors.transparent,
                                        width: 2,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          top: 0,
                                          bottom: 0),
                                      child: Image.network(
                                        file.pdfIcon,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  file.documentName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Row(
                                  children: [
                                    Text(
                                      file.createdDate,
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    const Text(
                                      '|',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      file.docSize,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                // Call a function to open the bottom sheet
                                _openBottomSheet(context, file);
                              },
                              child: Align(
                                alignment: Alignment.topRight,
                                child: SvgPicture.asset(ImageConstant.morevert),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ],
    );
  }

  void _openBottomSheet(BuildContext context, File file) {
    showModalBottomSheet<void>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 250, // Set a fixed height for the bottom sheet
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'AMD EPYC 7002 Processor Vs AMD EPYC 70....',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: SvgPicture.asset(ImageConstant.viewdocument),
                title: Text(
                  'View Document',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0XFFE41C39),
                    fontWeight: FontWeight.w400,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
                onTap: () {
                  // Perform action for Option 1
                  Get.to(ViewDocumentScreen(
                    documentName: '',
                  ));
                },
              ),
              ListTile(
                leading: SvgPicture.asset(ImageConstant.download),
                title: Text(
                  'Download',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
                onTap: () {
                  // Perform action for Option 2
                  //  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: SvgPicture.asset(ImageConstant.properties),
                title: Text(
                  'Properties',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
                onTap: () {
                  // Perform action for Option 3
                  Get.toNamed(AppRoutes.hubproperties, arguments: file.fileId);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMp4Files(Hub1Controller hub1Controller) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'MP4 Files',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Obx(() {
          if (hub1Controller.mp4Files.isEmpty) {
            return Center(child: Text("No MP4 files available"));
          }
          return SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hub1Controller.mp4Files.length,
              itemBuilder: (BuildContext context, int index) {
                var file = hub1Controller.mp4Files[index];
                return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5 - 15,
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 2),
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, right: 10, left: 10),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(VideoPlayerScreen(
                                        videoUrl: file.videoSrc,
                                      ));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 24),
                                      child: Container(
                                        width: double.infinity,
                                        height: 101,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          border: Border.all(
                                            color: Colors.transparent,
                                            width: 2,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(0),
                                          child: Image.network(
                                            file.videoThumbUrl,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    file.documentName,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Colors.black,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Row(
                                    children: [
                                      Text(
                                        file.createdDate,
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        '|',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        file.docSize,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  // Call a function to open the bottom sheet
                                  _openBottomSheets(context, file);
                                },
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child:
                                      SvgPicture.asset(ImageConstant.morevert),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ));
              },
            ),
          );
        }),
      ],
    );
  }

  void _openBottomSheets(BuildContext context, File file) {
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: 250, // Set a fixed height for the bottom sheet
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'AMD EPYC 7002 Processor Vs AMD EPYC 70....',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                leading: SvgPicture.asset(ImageConstant.viewdocument),
                title: Text(
                  'View Document',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0XFFE41C39),
                    fontWeight: FontWeight.w400,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
                onTap: () {
                  // Perform action for Option 1
                  Get.to(ViewDocumentScreen(
                    documentName: '',
                  ));
                },
              ),
              ListTile(
                leading: SvgPicture.asset(ImageConstant.download),
                title: Text(
                  'Download',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
                onTap: () {
                  // Perform action for Option 2
                  //Navigator.pop(context);
                },
              ),
              ListTile(
                leading: SvgPicture.asset(ImageConstant.properties),
                title: Text(
                  'Properties',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
                onTap: () {
                  // Perform action for Option 3
                  Get.toNamed(AppRoutes.hubpropertiesvideo,
                      arguments: file.fileId);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
