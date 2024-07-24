import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_create_claim_screen/controller/create_claim_controller.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_createclaim_management/model/typeC_createclaim_management_model.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/customTextField.dart';
import 'package:incentivesgit/widgets/customdropdown1.dart';
import 'package:incentivesgit/widgets/customtextfield1.dart';
import 'package:incentivesgit/widgets/dialoguebox.dart';
import 'package:incentivesgit/widgets/dialoguebox1.dart';
import 'package:incentivesgit/widgets/imagedialogbox.dart';
import 'package:incentivesgit/widgets/popupview.dart';

class CreateClaimScreen extends GetWidget<CreateClaimController> {
  const CreateClaimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Container(
        color: Colors.black,
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: appTheme.white,
            appBar: AppBar(
              title: const Text(
                "Create Claim",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: appTheme.redappbar,
              iconTheme: IconThemeData(color: appTheme.white),
              leading: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: SvgPicture.asset(
                    ImageConstant.arrowback,
                    width: 27.w,
                    height: 18.h,
                  ),
                ),
              ),
            ),
            body: Obx(() {
              if (controller.isLoading.value) {
                return const Center(
                  child: SpinKitFadingCircle(
                    color: Colors.black,
                    size: 50.0,
                  ),
                );
              }
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 3,
                            height: 17,
                            color: appTheme.rediconbackground,
                            margin: const EdgeInsets.only(right: 6),
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
                      __buildSKUtitle(context),
                      SizedBox(height: 10.h),
                      _buildTextFieldSKU(),
                      SizedBox(height: 10.h),
                      Obx(() {
                        return controller.selectedSKU.isEmpty
                            ? Align(
                                alignment: AlignmentDirectional.bottomStart,
                                child: Text(
                                  controller.errors['selectsku'] ?? '',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: appTheme.redtext),
                                ))
                            : const SizedBox();
                      }),
                      CustomTextField(
                        labelText: 'Enter the Invoice number ',
                        controller: controller.invoiceclaimcontroller,
                        hintText: '',
                      ),
                      Obx(() {
                        return controller.invoiceclaimcontroller.text.isEmpty
                            ? Align(
                                alignment: AlignmentDirectional.bottomStart,
                                child: Text(
                                  controller.errors['invoiceNumber'] ?? '',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: appTheme.redtext),
                                ))
                            : SizedBox();
                      }),
                      SizedBox(height: 10.h),
                      CustomTextField(
                        labelText: 'Enter the quantity for incentive claim ',
                        controller: controller.invoicenumbercontroller,
                        hintText: '',
                      ),
                      Obx(() {
                        return controller.invoicenumbercontroller.text.isEmpty
                            ? Align(
                                alignment: AlignmentDirectional.bottomStart,
                                child: Text(
                                  controller.errors['invoiceClaim'] ?? "",
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: appTheme.redtext),
                                ))
                            : SizedBox();
                      }),
                      SizedBox(height: 10.h),
                      _buildAttach(),
                      SizedBox(height: 10.h),
                      _buildTextFieldAttach(context),
                      _buildFormat(),
                      Obx(() {
                        return controller.singlefilecontroller.text.isEmpty
                            ? Align(
                                alignment: AlignmentDirectional.bottomStart,
                                child: Text(
                                  controller.errors['singleFile'] ?? '',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: appTheme.redtext),
                                ))
                            : SizedBox();
                      }),
                      const SizedBox(height: 20),
                      _buildBusinessHierarchy(),
                      const SizedBox(height: 10),
                      country(),
                      const SizedBox(height: 10),
                      state(),
                      const SizedBox(height: 10),
                      city(),
                      const SizedBox(height: 10),
                      store(),
                      const SizedBox(height: 25),
                      _buildOtherFields(),
                      const SizedBox(height: 25),
                      _buildBreaker(controller),
                      const SizedBox(height: 10),
                      buildDate(context),
                      const SizedBox(height: 10),
                      Obx(() {
                        return controller.dateTextController.text.isEmpty
                            ? Align(
                                alignment: AlignmentDirectional.bottomStart,
                                child: Text(
                                  controller.errors['date'] ?? '',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: appTheme.redtext),
                                ))
                            : SizedBox();
                      }),
                      _buildMultipleFile(),
                      const SizedBox(height: 10),
                      _buildTextFieldMultipleFile(context),
                      Obx(() {
                        return controller.multiplefilecontroller.text.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Align(
                                    alignment: AlignmentDirectional.bottomStart,
                                    child: Text(
                                      controller.errors['multipleFile'] ?? '',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          color: appTheme.redtext),
                                    )),
                              )
                            : SizedBox();
                      }),
                      CustomTextField(
                          labelText: 'Number',
                          controller: controller.numberController,
                          hintText: ''),
                      Obx(() {
                        return controller.numberController.text.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Align(
                                    alignment: AlignmentDirectional.bottomStart,
                                    child: Text(
                                      controller.errors['number'] ?? '',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          color: appTheme.redtext),
                                    )),
                              )
                            : SizedBox();
                      }),
                      _buildRadioGroup(),
                      const SizedBox(height: 10),
                      _buildRadioGroupButton(),
                      const SizedBox(height: 10),
                      CustomTextField1(
                          labelText: 'Village you like',
                          controller: controller.villagecontroller,
                          hintText: '',
                          keyboardType: TextInputType.text),
                      const SizedBox(height: 20),
                      CustomTextField(
                          labelText: 'City Names',
                          controller: controller.citynamecontroller,
                          hintText: ''),
                      Obx(() {
                        return controller.multiplefilecontroller.text.isEmpty
                            ? Align(
                                alignment: AlignmentDirectional.bottomStart,
                                child: Text(
                                  controller.errors['cityName'] ?? '',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: appTheme.redtext),
                                ))
                            : SizedBox();
                      }),
                      _buildDescription(),
                      const SizedBox(height: 10),
                      _buildTextFieldDescription(),
                      Obx(() {
                        return controller.descriptioncontroller.text.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Align(
                                    alignment: AlignmentDirectional.bottomStart,
                                    child: Text(
                                      controller.errors['description'] ?? '',
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w500,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          color: appTheme.redtext),
                                    )),
                              )
                            : SizedBox();
                      }),
                      SizedBox(height: 20.h),
                      _buildButtons(context),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              );
            })),
      ),
    );
  }

  Widget _buildTextFieldSKU() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: appTheme.gray20001,
        border: Border.all(
          color: appTheme.grey500,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: TextField(
        controller: TextEditingController(text: controller.selectedSKU.value),
        decoration: const InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.only(left: 5.0),
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

  Widget _buildTextFieldAttach(BuildContext context) {
    return Container(
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
                    return DialogueBoxChooseImage(
                      onGalleryTap: () {
                        controller.chooseFile();
                      },
                      onCameraTap: () {
                        controller.chooseFileCamera();
                      },
                    );
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
    );
  }

  Widget _buildFormat() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              'Attachment should be of .pdf, .png, .jpg, .jpeg file formats \n maximum size limit : 5MB',
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade700,
                  fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ],
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
        const Row(
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

  Widget country() {
    return CustomDropdowncompulsory<HierarchyNode?>(
      hintText: 'Select Country',
      items: controller.countrynodes,
      value: controller.countrynodes.firstWhereOrNull(
          (node) => node.hierarchyNodeId == controller.countrynodesValue.value),
      onChanged: (HierarchyNode? value) {
        controller.countrynodesValue.value = value?.hierarchyNodeId;
        controller.countryselected(value?.hierarchyNodeId);
      },
      getLabel: (HierarchyNode? node) {
        return node?.nodeName ?? "";
      },
      labelText:
          controller.addclaimdetails.value.hierarchyLevels?[0].hierarchyName ??
              '',
    );
  }

  Widget state() {
    return CustomDropdowncompulsory<HierarchyNode?>(
      items: controller.statesnodes,
      onChanged: (HierarchyNode? value) {
        controller.statesnodesValue.value = value?.hierarchyNodeId;
        controller.stateselected(value?.hierarchyNodeId);
      },
      value: controller.statesnodes.firstWhereOrNull(
          (node) => node.hierarchyNodeId == controller.statesnodesValue.value),
      getLabel: (HierarchyNode? node) {
        return node?.nodeName ?? "";
      },
      hintText: "Select State",
      labelText:
          controller.addclaimdetails.value.hierarchyLevels?[1].hierarchyName ??
              '',
    );
  }

  Widget city() {
    return CustomDropdowncompulsory<HierarchyNode?>(
      items: controller.citynodes,
      onChanged: (HierarchyNode? value) {
        controller.citynodesValue.value = value?.hierarchyNodeId;
        controller.storeselected(value?.hierarchyNodeId);
      },
      value: controller.citynodes.firstWhereOrNull(
          (node) => node.hierarchyNodeId == controller.citynodesValue.value),
      getLabel: (HierarchyNode? node) {
        return node?.nodeName ?? "";
      },
      hintText: "Select City",
      labelText:
          controller.addclaimdetails.value.hierarchyLevels?[2].hierarchyName ??
              '',
    );
  }

  Widget store() {
    return CustomDropdowncompulsory<HierarchyNode?>(
      items: controller.storenodes,
      onChanged: (HierarchyNode? value) {
        controller.storenodesValue.value = value?.hierarchyNodeId;
      },
      value: controller.storenodes.firstWhereOrNull(
          (node) => node.hierarchyNodeId == controller.storenodesValue.value),
      getLabel: (HierarchyNode? node) {
        return node?.nodeName ?? "";
      },
      hintText: "Select Store",
      labelText:
          controller.addclaimdetails.value.hierarchyLevels?[3].hierarchyName ??
              '',
    );
  }

  Widget _buildOtherFields() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 3,
                height: 17,
                color: appTheme.rediconbackground,
                margin: const EdgeInsets.only(right: 6),
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
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildBreaker(CreateClaimController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'City Survey',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.poppins().fontFamily,
            color: appTheme.cyan800,
          ),
        ),
        const SizedBox(height: 15),
        const Row(
          children: [
            Expanded(
              child: Divider(
                color: Colors.grey,
                thickness: 1,
              ),
            ),
          ],
        ),
        const SizedBox(height: 13),
        Row(
          children: [
            Text(
              'Which city you like',
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
        const SizedBox(height: 10), // Adjust as needed
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0),
          child: buildCheckboxRow(controller, 1, 'Mumbai'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0),
          child: buildCheckboxRow(controller, 2, 'Pune'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0),
          child: buildCheckboxRow(controller, 3, 'Nasik'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: .0),
          child: buildCheckboxRow(controller, 4, 'Hyderabad'),
        ),
      ],
    );
  }

  Widget buildCheckboxRow(
      CreateClaimController controller, int checkboxIndex, String label) {
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
                fillColor: MaterialStateProperty.all(
                    isChecked ? appTheme.cyan800 : appTheme.white),
                checkColor: MaterialStateProperty.all(appTheme.white),
                side: MaterialStateBorderSide.resolveWith(
                  (states) => BorderSide(color: appTheme.cyan800, width: 2),
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

  Widget buildDate(BuildContext context) {
    return CustomTextField(
      labelText: 'Date Field',
      controller: controller.dateTextController,
      hintText: '',
      suffixIcon: const Icon(Icons.calendar_month),
      onSuffixIconPressed: () {
        controller.selectDate(context);
      },
    );
  }

  Widget _buildTextFieldDate(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: appTheme.grey500, // Adjust the color as needed
          width: 1.0, // Adjust the width as needed
        ),
        borderRadius: BorderRadius.circular(5.0), // Adjust the radius as needed
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller.dateTextController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                  left: 5.0,
                ),
              ),
              readOnly: true,
              onTap: () {
                controller.selectDate(context);
              },
            ),
          ),
          InkWell(
            onTap: () {
              controller.selectDate(context);
            },
            child: const Icon(Icons.calendar_month),
          ),
        ],
      ),
    );
  }

  Widget _buildMultipleFile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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

  Widget _buildTextFieldMultipleFile(BuildContext context) {
    return Container(
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
              controller: controller.multiplefilecontroller,
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
                    return DialogueBoxChooseImage(
                      onGalleryTap: () {
                        controller.choosemultipleFile();
                      },
                      onCameraTap: () {
                        controller.choosemultipleFileCamera();
                      },
                    );
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
                  'State You Like',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey.shade700,
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
        buildRadio(1, 'Maharashtra'),
        buildRadio(2, 'Punjab'),
        buildRadio(3, 'Gujrat'),
      ],
    );
  }

  Widget buildRadio(int value, String labelText) {
    return Row(
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
            activeColor: appTheme.cyan800,
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
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: appTheme.grey500, // Adjust the color as needed
            width: 1.0, // Adjust the width as needed
          ),
          borderRadius:
              BorderRadius.circular(5.0), // Adjust the radius as needed
        ),
        child: SizedBox(
          height: 100, // Set the desired heigh
          child: TextField(
            controller: controller.descriptioncontroller,
            cursorColor: appTheme.black600,
            maxLines: null, // Enable multiline input
            decoration: const InputDecoration(
              border: InputBorder.none, // Hide the default border of TextField
              contentPadding: EdgeInsets.only(
                  left: 5.0), // Adjust the left padding of hint text
            ),
          ),
        ));
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 98,
          height: 48,
          decoration: BoxDecoration(
              color: appTheme.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: appTheme.greybordercolour)),
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
                  color: appTheme.black900,
                  fontFamily: GoogleFonts.poppins().fontFamily,
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
            child: GestureDetector(
              onTap: () {
                if (controller.validateForm()) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomDialog(
                        title: 'Confirmation',
                        message:
                            'Are you sure you want to submit the claim request?',
                        onYesPressed: () {
                          controller.submitApprovalRequest().then((success) {
                            if (success != null && success.isNotEmpty) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CustomDialog1(
                                    title: 'Confirmation',
                                    message: '${controller.approvalMessage}',
                                    onYesPressed: () {
                                      Get.offNamed(
                                        AppRoutes.typectotalinvoiceregression,
                                      );
                                    },
                                  );
                                },
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CustomDialog1(
                                    title: 'Confirmation',
                                    message: '${controller.approvalMessage}',
                                    onYesPressed: () {
                                      Get.offAll(AppRoutes
                                          .typectotalinvoiceregression);
                                    },
                                  );
                                },
                              );
                            }
                          });
                        },
                      );
                    },
                  );
                }
              },
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
        ),
      ],
    );
  }

  Widget __buildSKUtitle(BuildContext context) {
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
                  isScrollControlled: true,
                  constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height - 150,
                      maxWidth: double.maxFinite),
                  builder: (BuildContext context) {
                    return bottomsheets();
                  },
                );
              },
              child: Text(
                controller.selectedSKU.isNotEmpty ? 'Edit' : 'Select',
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

  Widget bottomsheets() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        SizedBox(height: 30.h),
        _buildSearchBar(),
        SizedBox(height: 10.h),
        Expanded(
          child: _buildSkuList(),
        ),
        const SizedBox(height: 8),
        _buildLoadMore(),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 48,
      width: double.maxFinite,
      decoration: BoxDecoration(color: appTheme.redappbar),
      child: Padding(
        padding: const EdgeInsets.only(left: 23, top: 14, bottom: 14),
        child: Text(
          'Select SKU',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
            fontFamily: GoogleFonts.poppins().fontFamily,
            color: appTheme.white,
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.only(left: 22.w, right: 22.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Search',
            style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: appTheme.greytextcolour,
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            height: 48,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                ),
                Expanded(
                  child: TextField(
                    cursorColor: appTheme.black600,
                    onChanged: (value) {
                      controller.filterSkuList(value);
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: SvgPicture.asset(ImageConstant.search),
                        onPressed: () {},
                      ),
                      hintText: 'Search',
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 8),
                    ),
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkuList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Container(
        height: 410,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SKU Header Row
            Container(
              height: 48.h,
              decoration: BoxDecoration(color: appTheme.grey500),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'SKU Name',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: GoogleFonts.poppins().fontFamily,
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
              child: Obx(
                () {
                  return ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: controller.showAllData.value
                        ? controller.filteredSkuList.length
                        : (controller.filteredSkuList.length > 10
                            ? 10
                            : controller.filteredSkuList.length),
                    itemBuilder: (context, index) {
                      String displayText =
                          controller.filteredSkuList[index].code;

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text(
                                        displayText,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      const PopoverButton(),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.updateSelectedSKU(displayText);
                                    Get.back();
                                  },
                                  child: Container(
                                    width: 90,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.red),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Select SKU',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.grey[400],
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadMore() {
    return Center(
      child: Obx(
        () => GestureDetector(
          onTap: () {
            controller.toggleShowAllData();
          },
          child: Text(
            controller.showAllData.value ? '' : 'Load More',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Colors.red,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
        ),
      ),
    );
  }
}
