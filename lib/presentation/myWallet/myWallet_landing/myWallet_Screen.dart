import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/myWallet/myWallet_landing/controller/myWallet_landing_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/optioncard1.dart';

class MyWalletScreen extends GetWidget<MyWalletController> {
  const MyWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          appBar: _customAppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: appTheme.rediconbackground,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            ImageConstant.myWallet,
                            width: 14,
                            height: 13,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        'Wallet Balance: 2,000',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            color: appTheme.black900,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Divider(
                    color: appTheme.greydivider,
                    indent: BorderSide.strokeAlignCenter,
                    thickness: 1,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Select individual wallet for more details.',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        color: appTheme.black900,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 8.h),
                  GestureDetector(
                    onTap: () {
                      // Toggle dropdown visibility
                      controller.toggleDropdownVisibility();
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              controller.selectedValue.value ?? 'Select Wallet',
                              style: TextStyle(fontSize: 16),
                            ),
                            Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Obx(
                    () => controller.isDropdownVisible.value
                        ? SizedBox(
                            height: 200, // Adjust the height as per your design
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.items.length,
                              itemBuilder: (context, index) {
                                var item = controller.items[index];
                                return GestureDetector(
                                  onTap: () {
                                    controller.selectedValue.value = item;
                                    controller.toggleDropdownVisibility();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 12),
                                    child: Text(item),
                                  ),
                                );
                              },
                            ),
                          )
                        : SizedBox.shrink(),
                  ),
                  Obx(() {
                    return controller.selectedValue.value == null
                        ? Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 73),
                                child: Center(
                                  child: Container(
                                    width: 98.w,
                                    height: 98.h,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: appTheme.grey500,
                                    ),
                                    child: ClipOval(
                                      child: Padding(
                                        padding: const EdgeInsets.all(20),
                                        child: SvgPicture.asset(
                                          ImageConstant.noWallet,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 15.h),
                              Text(
                                'No data found please select the Wallet',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                    fontFamily: GoogleFonts.roboto().fontFamily,
                                    color: appTheme.greytextcolour),
                              )
                            ],
                          )
                        : Flexible(
                            child: DefaultTabController(
                              length: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 23.h),
                                  Text(
                                    'Financial year:${controller.viewMyWalletdata.first.data!.from}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.sp,
                                        fontFamily:
                                            GoogleFonts.roboto().fontFamily,
                                        color: appTheme.black900),
                                  ),
                                  SizedBox(height: 10.h),
                                  pointsData(),
                                  SizedBox(
                                    height: 28.h,
                                  ),
                                  TabBar(
                                    labelColor: appTheme.black900,
                                    labelStyle: TextStyle(
                                        fontSize: 12.sp,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontWeight: FontWeight.bold),
                                    unselectedLabelColor:
                                        appTheme.greytextcolour,
                                    indicatorColor: appTheme.redappbar,
                                    indicatorSize: TabBarIndicatorSize.tab,
                                    dividerColor: appTheme.greydivider,
                                    tabs: const [
                                      Tab(text: 'View all Transaction'),
                                      Tab(text: 'Points for Received Order'),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 400,
                                    child: TabBarView(
                                      children: [
                                        transaction(),
                                        receivedOrder(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                  })
                ],
              ),
            ),
          ),
        );
      },
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
            width: 27.w,
            height: 18.h,
          ),
        ),
      ),
      title: Text(
        'My Wallet',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: GoogleFonts.roboto().fontFamily,
          fontWeight: FontWeight.w600,
          fontSize: 20.sp,
          color: appTheme.white,
        ),
      ),
    );
  }

  Widget pointsData() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.campaignredeemedprogramId);
              },
              child: Obx(() {
                if (controller.viewMyWalletdata.isNotEmpty) {
                  return OptionCard1(
                    imagePath: ImageConstant.earnedpoints,
                    points: controller.viewMyWalletdata.first.data!
                        .totalReceviedOrderPoint!.totalpoint
                        .toString(),
                    text: 'Earned Points',
                  );
                } else {
                  return OptionCard1(
                    imagePath: ImageConstant.earnedpoints,
                    points: '0', // or any default value
                    text: 'Earned Points',
                  );
                }
              }),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.campaignredeemedprogramId);
              },
              child: Obx(() {
                if (controller.viewMyWalletdata.isNotEmpty) {
                  return OptionCard1(
                    imagePath: ImageConstant.redeemedpoints,
                    points: controller.viewMyWalletdata.first.data!
                        .totalMywalletReedemed!.first.points
                        .toString(),
                    text: 'Redeemed Points',
                  );
                } else {
                  return OptionCard1(
                    imagePath: ImageConstant.redeemedpoints,
                    points: '0', // or any default value
                    text: 'Redeemed Points',
                  );
                }
              }),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.campaignredeemedprogramId);
              },
              child: Obx(() {
                if (controller.viewMyWalletdata.isNotEmpty) {
                  return OptionCard1(
                    imagePath: ImageConstant.expiredpoints,
                    points: controller.viewMyWalletdata.first.data!
                        .totalMybudgetExpired!.first.sum
                        .toString(),
                    text: 'Expired Points',
                  );
                } else {
                  return OptionCard1(
                    imagePath: ImageConstant.expiredpoints,
                    points: '0', // or any default value
                    text: 'Expired Points',
                  );
                }
              }),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.campaignredeemedprogramId);
              },
              child: Obx(() {
                if (controller.viewMyWalletdata.isNotEmpty) {
                  return OptionCard1(
                    imagePath: ImageConstant.balancepoints,
                    points: controller
                        .viewMyWalletdata.first.data!.totalMywalletBalance!.sum
                        .toString(),
                    text: 'Balance Points',
                  );
                } else {
                  return OptionCard1(
                    imagePath: ImageConstant.balancepoints,
                    points: '0', // or any default value
                    text: 'Balance Points',
                  );
                }
              }),
            ),
          ],
        ),
      ],
    );
  }

  Widget transaction() {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        _searchBar(),
        SizedBox(
          height: 10.h,
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: controller.viewAllTrancitionData.length,
            itemBuilder: (context, index) {
              final transaction = controller.viewAllTrancitionData[index];
              return Container(
                height: 155.h,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 10.h),
                decoration: BoxDecoration(
                  border: Border.all(color: appTheme.greybordercolour),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 3,
                      height: double.infinity,
                      color: Colors.green,
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          _buildDataRow(
                              'Transaction Id', transaction.transactionCode),
                          _buildDataRow(
                              'Transaction Date', transaction.recorddate),
                          _buildDataRow(
                              'Description', transaction.bucketDescription),
                          _buildDataRow('From', transaction.fromUsername),
                          _buildDataRow('To', transaction.toUsername),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8, right: 10),
                          child: Text(
                            transaction.debit.toString(),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: appTheme.green,
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8, right: 10),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.selectwalletviewdetails,
                                  arguments: transaction);
                            },
                            child: Text(
                              'View Details',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: appTheme.blue50,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget receivedOrder() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.h,
        ),
        _search(),
        SizedBox(
          height: 10.h,
        ),
        Text(
          'Total points under received orders: 500',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 12.sp,
              color: appTheme.black600),
        ),
        SizedBox(
          height: 10.h,
        ),
        // Expanded(
        //   child: ListView.builder(
        //     shrinkWrap: true,
        //     physics: const AlwaysScrollableScrollPhysics(),
        //     itemCount: 5,
        //     itemBuilder: (context, index) {
        //       return Container(
        //         height: 155.h,
        //         width: double.infinity,
        //         margin: EdgeInsets.only(bottom: 10.h),
        //         decoration: BoxDecoration(
        //           border: Border.all(color: appTheme.greybordercolour),
        //         ),
        //         child: Row(
        //           crossAxisAlignment: CrossAxisAlignment.start,
        //           children: [
        //             Container(
        //               width: 3,
        //               height: double.infinity,
        //               color: Colors.green,
        //             ),
        //             SizedBox(width: 10.w),
        //             Expanded(
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   SizedBox(
        //                     height: 5.h,
        //                   ),
        //                   _buildDataRow('Transaction Id', 'T000002315 '),
        //                   _buildDataRow('Transaction Date', '18-11-2019 '),
        //                   _buildDataRow(
        //                       'Description', 'Points expired from wallet'),
        //                   _buildDataRow('From', 'Roopa Rao'),
        //                   _buildDataRow('To', 'Chetana Shelar'),
        //                 ],
        //               ),
        //             ),
        //             Column(
        //               crossAxisAlignment: CrossAxisAlignment.end,
        //               mainAxisAlignment: MainAxisAlignment.end,
        //               children: [
        //                 Padding(
        //                   padding: const EdgeInsets.only(bottom: 8, right: 10),
        //                   child: GestureDetector(
        //                     onTap: () {
        //                       Get.toNamed(
        //                           AppRoutes.pointsreceivedorderviewdetails);
        //                     },
        //                     child: Text(
        //                       'View Details',
        //                       style: TextStyle(
        //                         fontSize: 14.sp,
        //                         fontWeight: FontWeight.bold,
        //                         color: appTheme.blue50,
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             )
        //           ],
        //         ),
        //       );
        //     },
        //   ),
        // ),
      ],
    );
  }

  Widget _searchBar() {
    return SizedBox(
      height: 40.h,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              cursorColor: appTheme.black600,
              onChanged: (value) {
                controller.searchQuery.value = value;
              },
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: appTheme.greybordercolour.withOpacity(1),
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: appTheme.greybordercolour,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                hintText: 'Search Transaction',
                hintStyle: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: appTheme.greytextcolour,
                ),
                suffixIcon: Container(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    ImageConstant.search,
                    width: 19.24.w,
                    height: 19.24.h,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _search() {
    return SizedBox(
      height: 40.h,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              cursorColor: appTheme.black600,
              onChanged: (value) {
                controller.searchQuery.value = value;
              },
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: appTheme.greybordercolour.withOpacity(1),
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: appTheme.greybordercolour,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: appTheme.greytextcolour,
                ),
                suffixIcon: Container(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    ImageConstant.search,
                    width: 19.24.w,
                    height: 19.24.h,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              width: 104.w,
              child: Text(
                label,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 12.sp,
                    color: appTheme.black600,
                    fontWeight: FontWeight.normal),
              )),
          const Text(':'),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                value,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 12.sp,
                    color: appTheme.black600,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
