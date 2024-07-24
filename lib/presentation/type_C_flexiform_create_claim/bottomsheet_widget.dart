import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/type_C_flexiform_create_claim/controller/create_claim_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class AchievementsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CreateClaimFlexiFormController skuController =
        Get.find(); // Access the controller
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Select SKU",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0XFFE41C39),
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(), // Enable scrolling
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  width: 320.sp,
                  height: 48,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.search),
                            hintText: 'Search',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 8),
                          ),
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 410,
                width: 312,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 120,
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'SKU Name',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                              ),
                            ),
                          ),
                          Text(
                            'Select',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey[400],
                      height: 10,
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics:
                            NeverScrollableScrollPhysics(), // Disable scrolling
                        itemCount: skuController.displayTextList
                            .length, // Use the length of your list
                        itemBuilder: (context, index) {
                          String displayText = skuController.displayTextList[
                              index]; // Get text directly from the list

                          List<String> parts = displayText.split(', ');

                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          displayText,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 1),
                                        child: const Icon(
                                          Icons.info_outline,
                                          color: Colors.grey,
                                          size: 18,
                                        ),
                                      ), // Move the icon here
                                      SizedBox(
                                          width:
                                              8), // Add some spacing between the text and the icon
                                      GestureDetector(
                                        onTap: () {
                                          final CreateClaimFlexiFormController
                                              skuController = Get.find<
                                                  CreateClaimFlexiFormController>();
                                          skuController
                                              .toggleSelectedSKU(displayText);
                                          // Get.back(); // Remove this line if you want to stay on the same screen after selecting SKU
                                        },
                                        child: Container(
                                          width: 90,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.red),
                                          ),
                                          child: Center(
                                            child: Text(
                                              'Select SKU',
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey,
                                                fontFamily:
                                                    GoogleFonts.poppins()
                                                        .fontFamily,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 1,
                                color: Colors.grey[400],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Center(
                child: Text(
                  'Load More ',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
