import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_KpiSku_createclaim_management/controller/typeC_KpiSku_createclaim_management_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class TypeCKpiSkuCreateClaimScreen
    extends GetWidget<TypeCKpiSkuCreateClaimController> {
  const TypeCKpiSkuCreateClaimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TypeCKpiSkuCreateClaimController controller =
        Get.put(TypeCKpiSkuCreateClaimController());
    TextEditingController dateTextController = TextEditingController();

    return ScreenUtilInit(
      child: SafeArea(
        top: true,
        bottom: true,
        child: Scaffold(
          backgroundColor: appTheme.grey,
          appBar: _customAppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: _buildInvoice(),
                  ),
                  SizedBox(height: 4),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: _buildTextFieldInvoice(),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: _buildHondaInvoice(),
                  ),
                  SizedBox(height: 2),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: _buildTextFieldHondaInvoice(),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: _buildTotalInvoice(),
                  ),
                  SizedBox(height: 4),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: _buildTextFieldTotalInvoice(),
                  ),
                  SizedBox(height: 17),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: _buildAttach(),
                  ),
                  SizedBox(height: 4),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: _buildTextFieldAttach(),
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: _buildBusinessHierarchy(),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: _buildCountry(),
                  ),
                  SizedBox(height: 2),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: _buildTextFieldCountry(),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: _buildState(),
                  ),
                  SizedBox(height: 2),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: _buildTextFieldState(),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: _buildCity(),
                  ),
                  SizedBox(height: 2),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: _buildTextFieldCity(),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: _buildStore(),
                  ),
                  SizedBox(height: 2),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: _buildTextFieldStore(),
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: _buildOtherFields(),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: _buildBreaker(controller),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: _buildDate(),
                  ),
                  SizedBox(height: 2),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: _buildTextFieldDate(
                        context, dateTextController, controller),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: _buildMultipleFile(),
                  ),
                  SizedBox(height: 2),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: _buildTextFieldMultipleFile(),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: _buildNumber(),
                  ),
                  SizedBox(height: 2),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: _buildTextFieldNumber(),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: _buildRadioGroup(),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22),
                    child: _buildRadioGroupButton(),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: _buildLosses(),
                  ),
                  SizedBox(height: 2),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: _buildTextFieldSelect(),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: _buildHello(),
                  ),
                  SizedBox(height: 2),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: _buildTextFieldName(),
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: _buildDescription(),
                  ),
                  SizedBox(height: 2),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: _buildTextFieldDescription(),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: _buildButtons(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _customAppBar() {
    return AppBar(
      backgroundColor: appTheme.redappbar,
      automaticallyImplyLeading: true,
      leading: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: IconButton(
          onPressed: () => Get.back(),
          icon: SvgPicture.asset(
            ImageConstant.arrowback,
            width: 26.75.w,
            height: 19.76.h,
          ),
        ),
      ),
      title: Text(
        'Create Claim',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontWeight: FontWeight.normal,
          fontSize: 18.sp,
          color: appTheme.white,
        ),
      ),
    );
  }

  Widget _buildInvoice() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0), // Add padding at the bottom
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 3,
                height: 17,
                color: appTheme.rediconbackground,
                margin: EdgeInsets.only(right: 6),
              ),
              Text(
                'Basic Details',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: appTheme.cyan800,
                ),
              ),
            ],
          ),
          SizedBox(height: 10), // Add some space between the texts
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Select the SKU',
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: appTheme.greytextcolour,
                    ),
                  ),
                  Text(
                    '*',
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              Expanded(child: Container()),
              Text(
                'Select',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: appTheme.blue50,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextFieldInvoice() {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 5.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey, // Adjust the color as needed
            width: 1.0, // Adjust the width as needed
          ),
          borderRadius:
              BorderRadius.circular(5.0), // Adjust the radius as needed
        ),
        child: TextField(
          decoration: InputDecoration(
            // hintText: 'Enter',
            border: InputBorder.none, // Hide the default border of TextField
            contentPadding: EdgeInsets.only(
                left: 5.0), // Adjust the left padding of hint text
          ),
        ),
      ),
    );
  }

  Widget _buildHondaInvoice() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Honda Invoice Number',
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: appTheme.greytextcolour,
                    ),
                  ),
                  Text(
                    '*',
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              Expanded(child: Container()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextFieldHondaInvoice() {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 5.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey, // Adjust the color as needed
            width: 1.0, // Adjust the width as needed
          ),
          borderRadius:
              BorderRadius.circular(5.0), // Adjust the radius as needed
        ),
        child: TextField(
          decoration: InputDecoration(
            // hintText: 'Enter',
            border: InputBorder.none, // Hide the default border of TextField
            contentPadding: EdgeInsets.only(
                left: 5.0), // Adjust the left padding of hint text
          ),
        ),
      ),
    );
  }

  Widget _buildTotalInvoice() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Honda Qualityof Incentive Claim',
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: appTheme.greytextcolour,
                    ),
                  ),
                  Text(
                    '*',
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.red, // Color of the *
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextFieldTotalInvoice() {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey, // Adjust the color as needed
                width: 1.0, // Adjust the width as needed
              ),
              borderRadius:
                  BorderRadius.circular(5.0), // Adjust the radius as needed
            ),
            child: TextField(
              decoration: InputDecoration(
                // hintText: 'Enter',
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 5.0),
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            '(Points: 0)',
            style: TextStyle(
              color: appTheme.greytextcolour,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttach() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Attach the claim Proof (Invoice Copy)',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: appTheme.greytextcolour,
                  ),
                ),
                Text(
                  '*',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.red, // Color of the *
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTextFieldAttach() {
    final TypeCKpiSkuCreateClaimController controller =
        Get.put(TypeCKpiSkuCreateClaimController());

    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0, top: 5.0),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align children to the start
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey, // Adjust the color as needed
                width: 1.0, // Adjust the width as needed
              ),
              borderRadius:
                  BorderRadius.circular(5.0), // Adjust the radius as needed
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Align items to the edges
              children: [
                Expanded(
                  flex: 3,
                  child: TextField(
                    controller: controller.otpController,
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
                    onTap:
                        controller.chooseFile, // Call chooseFile method on tap
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
          const SizedBox(
              height:
                  8.0), // Add some spacing between the TextField and the text
          Text(
            'Attachment should be of .png .ipj .jpeg file formats \n Maximum size limit : 5MB',
            style: TextStyle(
              fontSize: 12.0,
              color: appTheme.greytextcolour,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBusinessHierarchy() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Business Hierarchy',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.poppins().fontFamily,
            color: appTheme.cyan800,
          ),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: Divider(
                // Add the horizontal line
                color: Colors.grey,
                thickness: 1,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCountry() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Country ',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: appTheme.greytextcolour,
                  ),
                ),
                Text(
                  '*',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.red, // Color of the *
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTextFieldCountry() {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0, top: 5.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey, // Adjust the color as needed
            width: 1.0, // Adjust the width as needed
          ),
          borderRadius:
              BorderRadius.circular(5.0), // Adjust the radius as needed
        ),
        child: const Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Select',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    left: 5.0,
                  ),
                ),
              ),
            ),
            Icon(Icons.keyboard_arrow_down_outlined), // Drop-down arrow icon
          ],
        ),
      ),
    );
  }

  Widget _buildState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10), // Add some space between the texts
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'State ',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade700,
                  ),
                ),
                Text(
                  '*',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.red, // Color of the *
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTextFieldState() {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0, top: 5.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey, // Adjust the color as needed
            width: 1.0, // Adjust the width as needed
          ),
          borderRadius:
              BorderRadius.circular(5.0), // Adjust the radius as needed
        ),
        child: const Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Select',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    left: 5.0,
                  ),
                ),
              ),
            ),
            Icon(Icons.keyboard_arrow_down_outlined), // Drop-down arrow icon
          ],
        ),
      ),
    );
  }

  Widget _buildCity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10), // Add some space between the texts
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'City ',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade700,
                  ),
                ),
                Text(
                  '*',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.red, // Color of the *
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTextFieldCity() {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0, top: 5.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey, // Adjust the color as needed
            width: 1.0, // Adjust the width as needed
          ),
          borderRadius:
              BorderRadius.circular(5.0), // Adjust the radius as needed
        ),
        child: const Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Select',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    left: 5.0,
                  ),
                ),
              ),
            ),
            Icon(Icons.keyboard_arrow_down_outlined), // Drop-down arrow icon
          ],
        ),
      ),
    );
  }

  Widget _buildStore() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10), // Add some space between the texts
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Store ',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade700,
                  ),
                ),
                Text(
                  '*',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.red, // Color of the *
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTextFieldStore() {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0, top: 5.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey, // Adjust the color as needed
            width: 1.0, // Adjust the width as needed
          ),
          borderRadius:
              BorderRadius.circular(5.0), // Adjust the radius as needed
        ),
        child: const Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Select',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    left: 5.0,
                  ),
                ),
              ),
            ),
            Icon(Icons.keyboard_arrow_down_outlined), // Drop-down arrow icon
          ],
        ),
      ),
    );
  }

  Widget _buildOtherFields() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0), // Add padding at the bottom
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 3,
                height: 17,
                color: appTheme.rediconbackground,
                margin: EdgeInsets.only(right: 6),
              ),
              Text(
                'Other Fields',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: appTheme.cyan800,
                ),
              ),
            ],
          ),
          SizedBox(height: 10), // Add some space between the texts
        ],
      ),
    );
  }

  Widget _buildBreaker(TypeCKpiSkuCreateClaimController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Stock Market',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.poppins().fontFamily,
            color: appTheme.cyan800,
          ),
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: Divider(
                // Add the horizontal line
                color: Colors.grey,
                thickness: 1,
              ),
            ),
          ],
        ),
        SizedBox(height: 13),
        Row(
          children: [
            Text(
              'Stock you want to buy',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.grey.shade700,
              ),
            ),
            Text(
              '*',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.red, // Color of the *
              ),
            ),
          ],
        ),
        SizedBox(height: 10), // Adjust as needed
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0),
          child: buildCheckboxRow(controller, 1, 'Hello'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0),
          child: buildCheckboxRow(controller, 2, 'Adani'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0),
          child: buildCheckboxRow(controller, 3, 'Tata'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: .0),
          child: buildCheckboxRow(controller, 4, 'Reliance'),
        ),
      ],
    );
  }

  Widget buildCheckboxRow(TypeCKpiSkuCreateClaimController controller,
      int checkboxIndex, String label) {
    return Row(
      children: [
        Obx(() {
          bool isChecked;
          switch (checkboxIndex) {
            case 1:
              isChecked = controller.checkbox1.value;
              break;
            case 2:
              isChecked = controller.checkbox2.value;
              break;
            case 3:
              isChecked = controller.checkbox3.value;
              break;
            case 4:
              isChecked = controller.checkbox4.value;
              break;
            default:
              isChecked = false;
          }

          return Theme(
            data: ThemeData(
              checkboxTheme: CheckboxThemeData(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                fillColor: MaterialStateProperty.all(Colors.white),
                checkColor: MaterialStateProperty.all(Colors.black),
                side: MaterialStateBorderSide.resolveWith(
                  (states) => BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            child: Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                if (value != null) {
                  controller.toggleCheckbox(checkboxIndex, value);
                }
              },
            ),
          );
        }),
        Text(
          label,
          style: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontSize: 14,
            fontWeight: FontWeight.normal,
            color: Colors.black, // Adjust as needed
          ),
        ),
      ],
    );
  }

  Widget _buildDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10), // Add some space between the texts
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Date Field ',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade700,
                  ),
                ),
                Text(
                  '*',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.red, // Color of the *
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTextFieldDate(
      BuildContext context,
      TextEditingController dateController,
      TypeCKpiSkuCreateClaimController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0, top: 5.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey, // Adjust the color as needed
            width: 1.0, // Adjust the width as needed
          ),
          borderRadius:
              BorderRadius.circular(5.0), // Adjust the radius as needed
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: dateController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    left: 5.0,
                  ),
                ),
                readOnly: true, // Prevent keyboard from showing
                onTap: () {
                  controller.selectDate(context,
                      dateController); // Call method to show date picker
                },
              ),
            ),
            InkWell(
              onTap: () {
                controller.selectDate(
                    context, dateController); // Call method to show date picker
              },
              child: Icon(Icons.calendar_month), // Calendar icon
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMultipleFile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10), // Add some space between the texts
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Multiple File Upload ',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade700,
                  ),
                ),
                Text(
                  '*',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.red, // Color of the *
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTextFieldMultipleFile() {
    final TypeCKpiSkuCreateClaimController controller =
        Get.put(TypeCKpiSkuCreateClaimController());

    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0, top: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey, // Adjust the color as needed
            width: 1.0, // Adjust the width as needed
          ),
          borderRadius:
              BorderRadius.circular(5.0), // Adjust the radius as needed
        ),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // Align items to the edges
          children: [
            Expanded(
              flex: 3,
              child: TextField(
                controller: controller.otpController,
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
                onTap: controller.chooseFile, // Call chooseFile method on tap
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
    );
  }

  Widget _buildNumber() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Number ',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade700,
                  ),
                ),
                Text(
                  '*',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.red, // Color of the *
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTextFieldNumber() {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 5.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey, // Adjust the color as needed
            width: 1.0, // Adjust the width as needed
          ),
          borderRadius:
              BorderRadius.circular(5.0), // Adjust the radius as needed
        ),
        child: TextField(
          decoration: InputDecoration(
            // hintText: 'Enter',
            border: InputBorder.none, // Hide the default border of TextField
            contentPadding: EdgeInsets.only(
                left: 5.0), // Adjust the left padding of hint text
          ),
        ),
      ),
    );
  }

 Widget _buildRadioGroup() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Share market teachers',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade700,
                  ),
                ),
                Text(
                  '*',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.red, // Color of the *
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRadioGroupButton() {
    return Column(
      children: [
        buildRadio(1, 'Option 1'),
        buildRadio(2, 'Option 2'),
        buildRadio(3, 'Option 3'),
      ],
    );
  }

  Widget buildRadio(int value, String labelText) {
    return Obx(() => Row(
          children: [
            Theme(
              data: ThemeData(
                unselectedWidgetColor: Colors.grey,
              ),
              child: Radio(
                value: value,
                groupValue: controller.radioButtonValue.value,
                onChanged: (int? newValue) {
                  controller.handleRadioValueChanged(newValue!);
                },
                activeColor: appTheme.rediconbackground,
              ),
            ),
            Text(
              labelText,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: appTheme.greytextcolour,
              ),
            ),
          ],
        ));
  }

 Widget _buildLosses() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Losses ',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade700,
                  ),
                ),
                Text(
                  '*',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.red, // Color of the *
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTextFieldSelect() {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 5.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey, // Adjust the color as needed
            width: 1.0, // Adjust the width as needed
          ),
          borderRadius:
              BorderRadius.circular(5.0), // Adjust the radius as needed
        ),
        child: TextField(
          decoration: InputDecoration(
            // hintText: 'Enter',
            border: InputBorder.none, // Hide the default border of TextField
            contentPadding: EdgeInsets.only(
                left: 5.0), // Adjust the left padding of hint text
          ),
        ),
      ),
    );
  }

  Widget _buildHello() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Hello ',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade700,
                  ),
                ),
                Text(
                  '*',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.red, // Color of the *
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTextFieldName() {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 5.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey, // Adjust the color as needed
            width: 1.0, // Adjust the width as needed
          ),
          borderRadius:
              BorderRadius.circular(5.0), // Adjust the radius as needed
        ),
        child: TextField(
          decoration: InputDecoration(
            // hintText: 'Enter',
            border: InputBorder.none, // Hide the default border of TextField
            contentPadding: EdgeInsets.only(
                left: 5.0), // Adjust the left padding of hint text
          ),
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Description ',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade700,
                  ),
                ),
                Text(
                  '*',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.red, // Color of the *
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTextFieldDescription() {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0, right: 0.0, top: 5.0),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey, // Adjust the color as needed
              width: 1.0, // Adjust the width as needed
            ),
            borderRadius:
                BorderRadius.circular(5.0), // Adjust the radius as needed
          ),
          child: Container(
            height: 100, // Set the desired height
            child: const TextField(
              maxLines: null, // Enable multiline input
              decoration: InputDecoration(
                // hintText: 'Enter',
                border:
                    InputBorder.none, // Hide the default border of TextField
                contentPadding: EdgeInsets.only(
                    left: 5.0), // Adjust the left padding of hint text
              ),
            ),
          )),
    );
  }

  Widget _buildButtons() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Container(
            width: 98,
            height: 48,
            decoration: BoxDecoration(
              color: appTheme.rediconbackground,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          width: 170,
          height: 48,
          decoration: BoxDecoration(
            color: appTheme.rediconbackground,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              'Send for Approval',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
