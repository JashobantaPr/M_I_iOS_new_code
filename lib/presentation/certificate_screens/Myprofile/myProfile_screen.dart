import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/certificate_screens/Myprofile/controller/myprofile_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class MyProfileeScreen extends GetWidget<MyProfileController> {
  MyProfileeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.grey,
      appBar: AppBar(
        title: Obx(
          () => Text(
            "User profile of ${controller.myProfile.value?.userdata?.first?.firstName ?? ''}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
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
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 200,
                color: Color(0XFFE41C39),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.transparent,
                      backgroundImage: CachedNetworkImageProvider(
                        controller.myProfile.value?.userdata[0].docImg ?? '',
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: _buildBasicDetails(),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: _buildOrganization(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBasicDetails() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Basic Details',
              style: TextStyle(
                color: appTheme.cyan800,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
            SizedBox(height: 10),
            _buildTextField('Company Name',
                controller.myProfile.value?.userdata?.first?.companyName),
            SizedBox(height: 20),
            _buildTextField('Employee Id',
                controller.myProfile.value?.userdata?.first?.employeeId),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTextField(
                          'First Name',
                          controller
                              .myProfile.value?.userdata?.first?.firstName),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTextField(
                          'Last Name',
                          controller
                              .myProfile.value?.userdata?.first?.lastName),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            _buildTextField(
                'Email', controller.myProfile.value?.userdata?.first?.email),
            SizedBox(height: 20),
            _buildTextField('Reporting Manager',
                controller.myProfile.value?.userdata?.first?.reportingManager),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTextField(
                          'Date Of Birth',
                          controller
                              .myProfile.value?.userdata?.first?.dateOfBirth),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTextField(
                          'Date Of Joining',
                          controller
                              .myProfile.value?.userdata?.first?.dateOfJoin),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            _buildTextField('Country',
                controller.myProfile.value?.userdata?.first?.country),
            SizedBox(height: 20),
            _buildTextField(
                'State', controller.myProfile.value?.userdata?.first?.state),
            SizedBox(height: 20),
            _buildTextField(
                'City', controller.myProfile.value?.userdata?.first?.city),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String? hintText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: appTheme.gray90001,
            fontWeight: FontWeight.w500,
            fontSize: 12,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
        SizedBox(height: 7),
        DecoratedBox(
          decoration: BoxDecoration(
            color: appTheme.gray200,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
          ),
          child: Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              enabled: false,
              decoration: InputDecoration(
                hintText: hintText ?? '',
                hintStyle: TextStyle(
                  color: appTheme.black900,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 0.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOrganization() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildField(
                controller.myProfile.value?.userdata?.first?.dpName ?? '',
                hint: 'Department'),
            _buildField(
                controller.myProfile.value?.userdata?.first?.designationIdFk ??
                    '',
                hint: 'Designation'),
            _buildField(
                controller.myProfile.value?.userdata?.first?.scopeNames ?? '',
                hint: 'Scope'),
          ],
        ),
      ),
    );
  }

  Widget _buildField(String value, {String hint = ''}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 7),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: appTheme.gray200,
                  borderRadius: BorderRadius.circular(0),
                ),
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: hint,
                      hintStyle: TextStyle(
                        color: appTheme.black600,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 0.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 7),
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  border: Border.all(
                    color: appTheme.gray200,
                    width: 1.0,
                  ),
                ),
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    enabled: false,
                    maxLines: null, // Allow TextField to expand vertically
                    controller: TextEditingController(text: value),
                    decoration: InputDecoration(
                      hintText:
                          '', // Optional: Use text directly from controller
                      hintStyle: TextStyle(
                        color: appTheme.black600,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 0.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
