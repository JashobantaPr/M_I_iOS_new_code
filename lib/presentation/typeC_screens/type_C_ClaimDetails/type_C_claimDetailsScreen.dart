import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/typeC_screens/Type_C_rejectclaim/typec_rejectclaimsceen.dart';
import 'package:incentivesgit/presentation/typeC_screens/type_C_ClaimDetails/controller/claimDetailsController.dart';
import 'package:incentivesgit/presentation/typeC_screens/type_C_ClaimDetails/model/claimdetailsmodel.dart';
import 'package:intl/intl.dart';

class TypeCClaimDetailsScreen extends GetWidget<ClaimController> {
  const TypeCClaimDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200], // Background color for SafeArea
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text(
            "Claim Deatils",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0XFFE41C39),
          iconTheme: IconThemeData(color: Colors.white), // Set icon color here
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: SvgPicture.asset(
              ImageConstant.arrowback,
              width: 26.75.w,
              height: 14.76.h,
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.h),
                child: _buildFamily(context),
              ),
              SizedBox(height: 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFamily(context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Basic Details',
            style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
              color: const Color.fromRGBO(25, 25, 25, 1),
            ),
          ),
          SizedBox(
              height:
                  15), // Add some spacing between the heading and the content
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 120,
                child: Text(
                  'Claim Id',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    color: Color.fromARGB(255, 84, 83, 83),
                  ),
                ),
              ),
              const Spacer(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(":"),
              ),
              const Spacer(),
              SizedBox(
                width: 100,
                child: Obx(
                  () => Text(
                    controller.claimData.value.value?.claimCode ?? '',
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                      color: Color.fromARGB(255, 5, 4, 4),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'submission Date',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: Color.fromARGB(255, 84, 83, 83),
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          SizedBox(
            width: 100,
            child: Obx(
              () {
                // Parse the date
                DateTime? createDate = DateTime.tryParse(
                    controller.claimData.value.value?.createDate ?? '');
                // Format the date if it's not null
                String formattedDate = createDate != null
                    ? DateFormat('yyyy-MM-dd').format(createDate)
                    : '';
                return Text(
                  formattedDate,
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                    color: Color.fromARGB(255, 5, 4, 4),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'Toatal Invoice Value',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: Color.fromARGB(255, 84, 83, 83),
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          SizedBox(
            width: 100,
            child: Obx(
              () => Text(
                controller.claimData.value.value?.totalInvoiceValue ?? '',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                  color: Color.fromARGB(255, 5, 4, 4),
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'Points',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: Color.fromARGB(255, 84, 83, 83),
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          SizedBox(
            width: 100,
            child: Obx(
              () => Text(
                controller.claimData.value.value?.totalPoints ?? '',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                  color: Color.fromARGB(255, 5, 4, 4),
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'Invoice Id',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: Color.fromARGB(255, 84, 83, 83),
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          SizedBox(
            width: 100,
            child: Obx(
              () => Text(
                controller.claimData.value.value?.invoiceId ?? '',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                  color: Color.fromARGB(255, 5, 4, 4),
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'Claim proof(Invoice copy)',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: Color.fromARGB(255, 84, 83, 83),
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          SizedBox(
            width: 100,
            child: Obx(
              () {
                final invoiceImageUrl =
                    controller.claimData.value.value?.invoiceImageUrl;
                return GestureDetector(
                  onTap: () {
                    if (invoiceImageUrl != null) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Image.network(
                            invoiceImageUrl,
                            errorBuilder: (context, error, stackTrace) {
                              return Center(
                                child: Text(
                                  'No image Found',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                  ),
                                ),
                              );
                            },
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text('Close'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: Text(
                    'View Invoice Copy',
                    style: TextStyle(
                      color:
                          invoiceImageUrl != null ? Colors.blue : Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Text(
        'Business Hierarchy',
        style: TextStyle(
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontWeight: FontWeight.bold,
          fontSize: 15.sp,
          color: const Color.fromRGBO(25, 25, 25, 1),
        ),
      ),
      SizedBox(height: 15),
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
      SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'Country',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: Color.fromARGB(255, 84, 83, 83),
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          SizedBox(
            width: 100,
            child: Obx(
              () => Text(
                controller.claimData.value.value?.claimBusinessHierarchy?.first
                        ?.levelNodes ??
                    '',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                  color: Color.fromARGB(255, 5, 4, 4),
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'State',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: Color.fromARGB(255, 84, 83, 83),
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          SizedBox(
            width: 100,
            child: Obx(
              () => Text(
                controller.claimData.value.value?.claimBusinessHierarchy
                        ?.firstWhere((element) => element.level == 'State')
                        ?.levelNodes ??
                    'N/A', // Access the state from claimBusinessHierarchy
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                  color: Color.fromARGB(255, 5, 4, 4),
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'City',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: Color.fromARGB(255, 84, 83, 83),
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          SizedBox(
            width: 100,
            child: Obx(
              () => Text(
                controller.claimData.value.value?.claimBusinessHierarchy
                        ?.firstWhere((element) => element.level == 'City')
                        ?.levelNodes ??
                    'N/A', // Access the city from claimBusinessHierarchy
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                  color: Color.fromARGB(255, 5, 4, 4),
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'Store',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: Color.fromARGB(255, 84, 83, 83),
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          SizedBox(
            width: 100,
            child: Obx(
              () => Text(
                controller.claimData?.value.value?.claimBusinessHierarchy?.last
                        ?.levelNodes ??
                    '',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                  color: Color.fromARGB(255, 5, 4, 4),
                ),
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: 15),
      Text(
        'Product Hierarchy',
        style: TextStyle(
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontWeight: FontWeight.bold,
          fontSize: 15.sp,
          color: const Color.fromRGBO(25, 25, 25, 1),
        ),
      ),
      SizedBox(height: 15),
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
      SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'Brand',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: Color.fromARGB(255, 84, 83, 83),
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          SizedBox(
            width: 100,
            child: Obx(() {
              final hierarchy =
                  controller.claimData.value.value?.claimProductHierarchy;
              if (hierarchy != null && hierarchy.isNotEmpty) {
                final levelNodes = hierarchy.first?.levelNodes ?? '';
                return Text(
                  levelNodes,
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                    color: Color.fromARGB(255, 5, 4, 4),
                  ),
                );
              } else {
                return Text(
                  '', // or any default text you want to display
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                    color: Color.fromARGB(255, 5, 4, 4),
                  ),
                );
              }
            }),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'Product',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: Color.fromARGB(255, 84, 83, 83),
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          SizedBox(
            width: 100,
            child: Obx(() {
              final hierarchy =
                  controller.claimData.value.value?.claimProductHierarchy;
              if (hierarchy != null && hierarchy.isNotEmpty) {
                final productNode = hierarchy.firstWhere(
                  (element) => element.level == 'Product',
                );
                if (productNode != null && productNode is Hierarchy) {
                  final productText = productNode.levelNodes ?? 'N/A';
                  return Text(
                    productText,
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                      color: Color.fromARGB(255, 5, 4, 4),
                    ),
                  );
                }
              }
              return Text(
                'N/A',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                  color: Color.fromARGB(255, 5, 4, 4),
                ),
              );
            }),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'Edition',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: Color.fromARGB(255, 84, 83, 83),
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          SizedBox(
            width: 100,
            child: Obx(() {
              final hierarchy =
                  controller.claimData.value.value?.claimProductHierarchy;
              if (hierarchy != null && hierarchy.isNotEmpty) {
                final editionNode = hierarchy.firstWhere(
                  (element) => element.level == 'Edition',
                );
                if (editionNode != null && editionNode is Hierarchy) {
                  final editionText = editionNode.levelNodes ?? 'N/A';
                  return Text(
                    editionText,
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                      color: Color.fromARGB(255, 5, 4, 4),
                    ),
                  );
                }
              }
              return Text(
                'N/A',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                  color: Color.fromARGB(255, 5, 4, 4),
                ),
              );
            }),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'SKU',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: Color.fromARGB(255, 84, 83, 83),
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          SizedBox(
            width: 100,
            child: Obx(() {
              final hierarchy =
                  controller.claimData.value.value?.claimProductHierarchy;
              if (hierarchy != null && hierarchy.isNotEmpty) {
                final skuNode = hierarchy.last?.levelNodes ?? 'N/A';
                return Text(
                  skuNode,
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                    color: Color.fromARGB(255, 5, 4, 4),
                  ),
                );
              }
              return Text(
                'N/A',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                  color: Color.fromARGB(255, 5, 4, 4),
                ),
              );
            }),
          ),
        ],
      ),
      SizedBox(height: 15),
      Text(
        'Other Fields',
        style: TextStyle(
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontWeight: FontWeight.bold,
          fontSize: 15.sp,
          color: const Color.fromRGBO(25, 25, 25, 1),
        ),
      ),
      const SizedBox(
        height: 15,
      ),
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
      SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'and pushed the code ',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: Color.fromARGB(255, 84, 83, 83),
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          SizedBox(
            width: 100,
            child: Text(
              'Mouse',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 13.sp,
                color: Color.fromARGB(255, 5, 4, 4),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'Date Field',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: Color.fromARGB(255, 84, 83, 83),
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          SizedBox(
            width: 100,
            child: Obx(
              () {
                // Parse the date
                DateTime? createDate = DateTime.tryParse(
                    controller.claimData.value.value?.createDate ?? '');
                // Format the date if it's not null
                String formattedDate = createDate != null
                    ? DateFormat('yyyy-MM-dd').format(createDate)
                    : '';
                return Text(
                  formattedDate,
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                    color: Color.fromARGB(255, 5, 4, 4),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Obx(() {
        final claimData = controller.claimData.value.value;
        if (claimData == null) {
          return Center(child: CircularProgressIndicator());
        }

        final multipleFiles = claimData.multipleFiles;
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 120,
                  child: Text(
                    'Multiple File Upload',
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                      color: Color.fromARGB(255, 84, 83, 83),
                    ),
                  ),
                ),
                const Spacer(),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(":"),
                ),
                const Spacer(),
                SizedBox(
                  width: 100,
                  child: multipleFiles == null || multipleFiles.isEmpty
                      ? Text(
                          'No files',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Column(
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: multipleFiles.map((fileUrl) {
                            final fileName = fileUrl.split('/').last;
                            return GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    content: Center(
                                      child: Image.network(
                                        fileUrl,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const Center(
                                            child: Text(
                                              'No Image Found',
                                              style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 15,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(),
                                        child: Text('Close'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Text(
                                fileName,
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                ),
              ],
            ),
            // Add other UI components here
          ],
        );
      }),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'Number',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: Color.fromARGB(255, 84, 83, 83),
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          SizedBox(
            width: 100,
            child: Obx(
              () {
                var claimCustomFields =
                    controller.claimData.value.value?.claimCustomFields;
                var fieldValue = "No data available";
                if (claimCustomFields != null && claimCustomFields.isNotEmpty) {
                  var field = claimCustomFields.firstWhere(
                    (field) => field.name == "number-1706521697069-0",
                    orElse: () => CustomField(fieldValue: "No data available"),
                  );
                  fieldValue = field.fieldValue;
                }
                return Text(
                  fieldValue,
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                    color: Color.fromARGB(255, 5, 4, 4),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'Radio Group',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: Color.fromARGB(255, 84, 83, 83),
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          SizedBox(
            width: 100,
            child: Obx(
              () {
                final radioGroupValue =
                    controller.claimData.value.value?.claimCustomFields
                        ?.firstWhere(
                          (field) =>
                              field.name == 'radio-group-1706521957363-0',
                          orElse: () => CustomField(fieldValue: null),
                        )
                        ?.fieldValue;
                return Text(
                  '$radioGroupValue',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                    color: Color.fromARGB(255, 5, 4, 4),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'Select',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: Color.fromARGB(255, 84, 83, 83),
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          SizedBox(
            width: 100,
            child: Obx(
              () {
                final selectValue =
                    controller.claimData.value.value?.claimCustomFields
                        ?.firstWhere(
                          (field) => field.name == 'select-1706521990122-0',
                          orElse: () => CustomField(fieldValue: null),
                        )
                        ?.fieldValue;
                return Text(
                  '$selectValue',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 13.sp,
                    color: Color.fromARGB(255, 5, 4, 4),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'Name',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: Color.fromARGB(255, 84, 83, 83),
              ),
            ),
          ),
          const Spacer(),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(":"),
          ),
          const Spacer(),
          SizedBox(
            width: 100,
            child: Obx(
              () => Text(
                controller.claimData.value.value?.name ?? '',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                  color: Color.fromARGB(255, 5, 4, 4),
                ),
              ),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 15,
      ),
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 120,
                child: Text(
                  'Description',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.sp,
                    color: Color.fromARGB(255, 84, 83, 83),
                  ),
                ),
              ),
              const Spacer(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(":"),
              ),
              const Spacer(),
              SizedBox(
                width: 100,
                child: Obx(
                  () {
                    final descriptionValue =
                        controller.claimData.value.value?.claimCustomFields
                            ?.firstWhere(
                              (field) =>
                                  field.name == 'textarea-1706522707522-0',
                              orElse: () => CustomField(fieldValue: null),
                            )
                            ?.fieldValue;
                    return Text(
                      '$descriptionValue',
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                        color: Color.fromARGB(255, 5, 4, 4),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Row(
            children: [
              // Expanded(
              //   child: Divider(
              //     color: Colors.grey,
              //     thickness: 1,
              //   ),
              // ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Obx(
            () => Visibility(
              visible: controller.claimData.value.value?.claimStatus ==
                      "Pending For Approval" ||
                  controller.claimData.value.value?.claimStatus == "Approved",
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center the buttons horizontally
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Get.back();
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey),
                      minimumSize: Size(120, 60),
                    ),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  OutlinedButton(
                    onPressed: () {
                      // Display the confirmation dialog
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CustomConfirmationDialogScreen(
                            onConfirm: () {
                              var climeod = controller.claimed
                                  .value; // Access the string value from RxString
                              print('climeod$climeod');
                              controller.controllpoints.rejectClaim(climeod);
                              // Navigator.of(context).pop(); // Close the dialog
                            },
                          );
                        },
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.red),
                      minimumSize: Size(120, 60),
                      backgroundColor: Colors.red,
                    ),
                    child: Text(
                      'Discard',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    ]);
  }
}
