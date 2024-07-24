import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_KpiSku_ClaimDetails/controller/typeC_KpiSku_ClaimDetails_controller.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_KpiSku_ClaimDetails/model/typeC_KpiSku_ClaimDetails_model.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:intl/intl.dart';

class TypeCKpiSkuClaimDetailsScreen
    extends GetWidget<TypeCKpiSkuClaimDetailsController> {
  const TypeCKpiSkuClaimDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appTheme.rediconbackground,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: const Text(
              "Claim Deatils",
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
      ),
    );
  }

  Widget _buildFamily(context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Column(
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
          SizedBox(height: 15),
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
              'Submission Date',
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
              'SKU Details',
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
          Column(
            children: [
              SizedBox(
                width: 100,
                child: Obx(
                  () => Text(
                    'Sku Code - ${controller.claimData.value.value?.skuCode ?? ''}',
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                      color: Color.fromARGB(255, 5, 4, 4),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                child: Obx(
                  () => Text(
                    'SKU Size - ${controller.claimData.value.value?.skuSize ?? ''}',
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                      color: Color.fromARGB(255, 5, 4, 4),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                child: Obx(
                  () => Text(
                    'SKU Weight - ${controller.claimData.value.value?.skuWeight ?? ''}',
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                      color: Color.fromARGB(255, 5, 4, 4),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                child: Obx(
                  () => Text(
                    'SKU Cost - ${controller.claimData.value.value?.skuCost ?? ''}',
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                      color: Color.fromARGB(255, 5, 4, 4),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                child: Obx(
                  () => Text(
                    'SKU Volume - ${controller.claimData.value.value?.skuVolume ?? ''}',
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                      color: Color.fromARGB(255, 5, 4, 4),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                child: Obx(
                  () => Text(
                    'SKU Price - ${controller.claimData.value.value?.skuPrice ?? ''}',
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.sp,
                      color: Color.fromARGB(255, 5, 4, 4),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                child: Obx(
                  () => Text(
                    'SKU Description - ${controller.claimData.value.value?.skuDesc ?? ''}',
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
              'Quantity',
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
                controller.claimData.value.value?.quantity ?? '',
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
                              return Text(
                                'Error loading image',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
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
                      color: invoiceImageUrl != null
                          ? appTheme.blue50
                          : Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
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
            child: Text(
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
            child: Text(
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
      // Text(
      //   'Product hierarchy',
      //   style: TextStyle(
      //     fontFamily: GoogleFonts.poppins().fontFamily,
      //     fontWeight: FontWeight.bold,
      //     fontSize: 15.sp,
      //     color: const Color.fromRGBO(25, 25, 25, 1),
      //   ),
      // ),
      // SizedBox(height: 15),
      // const Row(
      //   children: [
      //     Expanded(
      //       child: Divider(
      //         color: Colors.grey,
      //         thickness: 1,
      //       ),
      //     ),
      //   ],
      // ),
      // SizedBox(
      //   height: 15,
      // ),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     SizedBox(
      //       width: 120,
      //       child: Text(
      //         'Brand',
      //         style: TextStyle(
      //           fontFamily: GoogleFonts.poppins().fontFamily,
      //           fontWeight: FontWeight.w600,
      //           fontSize: 12.sp,
      //           color: Color.fromARGB(255, 84, 83, 83),
      //         ),
      //       ),
      //     ),
      //     const Spacer(),
      //     const Align(
      //       alignment: Alignment.centerLeft,
      //       child: Text(":"),
      //     ),
      //     const Spacer(),
      //     SizedBox(
      //       width: 100,
      //       child: Obx(
      //         () => Text(
      //           controller.claimData.value.value?.claimProductHierarchy?.first
      //                   ?.levelNodes ??
      //               '',
      //           style: TextStyle(
      //             fontFamily: GoogleFonts.poppins().fontFamily,
      //             fontWeight: FontWeight.bold,
      //             fontSize: 13.sp,
      //             color: Color.fromARGB(255, 5, 4, 4),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      // const SizedBox(
      //   height: 15,
      // ),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     SizedBox(
      //       width: 120,
      //       child: Text(
      //         'Product',
      //         style: TextStyle(
      //           fontFamily: GoogleFonts.poppins().fontFamily,
      //           fontWeight: FontWeight.w600,
      //           fontSize: 12.sp,
      //           color: Color.fromARGB(255, 84, 83, 83),
      //         ),
      //       ),
      //     ),
      //     const Spacer(),
      //     const Align(
      //       alignment: Alignment.centerLeft,
      //       child: Text(":"),
      //     ),
      //     const Spacer(),
      //     SizedBox(
      //       width: 100,
      //       child: Text(
      //         controller.claimData.value.value?.claimProductHierarchy
      //                 ?.firstWhere((element) => element.level == 'Product')
      //                 ?.levelNodes ??
      //             'N/A',
      //         style: TextStyle(
      //           fontFamily: GoogleFonts.poppins().fontFamily,
      //           fontWeight: FontWeight.bold,
      //           fontSize: 13.sp,
      //           color: Color.fromARGB(255, 5, 4, 4),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      // const SizedBox(
      //   height: 15,
      // ),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     SizedBox(
      //       width: 120,
      //       child: Text(
      //         'Edition',
      //         style: TextStyle(
      //           fontFamily: GoogleFonts.poppins().fontFamily,
      //           fontWeight: FontWeight.w600,
      //           fontSize: 12.sp,
      //           color: Color.fromARGB(255, 84, 83, 83),
      //         ),
      //       ),
      //     ),
      //     const Spacer(),
      //     const Align(
      //       alignment: Alignment.centerLeft,
      //       child: Text(":"),
      //     ),
      //     const Spacer(),
      //     SizedBox(
      //       width: 100,
      //       child: Text(
      //         controller.claimData.value.value?.claimProductHierarchy
      //                 ?.firstWhere((element) => element.level == 'Edition')
      //                 ?.levelNodes ??
      //             'N/A',
      //         style: TextStyle(
      //           fontFamily: GoogleFonts.poppins().fontFamily,
      //           fontWeight: FontWeight.bold,
      //           fontSize: 13.sp,
      //           color: Color.fromARGB(255, 5, 4, 4),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      // const SizedBox(
      //   height: 15,
      // ),
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   children: [
      //     SizedBox(
      //       width: 120,
      //       child: Text(
      //         'SKU',
      //         style: TextStyle(
      //           fontFamily: GoogleFonts.poppins().fontFamily,
      //           fontWeight: FontWeight.w600,
      //           fontSize: 12.sp,
      //           color: Color.fromARGB(255, 84, 83, 83),
      //         ),
      //       ),
      //     ),
      //     const Spacer(),
      //     const Align(
      //       alignment: Alignment.centerLeft,
      //       child: Text(":"),
      //     ),
      //     const Spacer(),
      //     SizedBox(
      //       width: 100,
      //       child: Obx(
      //         () => Text(
      //           controller.claimData.value.value?.claimProductHierarchy?.last
      //                   ?.levelNodes ??
      //               '',
      //           style: TextStyle(
      //             fontFamily: GoogleFonts.poppins().fontFamily,
      //             fontWeight: FontWeight.bold,
      //             fontSize: 13.sp,
      //             color: Color.fromARGB(255, 5, 4, 4),
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      // SizedBox(height: 15),
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
      const SizedBox(
        height: 15,
      ),
      Text(
        'Stock Market',
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
      Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
              child: Text(
                'Stock you want to buy ',
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
              height: 100,
              child: ListView.builder(
                itemCount: controller
                        .claimData.value.value?.claimCustomFields?.length ??
                    0,
                itemBuilder: (context, index) {
                  final customField = controller
                      .claimData.value.value?.claimCustomFields![index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (customField != null && customField.values != null)
                        ...customField.values!
                            .map((customValue) => Text(
                                  customValue.label ?? 'N/A',
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13.sp,
                                    color: Color.fromARGB(255, 5, 4, 4),
                                  ),
                                ))
                            .toList(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
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
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              'Multiple Files',
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
                final multipleFiles =
                    controller.claimData.value.value?.multipleFiles;
                final fileName = (multipleFiles?.isNotEmpty == true)
                    ? multipleFiles![0].split('/').last
                    : null;
                final imageUrl = (multipleFiles?.isNotEmpty == true)
                    ? multipleFiles![0]
                    : null;

                return GestureDetector(
                  onTap: () {
                    if (imageUrl != null) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: Image.network(
                            imageUrl,
                            errorBuilder: (context, error, stackTrace) {
                              return Text(
                                'Error loading image',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
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
                    fileName ?? 'No files',
                    style: TextStyle(
                      color: imageUrl != null ? Colors.blue : Colors.black,
                      fontSize: 13,
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
            child:
                //  Obx(
                //   () =>
                Text(
              "vbn",
              // '${controller.claimData.value.value?.claimCustomFields?.firstWhere((field) => field.name == "number-1710520358280-0").fieldValue}',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 13.sp,
                color: Color.fromARGB(255, 5, 4, 4),
              ),
            ),
          ),
          // ),
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
              'Share market teachers',
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
            child:
                //  Obx(
                //   () =>
                Text(
              "vbn",
              // '${controller.claimData.value.value?.claimCustomFields?.firstWhere((field) => field.name == "number-1710520358280-0").fieldValue}',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 13.sp,
                color: Color.fromARGB(255, 5, 4, 4),
              ),
            ),
          ),
          // ),
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
              'Losses',
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
            child:
                //  Obx(
                //   () =>
                Text(
              "vbn",
              // '${controller.claimData.value.value?.claimCustomFields?.firstWhere((field) => field.name == "number-1710520358280-0").fieldValue}',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 13.sp,
                color: Color.fromARGB(255, 5, 4, 4),
              ),
            ),
          ),
          // ),
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
              'Hello',
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
            child:
                //  Obx(
                //   () =>
                Text(
              "vbn",
              // '${controller.claimData.value.value?.claimCustomFields?.firstWhere((field) => field.name == "number-1710520358280-0").fieldValue}',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 13.sp,
                color: Color.fromARGB(255, 5, 4, 4),
              ),
            ),
          ),
          // ),
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
            child:
                //  Obx(
                //   () =>
                Text(
              "vbn",
              // '${controller.claimData.value.value?.claimCustomFields?.firstWhere((field) => field.name == "number-1710520358280-0").fieldValue}',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.bold,
                fontSize: 13.sp,
                color: Color.fromARGB(255, 5, 4, 4),
              ),
            ),
          ),
          // ),
        ],
      ),
    ]);
  }
}
