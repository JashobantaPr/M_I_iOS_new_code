import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/campaign_calculatedpoints_programId/model/dropdown.dart';
import 'package:incentivesgit/presentation/myProfile/primary_profile/controller/primary_profile_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/dialogbox2.dart';

class PrimaryProfileScreen extends GetWidget<PrimaryProfileController> {
  const PrimaryProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  if (controller.isLoading.value)
                    Center(child: CircularProgressIndicator())
                  else
                    Column(
                      children: [
                        _buildBasicDetails(context),
                        _businessHierarchy(),
                        _buildOrganization(),
                        _passwordreset(),
                        _emailpreference(),
                        _submitbuttons(),
                      ],
                    ),
                ],
              ),
            ),
          ),
          controller.isLoading.value
              ? Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : SizedBox.shrink(),
        ],
      );
    });
  }

  Widget _buildBasicDetails(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }
      return Card(
        elevation: 2,
        shape: const ContinuousRectangleBorder(),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  RichText(
                    text: TextSpan(
                      text: 'Status: ',
                      style: TextStyle(
                        color: appTheme.cyan800,
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      children: const [
                        TextSpan(
                          text: 'Active',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Company Name',
                style: TextStyle(
                  color: appTheme.greytextcolour,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              const SizedBox(height: 7),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: appTheme.gray200,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: appTheme.grey500,
                    width: 1.0,
                  ),
                ),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    enabled: false,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: controller.details.first.companyname,
                      hintStyle: TextStyle(
                        color: appTheme.black900,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                        left: 0.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Employee Id',
                style: TextStyle(
                  color: appTheme.greytextcolour,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              const SizedBox(height: 7),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: appTheme.gray200,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: appTheme.grey500,
                    width: 1.0,
                  ),
                ),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: controller.details.first.empoyeeId,
                      hintStyle: TextStyle(
                        color: appTheme.black900,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                        left: 0.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'First Name',
                          style: TextStyle(
                            color: appTheme.gray90001,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                        ),
                        const SizedBox(height: 7),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: appTheme.gray200,
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: appTheme.grey500,
                              width: 1.0,
                            ),
                          ),
                          child: Container(
                            height: 50,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                hintText: controller.details.first.firstName,
                                hintStyle: TextStyle(
                                  color: appTheme.black900,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.only(
                                  left: 0.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Last Name',
                          style: TextStyle(
                            color: appTheme.gray90001,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                        ),
                        const SizedBox(height: 7),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: appTheme.gray200,
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: appTheme.grey500,
                              width: 1.0,
                            ),
                          ),
                          child: Container(
                            height: 50,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                hintText: controller.details.first.lastName,
                                hintStyle: TextStyle(
                                  color: appTheme.black900,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.only(
                                  left: 0.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Email',
                style: TextStyle(
                  color: appTheme.greytextcolour,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              const SizedBox(height: 7),
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  border: Border.all(
                    color: appTheme.grey500,
                    width: 1.0,
                  ),
                ),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: controller.details.first.email,
                      hintStyle: TextStyle(
                        color: appTheme.black900,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      border: InputBorder.none,
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 15.0),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDialog2(
                                  title: 'Change Email Id',
                                  message: 'Enter new email id',
                                  textFieldController:
                                      controller.emailcontroller,
                                  onSubmit: () {
                                    Get.toNamed(AppRoutes.verificationcode);
                                  },
                                );
                              },
                            );
                          },
                          child: Image.asset(
                            ImageConstant.edit,
                            fit: BoxFit.contain,
                            alignment: Alignment.centerRight,
                            width: 12,
                            height: 12,
                          ),
                        ),
                      ),
                      suffixIconConstraints: const BoxConstraints(
                        minHeight: 40,
                        minWidth: 40,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Reporting Manager',
                style: TextStyle(
                  color: appTheme.greytextcolour,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              const SizedBox(height: 7),
              DecoratedBox(
                decoration: BoxDecoration(
                  color: appTheme.gray200,
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: appTheme.grey500,
                    width: 1.0,
                  ),
                ),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    enabled: false,
                    decoration: InputDecoration(
                      hintText: controller.details.first.reportingManager,
                      hintStyle: TextStyle(
                        color: appTheme.black900,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                        left: 0.0,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date Of Birth',
                          style: TextStyle(
                            color: appTheme.greytextcolour,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                        ),
                        const SizedBox(height: 7),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: appTheme.gray200,
                              borderRadius: BorderRadius.circular(5.0),
                              border: Border.all(
                                color: appTheme.grey500,
                                width: 1.0,
                              ),
                            ),
                            child: Container(
                              height: 50,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: TextField(
                                enabled: false,
                                decoration: InputDecoration(
                                  hintText:
                                      controller.details.first.dateOfBirth,
                                  hintStyle: TextStyle(
                                    color: appTheme.black900,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                  ),
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.only(
                                    left: 0.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date Of Joining',
                          style: TextStyle(
                            color: appTheme.greytextcolour,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                        ),
                        const SizedBox(height: 7),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: appTheme.gray200,
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: appTheme.grey500,
                              width: 1.0,
                            ),
                          ),
                          child: Container(
                            height: 50,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                hintText: controller.details.first.dateOfJoin,
                                hintStyle: TextStyle(
                                  color: appTheme.black900,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.only(
                                  left: 0.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Mobile Number',
                style: TextStyle(
                  color: appTheme.greytextcolour,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              const SizedBox(height: 7),
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: appTheme.grey500,
                    width: 1.0,
                  ),
                ),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: controller.details.first.phoneNumber,
                      hintStyle: TextStyle(
                        color: appTheme.black900,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      border: InputBorder.none,
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 15.0),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDialog2(
                                  title: 'Change Mobile Number',
                                  message: 'Enter your new mobile number',
                                  textFieldController:
                                      controller.phonenumbercontroller,
                                  onSubmit: () {
                                    // Get.toNamed(AppRoutes.verificationcode);
                                    controller.onSubmit();

                                  },
                                );
                              },
                            );
                          },
                          child: Image.asset(
                            ImageConstant.edit,
                            fit: BoxFit.contain,
                            alignment: Alignment.centerRight,
                            width: 12,
                            height: 12,
                          ),
                        ),
                      ),
                      suffixIconConstraints: const BoxConstraints(
                        minHeight: 40,
                        minWidth: 40,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Visibility(
                visible: controller.details.first.isEmailMandatory == '1',
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle_rounded,
                      color: Colors.green,
                      size: 15,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text(
                      'Verified',
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: Colors.green,
                          fontStyle: FontStyle.italic),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Country',
                          style: TextStyle(
                            color: appTheme.greytextcolour,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                        ),
                        const SizedBox(height: 7),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: appTheme.white,
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: appTheme.grey500,
                              width: 1.0,
                            ),
                          ),
                          child: CustomDropdown<String?>(
                            items: const ['India', 'France', 'USA', 'Finalnd'],
                            value: null,
                            onChanged: (value) {},
                            getLabel: (String? value) {
                              return '$value';
                            },
                            hintText: controller.details.first.country,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'State',
                          style: TextStyle(
                            color: appTheme.greytextcolour,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                        ),
                        const SizedBox(height: 7),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: appTheme.white,
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: appTheme.grey500,
                              width: 1.0,
                            ),
                          ),
                          child: CustomDropdown<String?>(
                            items: const [
                              'Karnataka',
                              'Maharashtra',
                              'Telangana',
                              'Kerala'
                            ],
                            value: null,
                            onChanged: (value) {},
                            getLabel: (String? value) {
                              return '$value';
                            },
                            hintText: controller.details.first.state,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'City',
                          style: TextStyle(
                            color: appTheme.greytextcolour,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                        ),
                        const SizedBox(height: 7),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: appTheme.white,
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: appTheme.grey500,
                              width: 1.0,
                            ),
                          ),
                          child: CustomDropdown<String?>(
                            items: const [
                              'Hubli',
                              'Hassan',
                              'Mangalore',
                              'Bangalore'
                            ],
                            value: null,
                            onChanged: (value) {},
                            getLabel: (String? value) {
                              return '$value';
                            },
                            hintText: controller.details.first.city,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Document Type',
                          style: TextStyle(
                            color: appTheme.greytextcolour,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                        ),
                        const SizedBox(height: 7),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: appTheme.white,
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: appTheme.grey500,
                              width: 1.0,
                            ),
                          ),
                          child: CustomDropdown<String?>(
                            items: const [
                              'Adhar Card',
                              'Pan Card',
                              'Driving Licecnce',
                              'Voter ID'
                            ],
                            value: null,
                            onChanged: (value) {},
                            getLabel: (String? value) {
                              return '$value';
                            },
                            hintText: controller.details.first.documentName,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Document Number',
                style: TextStyle(
                  color: appTheme.greytextcolour,
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              const SizedBox(height: 7),
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: appTheme.grey500,
                    width: 1.0,
                  ),
                ),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: controller.documentnumbercontroller,
                    cursorColor: appTheme.black600,
                    decoration: InputDecoration(
                      hintText: controller.details.first.documentName,
                      hintStyle: TextStyle(
                        color: appTheme.black900,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                        left: 0.0,
                      ),
                      //   suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.create))
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Document Image',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.greydownarrow),
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: appTheme.grey500,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextField(
                        controller: controller.singlefilecontroller,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 5.0),
                          hintText: 'No file chosen',
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return dialoguebox(context);
                            },
                          );
                        },
                        child: Container(
                          width: 100,
                          height: 48,
                          color: const Color(0XFFE41C39),
                          child: const Center(
                            child: Text(
                              'Choose File',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Attachment should be of .pdf, .png, .jpg, .jpeg file formats Maxmimum size limit : 5MB',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 10.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.greydownarrow),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Address',
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.greydownarrow),
              ),
              SizedBox(
                height: 10.h,
              ),
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: appTheme.grey500,
                    width: 1.0,
                  ),
                ),
                child: Container(
                  height: 76,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    controller: controller.addresscontroller,
                    cursorColor: appTheme.black600,
                    decoration: InputDecoration(
                      hintText: controller.details.first.address,
                      hintStyle: TextStyle(
                        color: appTheme.black900,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(
                        left: 0.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _businessHierarchy() {
    return Obx(
      () => Visibility(
        visible: controller.bussinessData.value == '1',
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 15),
          child: GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.businesshierarchy);
            },
            child: Container(
              height: 60.h,
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: appTheme.grey500,
                  width: 1.0,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Business Hierarchy',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: appTheme.black600),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 25,
                    color: appTheme.greydownarrow,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOrganization() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Role Assignment',
              style: TextStyle(
                color: appTheme.black600,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 7),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: appTheme.gray200,
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Container(
                            height: 50,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                hintText: 'Product',
                                hintStyle: TextStyle(
                                  color: appTheme.black600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.only(
                                  left: 0.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(width: 20),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 7),
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
                            decoration: InputDecoration(
                              hintText: controller.details.first.productname,
                              hintStyle: TextStyle(
                                color: appTheme.black600,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                left: 0.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 7),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: appTheme.gray200,
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Container(
                            height: 50,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                hintText: 'Status',
                                hintStyle: TextStyle(
                                  color: appTheme.black600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.only(
                                  left: 0.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(width: 20),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 7),
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
                          child: Visibility(
                            visible: controller.details.first.status == '1',
                            child: TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                hintText: 'Active',
                                hintStyle: TextStyle(
                                  color: appTheme.black600,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.only(
                                  left: 0.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 7),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: appTheme.gray200,
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Container(
                            height: 50,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                hintText: 'Roles',
                                hintStyle: TextStyle(
                                  color: appTheme.black600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.only(
                                  left: 0.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(width: 20),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 7),
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
                            decoration: InputDecoration(
                              hintText: controller.details.first.rolename,
                              hintStyle: TextStyle(
                                color: appTheme.black600,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                left: 0.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 7),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: appTheme.gray200,
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Container(
                            height: 50,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                hintText: 'Department',
                                hintStyle: TextStyle(
                                  color: appTheme.black600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.only(
                                  left: 0.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(width: 20),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 7),
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
                            decoration: InputDecoration(
                              hintText: controller.details.first.dpName,
                              hintStyle: TextStyle(
                                color: appTheme.black600,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                left: 0.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 7),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: appTheme.gray200,
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Container(
                            height: 50,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                hintText: 'Designation',
                                hintStyle: TextStyle(
                                  color: appTheme.black600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.only(
                                  left: 0.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(width: 20),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 7),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 2),
                          child: TextField(
                            enabled: false,
                            maxLines: 3,
                            decoration: InputDecoration(
                              hintText: controller.details.first.dsName,
                              hintStyle: TextStyle(
                                color: appTheme.black600,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                left: 0.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 7),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: appTheme.gray200,
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Container(
                            height: 50,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextField(
                              enabled: false,
                              decoration: InputDecoration(
                                hintText: 'Scope',
                                hintStyle: TextStyle(
                                  color: appTheme.black600,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.only(
                                  left: 0.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(width: 20),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 7),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(0),
                          border: Border.all(
                            color: appTheme.gray200,
                            width: 1.0,
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: TextField(
                            enabled: false,
                            maxLines: 5,
                            decoration: InputDecoration(
                              hintText: controller.details.first.scopeNames,
                              hintStyle: TextStyle(
                                color: appTheme.black600,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                fontFamily: GoogleFonts.poppins().fontFamily,
                              ),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.only(
                                left: 0.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _passwordreset() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 15),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.passwordreset);
        },
        child: Container(
          height: 60.h,
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: appTheme.grey500,
              width: 1.0,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Password Reset',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.black600),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 25,
                color: appTheme.greydownarrow,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _emailpreference() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 3,
      ),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.emailpreference);
        },
        child: Container(
          height: 60.h,
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: appTheme.grey500,
              width: 1.0,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Email Preferences',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: appTheme.black600),
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 25,
                color: appTheme.greydownarrow,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _submitbuttons() {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(appTheme.white),
                foregroundColor:
                    MaterialStateProperty.all<Color>(appTheme.black600),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(
                    color: appTheme.greydownarrow,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: BorderSide(color: appTheme.grey500)),
                ),
              ),
              child: const Text('Cancel'),
            ),
            const SizedBox(width: 20),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(appTheme.redappbar),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(
                    color: Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
              child: const Text('Save'),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        )
      ],
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

  Widget submitdialoguebox(BuildContext context) {
    return Center(
      child: Container(
        width: 330.sp,
        height: 220,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.red,
                toolbarHeight: 40,
                automaticallyImplyLeading: false,
                title: const Text(
                  'Confirmation',
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
                        child: Image.asset(
                          ImageConstant.cancel,
                          width: 14.93,
                          height: 14.93,
                        )),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 70,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Are you sure you want to submit the claim request?',
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                      color: const Color.fromARGB(255, 5, 4, 4),
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.grey),
                          minimumSize: const Size(120, 60),
                        ),
                        child: const Text(
                          'No',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.red),
                          minimumSize: const Size(120, 60),
                          backgroundColor: Colors.red,
                        ),
                        child: const Text(
                          'Yes',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
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
