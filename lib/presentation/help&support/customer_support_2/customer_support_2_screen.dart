import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/help&support/customer_support_2/controller/customer_support_2_controller.dart';
import 'package:incentivesgit/presentation/help&support/customer_support_2/model/dropdown.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class HelpandSupportCustomerSupport2Screen
    extends GetWidget<HelpandSupportCustomerSupport2Controller> {
  const HelpandSupportCustomerSupport2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Container(
      color: const Color(0XFFE41C39),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0XFFE41C39),
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: SvgPicture.asset(
              ImageConstant.arrowback,
              width: 26.75.w,
              height: 19.76.h,
            ),
          ),
          title: Text(
            'Add Tickets',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  _buildMobileNumber(_formKey),
                  SizedBox(height: 20),
                  _buildCategory(_formKey),
                  SizedBox(height: 20),
                  _buildSubjectLine(_formKey),
                  SizedBox(height: 20),
                  _buildMessage(_formKey),
                  SizedBox(height: 20),
                  _buildAttach(),
                  const SizedBox(height: 10),
                  _buildTextFieldAttach(context),
                  const SizedBox(height: 10),
                  _buildExtensionsText(),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Divider(
                      color: appTheme.grey500,
                      thickness: 1.0,
                    ),
                  ),
                  SizedBox(height: 15),
                  _buildButtons(_formKey),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileNumber(GlobalKey<FormState> formKey) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Mobile number',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.w400,
                    color: appTheme.greytextcolour,
                  ),
                ),
                Text(
                  '*',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: appTheme.rediconbackground,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: controller.mobilenumber,
              cursorColor: appTheme.black600,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: appTheme.grey500),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: appTheme.grey500),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: appTheme.grey500),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: appTheme.grey500),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: appTheme.gray500),
                ),
                contentPadding: EdgeInsets.only(left: 10.0),
                errorStyle: TextStyle(
                  fontSize: 12.0,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: appTheme.redappbar,
                  fontWeight: FontWeight.w400,
                ),
              ),
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter 10 digit mobile number';
                } else if (value.length < 10) {
                  return 'Enter 10 digit mobile number';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategory(GlobalKey<FormState> formKey) {
    final HelpandSupportCustomerSupport2Controller controller =
        Get.find<HelpandSupportCustomerSupport2Controller>();

    return FormField<String?>(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Category is required';
        }
        return null;
      },
      builder: (FormFieldState<String?> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Category',
                    style: TextStyle(
                      fontSize: 12.0,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w400,
                      color: appTheme.greytextcolour,
                    ),
                  ),
                  Text(
                    '*',
                    style: TextStyle(
                      fontSize: 12.0,
                      color: appTheme.rediconbackground,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0), // Space between dropdown and error text
            Padding(
              padding: EdgeInsets.only(left: 18, right: 20),
              child: CustomDropdown<String?>(
                backgroundColor: Colors.white,
                hintText: 'Select Category',
                items: [
                  for (var category in controller.ticketCategories)
                    category.categoryName
                ],
                value: controller.selectedCategory.value,
                onChanged: (value) {
                  controller.selectedCategory.value = value;
                  field.didChange(value);
                },
                getLabel: (String? value) {
                  return '$value';
                },
                hasError: field.hasError, // Pass the error state here
              ),
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 8.0),
                child: Text(
                  field.errorText!,
                  style: TextStyle(
                    color: appTheme.rediconbackground,
                    fontSize: 12.0,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildSubjectLine(GlobalKey<FormState> formKey) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Subject Line',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.w400,
                    color: appTheme.greytextcolour,
                  ),
                ),
                Text(
                  '*',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: appTheme.rediconbackground,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: controller.subjectline,
              cursorColor: appTheme.black600,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: appTheme.grey500),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: appTheme.grey500),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: appTheme.grey500),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: appTheme.grey500),
                ),
                contentPadding: EdgeInsets.only(left: 5.0),
                errorStyle: TextStyle(
                  fontSize: 12.0,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: appTheme.redappbar,
                ),
              ),
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Subject is required';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage(GlobalKey<FormState> formKey) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Message',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.w400,
                    color: appTheme.greytextcolour,
                  ),
                ),
                Text(
                  '*',
                  style: TextStyle(
                    fontSize: 12.0,
                    color: appTheme.rediconbackground,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            TextFormField(
              controller: controller.message,
              cursorColor: appTheme.black600,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: appTheme.grey500),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: appTheme.grey500),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: appTheme.grey500),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: appTheme.grey500),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                errorStyle: TextStyle(
                  fontSize: 12.0,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: appTheme.redappbar,
                ),
              ),
              style: TextStyle(
                fontSize: 14.0,
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Message is required';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttach() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Upload File',
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

  Widget _buildTextFieldAttach(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
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
                    controller.chooseFile();
                  },
                  child: Container(
                    width: 100,
                    height: 48,
                    color: const Color(0xFFE41C39),
                    child: const Center(
                      child: Text(
                        'Choose File',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildExtensionsText() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'The file should be jpeg, png or jpg image with max size of 1 MB',
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF808080),
                    fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButtons(GlobalKey<FormState> formKey) {
    final HelpandSupportCustomerSupport2Controller myController =
        Get.put(HelpandSupportCustomerSupport2Controller());

    return Column(
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Builder(
              builder: (context) {
                return TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all<TextStyle>(
                      TextStyle(
                        color: Colors.white,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        side: BorderSide(color: appTheme.grey500),
                      ),
                    ),
                  ),
                  child: Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                      color: appTheme.greydownarrow,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                );
              },
            ),
            SizedBox(width: 20),
            TextButton(
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  myController.addticket();
                }
              },
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
                  EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
              ),
              child: Text(
                'Submit',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
