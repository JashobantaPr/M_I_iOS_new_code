import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/utils/custom_snackbar.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/campaign_earned_point_viewdetails_screen/controller/campaign_earned_point_viewdetails_controller.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_flexiform_view_details/controller/typeC_flexiform_view_details_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/custom_image_view.dart';

class TypeCViewDetailsScreen extends GetWidget<TypeCViewDetailsController> {
  TypeCViewDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200], // Background color for SafeArea
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: Text(
              "View Details",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Color(0XFFE41C39),
            iconTheme:
                IconThemeData(color: Colors.white), // Set icon color here
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SingleChildScrollView(
            // Wrapping with SingleChildScrollView
            child: Container(
              color: Colors.white, // Background color for body content
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: _buildClaimSubmission(),
                    ),
                    SizedBox(height: 35),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: _buildBasicDetails(),
                    ),
                    SizedBox(height: 35),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: _buildBusinessHierarchy(),
                    ),
                    SizedBox(height: 35),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.h),
                      child: _buildOtherFields(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildClaimSubmission() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 17, // Height of the vertical line
              width: 4, // Width of the vertical line
              color: Color(0xFFE21D39), // Color of the vertical line
              margin: EdgeInsets.only(
                  right: 8), // Margin to separate the line from the text
            ),
            SizedBox(
              child: Text(
                'Claim Submission for',
                style: TextStyle(
                    color: Color(0xFF383853),
                    fontSize: 14,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align to the start (left side)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120, // Adjust the width as needed
              child: Text(
                'Campaign Name',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 13,
                ),
              ),
            ),
            Spacer(), // Adds space between 'Transaction' and ':'
            Text(":"),
            Spacer(), // Adds space between ':' and 'Credit'
            SizedBox(
              width: 178, // Adjust the width as needed
              child: Text(
                'Innovation',
                style: TextStyle(
                    color: Color(0xFF383853),
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
              child: Text(
                'Requested By',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 13,
                ),
              ),
            ),
            Spacer(),
            Text(":"),
            Spacer(),
            SizedBox(
              width: 30, // Adjust the size of CircleAvatar as needed
              height: 30, // Adjust the size of CircleAvatar as needed
              child: ClipOval(
                child: Image.asset(
                  ImageConstant.buzzes,
                  width: 30,
                  height: 30,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
                width: 8), // Add some spacing between CircleAvatar and Text
            SizedBox(
              width: 140,
              child: Transform.translate(
                offset: Offset(0, 5), // Adjust the Y offset as needed
                child: Text(
                  'Chetana Shelar',
                  style: TextStyle(
                    color: Color(0xFF383853),
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align to the start (left side)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120, // Adjust the width as needed
              child: Text(
                'Requested By',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 13,
                ),
              ),
            ),
            Spacer(), // Adds space between 'Transaction' and ':'
            Text(":"),
            Spacer(), // Adds space between ':' and 'Credit'
            SizedBox(
              width: 180, // Adjust the width as needed
              child: Text(
                'Type C : Claim Approval',
                style: TextStyle(
                    color: Color(0xFF383853),
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align to the start (left side)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120, // Adjust the width as needed
              child: Text(
                'Date of request',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 13,
                ),
              ),
            ),
            Spacer(), // Adds space between 'Transaction' and ':'
            Text(":"),
            Spacer(), // Adds space between ':' and 'Credit'
            SizedBox(
              width: 180, // Adjust the width as needed
              child: Text(
                '15-10-2323',
                style: TextStyle(
                    color: Color(0xFF383853),
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align to the start (left side)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120, // Adjust the width as needed
              child: Text(
                'Status',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 13,
                ),
              ),
            ),
            Spacer(), // Adds space between 'Transaction' and ':'
            Text(":"),
            Spacer(), // Adds space between ':' and 'Credit'
            SizedBox(
              width: 180, // Adjust the width as needed
              child: Text(
                'Approved',
                style: TextStyle(
                    color: Color(0xFF383853),
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBasicDetails() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 17, // Height of the vertical line
              width: 4, // Width of the vertical line
              color: Color(0xFFE21D39), // Color of the vertical line
              margin: EdgeInsets.only(
                  right: 8), // Margin to separate the line from the text
            ),
            SizedBox(
              child: Text(
                'Basic Details',
                style: TextStyle(
                    color: Color(0xFF383853),
                    fontSize: 14,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align to the start (left side)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120, // Adjust the width as needed
              child: Text(
                'Claim Id',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 13,
                ),
              ),
            ),
            Spacer(), // Adds space between 'Transaction' and ':'
            Text(":"),
            Spacer(), // Adds space between ':' and 'Credit'
            SizedBox(
              width: 178, // Adjust the width as needed
              child: Text(
                'CL10201001',
                style: TextStyle(
                    color: Color(0xFF383853),
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align to the start (left side)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120, // Adjust the width as needed
              child: Text(
                'Submission Date',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 13,
                ),
              ),
            ),
            Spacer(), // Adds space between 'Transaction' and ':'
            Text(":"),
            Spacer(), // Adds space between ':' and 'Credit'
            SizedBox(
              width: 178, // Adjust the width as needed
              child: Text(
                '15-09-2023',
                style: TextStyle(
                    color: Color(0xFF383853),
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align to the start (left side)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120, // Adjust the width as needed
              child: Text(
                'SKU Details',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 13,
                ),
              ),
            ),
            Spacer(), // Adds space between 'Transaction' and ':'
            Text(":"),
            Spacer(), // Adds space between ':' and 'Credit'
            SizedBox(
              width: 180, // Adjust the width as needed
              child: Text(
                'SKU Code - Windows 7, SKU Size - 1.00 km, SKU Weight- 10.00 g, SKU Volume- 10.01 mm3, SKU Cost- 1000, SKU Description -',
                style: TextStyle(
                    color: Color(0xFF383853),
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align to the start (left side)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120, // Adjust the width as needed
              child: Text(
                'Quantity',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 13,
                ),
              ),
            ),
            Spacer(), // Adds space between 'Transaction' and ':'
            Text(":"),
            Spacer(), // Adds space between ':' and 'Credit'
            SizedBox(
              width: 180, // Adjust the width as needed
              child: Text(
                '5',
                style: TextStyle(
                    color: Color(0xFF383853),
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align to the start (left side)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120, // Adjust the width as needed
              child: Text(
                'Points',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 13,
                ),
              ),
            ),
            Spacer(), // Adds space between 'Transaction' and ':'
            Text(":"),
            Spacer(), // Adds space between ':' and 'Credit'
            SizedBox(
              width: 180, // Adjust the width as needed
              child: Text(
                '500',
                style: TextStyle(
                    color: Color(0xFF383853),
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align to the start (left side)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120, // Adjust the width as needed
              child: Text(
                'Invoice Id',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 13,
                ),
              ),
            ),
            Spacer(), // Adds space between 'Transaction' and ':'
            Text(":"),
            Spacer(), // Adds space between ':' and 'Credit'
            SizedBox(
              width: 180, // Adjust the width as needed
              child: Text(
                'AL001204',
                style: TextStyle(
                    color: Color(0xFF383853),
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align to the start (left side)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120, // Adjust the width as needed
              child: Text(
                'Claim Proof​(Invoice Copy)',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 13,
                ),
              ),
            ),
            Spacer(), // Adds space between 'Transaction' and ':'
            Text(":"),
            Spacer(), // Adds space between ':' and 'Credit'
            SizedBox(
              width: 180, // Adjust the width as needed
              child: Text(
                'View Invoice Copy',
                style: TextStyle(
                    color: Color(0xFF0000EE),
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBusinessHierarchy() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Text(
                'Business Hierarchy',
                style: TextStyle(
                    color: Color(0xFF383853),
                    fontSize: 14,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Divider(
          // Divider added here
          color: Colors.grey,
          thickness: 1,
          height: 20,
          indent: 0,
          endIndent: 0,
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align to the start (left side)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120, // Adjust the width as needed
              child: Text(
                'Country',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 13,
                ),
              ),
            ),
            Spacer(), // Adds space between 'Transaction' and ':'
            Text(":"),
            Spacer(), // Adds space between ':' and 'Credit'
            SizedBox(
              width: 178, // Adjust the width as needed
              child: Text(
                'India',
                style: TextStyle(
                    color: Color(0xFF383853),
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align to the start (left side)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120, // Adjust the width as needed
              child: Text(
                'State',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 13,
                ),
              ),
            ),
            Spacer(), // Adds space between 'Transaction' and ':'
            Text(":"),
            Spacer(), // Adds space between ':' and 'Credit'
            SizedBox(
              width: 178, // Adjust the width as needed
              child: Text(
                'Maharashtra',
                style: TextStyle(
                    color: Color(0xFF383853),
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align to the start (left side)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120, // Adjust the width as needed
              child: Text(
                'Mumbai',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 13,
                ),
              ),
            ),
            Spacer(), // Adds space between 'Transaction' and ':'
            Text(":"),
            Spacer(), // Adds space between ':' and 'Credit'
            SizedBox(
              width: 178, // Adjust the width as needed
              child: Text(
                'Thane',
                style: TextStyle(
                    color: Color(0xFF383853),
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOtherFields() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 17, // Height of the vertical line
              width: 4, // Width of the vertical line
              color: Color(0xFFE21D39), // Color of the vertical line
              margin: EdgeInsets.only(
                  right: 8), // Margin to separate the line from the text
            ),
            SizedBox(
              child: Text(
                'Other Fields',
                style: TextStyle(
                    color: Color(0xFF383853),
                    fontSize: 14,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align to the start (left side)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120, // Adjust the width as needed
              child: Text(
                'Name',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 13,
                ),
              ),
            ),
            Spacer(), // Adds space between 'Transaction' and ':'
            Text(":"),
            Spacer(), // Adds space between ':' and 'Credit'
            SizedBox(
              width: 178, // Adjust the width as needed
              child: Text(
                'Chetana Shelar',
                style: TextStyle(
                    color: Color(0xFF383853),
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align to the start (left side)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120, // Adjust the width as needed
              child: Text(
                'Date',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 13,
                ),
              ),
            ),
            Spacer(), // Adds space between 'Transaction' and ':'
            Text(":"),
            Spacer(), // Adds space between ':' and 'Credit'
            SizedBox(
              width: 178, // Adjust the width as needed
              child: Text(
                '10-1-2024',
                style: TextStyle(
                    color: Color(0xFF383853),
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align to the start (left side)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120, // Adjust the width as needed
              child: Text(
                'Select Purchased Product',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 13,
                ),
              ),
            ),
            Spacer(), // Adds space between 'Transaction' and ':'
            Text(":"),
            Spacer(), // Adds space between ':' and 'Credit'
            SizedBox(
              width: 180, // Adjust the width as needed
              child: Text(
                'Tata nexon, Tata Harrier, Tata nexon , Tata Harrier',
                style: TextStyle(
                    color: Color(0xFF383853),
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13),
              ),
            ),
          ],
        ),
         SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align to the start (left side)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120, // Adjust the width as needed
              child: Text(
                'Attachment',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 13,
                ),
              ),
            ),
            Spacer(), // Adds space between 'Transaction' and ':'
            Text(":"),
            Spacer(), // Adds space between ':' and 'Credit'
            SizedBox(
              width: 180, // Adjust the width as needed
              child: Text(
                'View Attachment',
                style: TextStyle(
                    color: Color(0xFF0000EE),
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13),
              ),
            ),
          ],
        ),
         SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
