import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/custom_snackbar.dart';
import 'package:incentivesgit/presentation/type_C_flexiform_create_claim/bottomsheet_widget.dart';
import 'package:incentivesgit/presentation/type_C_flexiform_create_claim/controller/create_claim_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/custom_image_view.dart';

class TypeCFlexiCreateClaimScreen
    extends GetWidget<CreateClaimFlexiFormController> {
  TypeCFlexiCreateClaimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black, // Background color for the whole screen
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: const Text(
              "Create Claim",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: const Color(0XFFE41C39),
            iconTheme:
                const IconThemeData(color: Colors.white), // Set icon color here
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              color: Colors.white, // Set the color for the SafeArea view
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildSKU(context),
                  ),
                  _buildTextFieldSKU(context),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildInvoice(),
                  ),
                  _buildTextFieldInvoice(),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildIncentiveClaim(),
                  ),
                  _buildTextFieldInvoice(),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildAttach(),
                  ),
                  _buildTextFieldAttach(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildFormat(),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildCountry(),
                  ),
                  _buildTextFieldCountry(),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildState(),
                  ),
                  _buildTextFieldState(),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildCity(),
                  ),
                  _buildTextFieldCity(),
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildName(),
                  ),
                  _buildTextFieldName(),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildDate(),
                  ),
                  _buildTextFieldDate(),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildSelectPurchasedProduct(),
                  ),
                  _buildTextFieldSelectPurchasedProduct(),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildAttachh(),
                  ),
                  _buildTextFieldAttachh(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildFormatt(),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildButton(),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildFormattt(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSKU(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Basic Details',
          style: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10), // Add some space between the texts
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Select the SKU ',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
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
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 200,
                      child: const Center(
                        child: Text("This is a bottom sheet"),
                      ),
                    );
                  },
                );
              },
              child: Text(
                '',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF000EEE),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return AchievementsContent(); // Use the separate widget here
                  },
                );
              },
              child: Text(
                'Select',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF000EEE),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildTextFieldSKU(BuildContext context) {
    final CreateClaimFlexiFormController skuController = Get.find();

    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: TextField(
            controller: TextEditingController(
                text: skuController.selectedSKUs.join('\n')),
            maxLines: null, // Allow multiple lines
            readOnly: true, // Make TextField read-only
            decoration: const InputDecoration(
              hintText: 'Select',
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 5.0),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildInvoice() {
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
                  'Enter the Invoice number ',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
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

  Widget _buildTextFieldInvoice() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
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
        child: const TextField(
          decoration: InputDecoration(
            hintText: 'Enter',
            border: InputBorder.none, // Hide the default border of TextField
            contentPadding: EdgeInsets.only(
                left: 5.0), // Adjust the left padding of hint text
          ),
        ),
      ),
    );
  }

  Widget _buildIncentiveClaim() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Enter the quantity of incentive claim ',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
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

  Widget _buildTextFieldIncentive() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
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
        child: const TextField(
          decoration: InputDecoration(
            hintText: 'Enter',
            border: InputBorder.none, // Hide the default border of TextField
            contentPadding: EdgeInsets.only(
                left: 5.0), // Adjust the left padding of hint text
          ),
        ),
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
                  'Attach the claim Proof (Invoice Copy) ',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
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

  Widget _buildTextFieldAttach() {
    final CreateClaimFlexiFormController controller =
        Get.put(CreateClaimFlexiFormController());

    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
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

  Widget _buildFormat() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10), // Add some space between the texts
        Column(
          children: [
            Text(
              'Attachment should be of .pdf, .png, .jpg, .jpeg file formats \n maximum size limit : 5MB',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Business Hierarchy',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 47, 109, 242),
          ),
        ),
        const SizedBox(
            height: 20), // Add space between text and horizontal line
        const Divider(
          // Add the horizontal line
          color: Colors.grey, // You can adjust the color as needed
          thickness: 1, // You can adjust the thickness as needed
        ),
      ],
    );
  }

  Widget _buildCountry() {
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
                  'country ',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
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

  Widget _buildTextFieldCountry() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
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
                    fontWeight: FontWeight.w400,
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
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
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
                    fontWeight: FontWeight.w400,
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
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
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

  Widget _buildName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Other Fields',
          style: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10), // Add some space between the texts
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Name ',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
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
            Text(
              '',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF000EEE),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTextFieldName() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          // color: Colors.grey.shade300,
          border: Border.all(
            color: Colors.grey, // Adjust the color as needed
            width: 1.0, // Adjust the width as needed
          ),
          borderRadius:
              BorderRadius.circular(5.0), // Adjust the radius as needed
        ),
        child: const TextField(
          decoration: InputDecoration(
            hintText: 'Select',
            border: InputBorder.none, // Hide the default border of TextField
            contentPadding: EdgeInsets.only(
                left: 5.0), // Adjust the left padding of hint text
          ),
        ),
      ),
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
                  'Date ',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
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

  Widget _buildTextFieldDate() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
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
            Icon(Icons.calendar_month_outlined), 
          ],
        ),
      ),
    );
  }

  Widget _buildSelectPurchasedProduct() {
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
                  'Select Purchased Product* ',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
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

  Widget _buildTextFieldSelectPurchasedProduct() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
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
                  hintText: 'Enter',
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

  Widget _buildAttachh() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Attach the claim Proof (Invoice Copy) ',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
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

  Widget _buildTextFieldAttachh() {
    final CreateClaimFlexiFormController controller =
        Get.put(CreateClaimFlexiFormController());

    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
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

  Widget _buildFormatt() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //  SizedBox(height: 10), // Add some space between the texts
        Column(
          children: [
            Text(
              '',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
        
        const Text(
          '',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 47, 109, 242),
          ),
        ),
        const SizedBox(
            height: 10), // Add space between text and horizontal line
        const Divider(
          // Add the horizontal line
          color: Colors.grey, // You can adjust the color as needed
          thickness: 1, // You can adjust the thickness as needed
        ),
      ],
    );
  }

  Widget _buildButton() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Container(
            width: 98,
            height: 48,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8)),
            child: Center(
                child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            )),
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Container(
            width: 98,
            height: 48,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8)),
            child: const Center(
              child: Text(
                'Submit',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFormattt() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //  SizedBox(height: 10), // Add some space between the texts
        Column(
          children: [
            Text(
              '',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
        // SizedBox(
        //   height: 10,
        // ),
        const Text(
          '',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 47, 109, 242),
          ),
        ),
        const SizedBox(
            height: 10), // Add space between text and horizontal line
        // Divider(
        //   // Add the horizontal line
        //   color: Colors.grey, // You can adjust the color as needed
        //   thickness: 1, // You can adjust the thickness as needed
        // ),
      ],
    );
  }
}
