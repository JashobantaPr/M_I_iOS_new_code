import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_createclaim_management/controller/typeC_createclaim_management_controller.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_createclaim_management/model/typeC_createclaim_management_model.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/customTextField.dart';
import 'package:incentivesgit/widgets/customdropdown1.dart';
import 'package:incentivesgit/widgets/dialoguebox.dart';
import 'package:incentivesgit/widgets/dialoguebox1.dart';
import 'package:incentivesgit/widgets/imagedialogbox.dart';

class CreateClaimManagaementScreen
    extends GetWidget<CreateClaimManagementController> {
  const CreateClaimManagaementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Container(
        color: appTheme.redappbar,
        child: Scaffold(
            backgroundColor: appTheme.white,
            appBar: _customAppBar(),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
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
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomTextField(
                        labelText: 'Enter the Invoice number',
                        controller: controller.invoicenumbercontroller,
                        hintText: '',
                      ),
                      controller.invoicenumbercontroller.text.isEmpty
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
                          : const SizedBox(),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomTextField(
                        labelText: 'Enter total Invoice value',
                        controller: controller.invoicevaluecontroller,
                        hintText: '',
                      ),
                      controller.invoicevaluecontroller.text.isEmpty
                          ? Align(
                              alignment: AlignmentDirectional.bottomStart,
                              child: Text(
                                controller.errors['invoicevalue'] ?? '',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    color: appTheme.redtext),
                              ))
                          : const SizedBox(),
                      _buildTextFieldTotalInvoice(),
                      const SizedBox(height: 17),
                      _buildAttach(),
                      const SizedBox(height: 10),
                      _buildTextFieldAttach(context),
                      controller.singlefilecontroller.text.isEmpty
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
                          : const SizedBox(),
                      SizedBox(height: 5.h),
                      fileType(),
                      const SizedBox(height: 25),
                      _buildBusinessHierarchy(),
                      const SizedBox(height: 10),
                      _buildCountry(),
                      const SizedBox(height: 10),
                      _buildState(),
                      Obx(() {
                        return controller.statesnodesValue.value == null
                            ? Align(
                                alignment: AlignmentDirectional.bottomStart,
                                child: Text(
                                  controller.errors['state'] ?? '',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: appTheme.redtext),
                                ))
                            : const SizedBox();
                      }),
                      const SizedBox(height: 10),
                      _buildCity(),
                      Obx(() {
                        return controller.citynodesValue.value == null
                            ? Align(
                                alignment: AlignmentDirectional.bottomStart,
                                child: Text(
                                  controller.errors['city'] ?? '',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: appTheme.redtext),
                                ))
                            : const SizedBox();
                      }),
                      const SizedBox(height: 10),
                      _buildStore(),
                      const SizedBox(height: 25),
                      _buildProductHierarchy(),
                      const SizedBox(height: 25),
                      _buildBrand(),
                      Obx(() {
                        return controller.brandnodesValue.value == null
                            ? Align(
                                alignment: AlignmentDirectional.bottomStart,
                                child: Text(
                                  controller.errors['brand'] ?? '',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: appTheme.redtext),
                                ))
                            : const SizedBox();
                      }),
                      const SizedBox(height: 10),
                      _buildProduct(),
                      Obx(() {
                        return controller.productnodesValue.value == null
                            ? Align(
                                alignment: AlignmentDirectional.bottomStart,
                                child: Text(
                                  controller.errors['product'] ?? '',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: appTheme.redtext),
                                ))
                            : const SizedBox();
                      }),
                      const SizedBox(height: 10),
                      _buildEdition(),
                      Obx(() {
                        return controller.editionnodesValue.value == null
                            ? Align(
                                alignment: AlignmentDirectional.bottomStart,
                                child: Text(
                                  controller.errors['edition'] ?? '',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: appTheme.redtext),
                                ))
                            : const SizedBox();
                      }),
                      const SizedBox(height: 10),
                      _buildSKU(),
                      Obx(() {
                        return controller.skunodesValue.value == null
                            ? Align(
                                alignment: AlignmentDirectional.bottomStart,
                                child: Text(
                                  controller.errors['skunodes'] ?? '',
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      color: appTheme.redtext),
                                ))
                            : const SizedBox();
                      }),
                      const SizedBox(height: 25),
                      _buildOtherFields(),
                      const SizedBox(height: 25),
                      _buildBreaker(controller),
                      const SizedBox(height: 5),
                      buildDate(context),
                      controller.dateTextController.text.isEmpty
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
                          : const SizedBox(),
                      const SizedBox(height: 5),
                      _buildMultipleFile(),
                      const SizedBox(height: 2),
                      _buildTextFieldMultipleFile(context),
                      controller.multiplefilecontroller.text.isEmpty
                          ? Align(
                              alignment: AlignmentDirectional.bottomStart,
                              child: Text(
                                controller.errors['multipleFile'] ?? '',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    color: appTheme.redtext),
                              ))
                          : const SizedBox(),
                      const SizedBox(height: 5),
                      _buildNumber(),
                      const SizedBox(height: 5),
                      _buildRadioGroup(),
                      const SizedBox(height: 10),
                      _buildRadioGroupButton(),
                      const SizedBox(height: 5),
                      _buildSelect(),
                      controller.villagecontroller.text.isEmpty
                          ? Align(
                              alignment: AlignmentDirectional.bottomStart,
                              child: Text(
                                controller.errors['village'] ?? '',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    color: appTheme.redtext),
                              ))
                          : const SizedBox(),
                      const SizedBox(height: 5),
                      _buildName(),
                      controller.citynamecontroller.text.isEmpty
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
                          : const SizedBox(),
                      const SizedBox(height: 5),
                      _buildDescription(),
                      controller.descriptioncontroller.text.isEmpty
                          ? Align(
                              alignment: AlignmentDirectional.bottomStart,
                              child: Text(
                                controller.errors['description'] ?? '',
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    color: appTheme.redtext),
                              ))
                          : const SizedBox(),
                      const SizedBox(height: 20),
                      _buildButtons(context),
                      SizedBox(
                        height: 10.h,
                      )
                    ],
                  ),
                ),
              );
            })),
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

  Widget _buildTextFieldTotalInvoice() {
    return Obx(() {
      final slabPoint = controller.slabPoint.value;
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Incentive type: ',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 10.sp,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: appTheme.black600,
              ),
            ),
            slabPoint != null
                ? TextSpan(
                    text: slabPoint.incentiveType,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10.sp,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: appTheme.black600,
                    ),
                  )
                : const TextSpan(
                    text: '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
            TextSpan(
              text: ' | Slab: ',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 10.sp,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: appTheme.black600,
              ),
            ),
            slabPoint != null
                ? TextSpan(
                    text: slabPoint.range,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10.sp,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: appTheme.black600,
                    ),
                  )
                : const TextSpan(
                    text: '0-0',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
            TextSpan(
              text: ' | Points: ',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 10.sp,
                fontFamily: GoogleFonts.poppins().fontFamily,
                color: appTheme.black600,
              ),
            ),
            slabPoint != null
                ? TextSpan(
                    text: slabPoint.points,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10.sp,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: appTheme.black600,
                    ),
                  )
                : const TextSpan(
                    text: '0',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
          ],
        ),
      );
    });
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

  Widget _buildTextFieldAttach(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: appTheme.grey500,
          width: 1.0, // Adjust the width as needed
        ),
        borderRadius: BorderRadius.circular(5.0), // Adjust the radius as needed
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Align items to the edges
        children: [
          Expanded(
            flex: 3,
            child: TextField(
              controller: controller.singlefilecontroller,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(left: 5.0),
                hintText: 'No File Chosen',
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
    );
  }

  Widget fileType() {
    return Text(
      'Attachment should be of .pdf, .png, .jpg, .jpeg file formats \n maximum size limit : 5MB',
      style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          color: appTheme.greytextcolour,
          fontStyle: FontStyle.italic),
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

  Widget _buildCountry() {
    return Obx(() {
      return CustomDropdowncompulsory<HierarchyNode?>(
        hintText: 'Select Country',
        items: controller.countrynodes,
        value: controller.countrynodes.firstWhereOrNull((node) =>
            node.hierarchyNodeId == controller.countrynodesValue.value),
        onChanged: (HierarchyNode? value) {
          controller.countrynodesValue.value = value?.hierarchyNodeId;
          controller.countryselected(value?.hierarchyNodeId);
        },
        getLabel: (HierarchyNode? node) {
          return node?.nodeName ?? "";
        },
        labelText: controller
                .addclaimdetails.value.hierarchyLevels?[0].hierarchyName ??
            '',
      );
    });
  }

  Widget _buildState() {
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

  Widget _buildCity() {
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

  Widget _buildStore() {
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

  Widget _buildProductHierarchy() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Product Hierarchy',
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

  Widget _buildBrand() {
    return CustomDropdowncompulsory<ProductHierarchyLevelData?>(
      items: controller.brandnodes,
      onChanged: (ProductHierarchyLevelData? value) {
        controller.brandnodesValue.value = value?.hierarchyNodeId;
        controller.brandselected(value?.hierarchyNodeId);
      },
      value: controller.brandnodes.firstWhereOrNull(
          (node) => node.hierarchyNodeId == controller.brandnodesValue.value),
      getLabel: (ProductHierarchyLevelData? node) {
        if (node != null) {
          var nodeId = node.hierarchyNodeId;
          var label =
              controller.addclaimdetails.value.productHierarchyNodes![nodeId];
          return label ?? "";
        }
        return "";
      },
      hintText: "Select Brand",
      labelText: controller
              .addclaimdetails.value.productHierarchyLevels?[0].hierarchyName ??
          '',
    );
  }

  Widget _buildProduct() {
    return CustomDropdowncompulsory<ProductHierarchyLevelData?>(
      items: controller.productnodes,
      onChanged: (ProductHierarchyLevelData? value) {
        controller.productnodesValue.value = value?.hierarchyNodeId;
        controller.productselected(value?.hierarchyNodeId);
      },
      value: controller.productnodes.firstWhereOrNull(
          (node) => node.hierarchyNodeId == controller.productnodesValue.value),
      getLabel: (ProductHierarchyLevelData? node) {
        if (node != null) {
          var nodeId = node.hierarchyNodeId;
          var label =
              controller.addclaimdetails.value.productHierarchyNodes![nodeId];
          return label ?? "";
        }
        return "";
      },
      hintText: "Select Product",
      labelText: controller
              .addclaimdetails.value.productHierarchyLevels![1].hierarchyName ??
          '',
    );
  }

  Widget _buildEdition() {
    return CustomDropdowncompulsory<ProductHierarchyLevelData?>(
      items: controller.editionnodes,
      onChanged: (ProductHierarchyLevelData? value) {
        controller.editionnodesValue.value = value?.hierarchyNodeId;
        controller.editionselected(value?.hierarchyNodeId);
      },
      value: controller.editionnodes.firstWhereOrNull(
          (node) => node.hierarchyNodeId == controller.editionnodesValue.value),
      getLabel: (ProductHierarchyLevelData? node) {
        if (node != null) {
          var nodeId = node.hierarchyNodeId;
          var label =
              controller.addclaimdetails.value.productHierarchyNodes![nodeId];
          return label ?? "";
        }
        return "";
      },
      hintText: "Select Edition",
      labelText: controller
              .addclaimdetails.value.productHierarchyLevels![2].hierarchyName ??
          '',
    );
  }

  Widget _buildSKU() {
    return CustomDropdowncompulsory<ProductHierarchyLevelData?>(
      items: controller.skunodes,
      onChanged: (ProductHierarchyLevelData? value) {
        var label = controller.addclaimdetails.value
                .skuHierarchyNodes![value?.hierarchyNodeId ?? ''] ??
            '';
        controller.skuselected(value?.hierarchyNodeId, label);
      },
      value: controller.skunodes.firstWhereOrNull(
          (node) => node.hierarchyNodeId == controller.skunodesValue.value),
      getLabel: (ProductHierarchyLevelData? node) {
        if (node != null) {
          var nodeId = node.hierarchyNodeId;
          var label =
              controller.addclaimdetails.value.skuHierarchyNodes![nodeId];
          return label ?? "";
        }
        return "";
      },
      hintText: "Select SKU",
      labelText: controller
              .addclaimdetails.value.productHierarchyLevels![3].hierarchyName ??
          '',
    );
  }

  Widget _buildOtherFields() {
    return Row(
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
    );
  }

  Widget _buildBreaker(CreateClaimManagementController controller) {
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

  Widget buildCheckboxRow(CreateClaimManagementController controller,
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

  Widget _buildMultipleFile() {
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

  Widget _buildNumber() {
    return CustomTextField(
        labelText: 'Number',
        controller: controller.numberController,
        hintText: '');
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

  Widget _buildSelect() {
    return CustomTextField(
      labelText: 'Villages you like',
      controller: controller.villagecontroller,
      hintText: '',
    );
  }

  Widget _buildName() {
    return CustomTextField(
        labelText: 'City Names',
        controller: controller.citynamecontroller,
        hintText: '');
  }

  Widget _buildDescription() {
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
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Container(
            width: 98,
            height: 48,
            decoration: BoxDecoration(
                color: appTheme.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: appTheme.grey500,
                )),
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
                                      Get.offAndToNamed(
                                          AppRoutes.typectotalinvoiceregression,
                                          result: true);
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

  Widget dialogueboxMultipleFiles(BuildContext context) {
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
                          controller.choosemultipleFile();
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
}
