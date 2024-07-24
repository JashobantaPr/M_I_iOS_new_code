import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/myBudget/mybudget_balance/controller/mybudget_balance_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class MyBudgetBalanceScreen extends GetWidget<MyBudgetBalanceController> {
  const MyBudgetBalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return Scaffold(
          backgroundColor: appTheme.background,
          appBar: _customAppBar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() {
                  return controller.isLoading.value
                      ? Center(
                          child: CircularProgressIndicator()) // Show loader
                      : Stack(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 150,
                                  width: double.maxFinite,
                                  color: appTheme.rediconbackground,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 27.h,
                                      ),
                                      Text(
                                        'Budget Balance',
                                        style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 18.sp,
                                          color: appTheme.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        controller.viewMyBalanceData.first.data!
                                            .totalMybudgetBalance
                                            .toString(),
                                        style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 36.sp,
                                          color: appTheme.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                              ],
                            ),
                            Positioned(
                              bottom: 0,
                              left: 10,
                              right: 10,
                              child: Container(
                                height: 60,
                                color: appTheme.white,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          controller
                                              .viewMyBalanceData
                                              .first
                                              .data!
                                              .totalMybudgetAllocated!
                                              .first
                                              .sum
                                              .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 14.sp,
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily,
                                            color: appTheme.redappbar,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        Text(
                                          'Budget Allocated',
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 10.sp,
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily,
                                            color: appTheme.black600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          controller
                                              .viewMyBalanceData
                                              .first
                                              .data!
                                              .totalMybudgetDistributed!
                                              .first
                                              .sum
                                              .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 14.sp,
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily,
                                            color: appTheme.redappbar,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        Text(
                                          'Budget Distributed',
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 10.sp,
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily,
                                            color: appTheme.black600,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          controller
                                              .viewMyBalanceData
                                              .first
                                              .data!
                                              .totalMybudgetExpired!
                                              .first
                                              .sum
                                              .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 14.sp,
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily,
                                            color: appTheme.redappbar,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        Text(
                                          'Budget Expired',
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 10.sp,
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily,
                                            color: appTheme.black600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                }),
                SizedBox(
                  height: 12.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: _searchBar(),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Obx(() {
                  return controller.isLoading.value
                      ? Center(child: CircularProgressIndicator())
                      : transaction();
                })
              ],
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
            ImageConstant.backarrow,
            width: 27.w,
            height: 18.h,
          ),
        ),
      ),
      title: Text(
        'My Budget',
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
            color: appTheme.white,
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(color: appTheme.white),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              cursorColor: appTheme.black600,
              showCursor: true,
              onChanged: (value) {
                controller.searchQuery.value = value;
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 10.w,
                ),
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

  Widget transaction() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.viewAllTrancitionData.length,
      itemBuilder: (context, index) {
        final transaction = controller.viewAllTrancitionData[index];
        return Container(
          height: 155.h,
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 10.h),
          decoration: BoxDecoration(
            color: appTheme.white,
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
                    _buildDataRow('Transaction Date', transaction.recorddate),
                    _buildDataRow('Description', transaction.description),
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
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8, right: 10),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          AppRoutes.mybudgetviewdetails,
                          arguments: transaction
                        );
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
