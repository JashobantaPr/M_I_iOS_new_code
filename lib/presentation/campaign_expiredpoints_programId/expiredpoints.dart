import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/campaign_earned_points/model/dropdown.dart';
import 'package:incentivesgit/presentation/campaign_expiredpoints_programId/controller/expiredpoints.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:intl/intl.dart';

class CampaignExpiredPointsScreen1
    extends GetWidget<CampaignExpiredPointsController1> {
  const CampaignExpiredPointsScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: SafeArea(
        top: true,
        bottom: true,
        child: Scaffold(
          appBar: _customAppBar(),
          backgroundColor: appTheme.white,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: Container(
                          width: 30.w,
                          height: 30.h,
                          padding: const EdgeInsets.all(5),
                          color: appTheme.rediconbackground,
                          child: SvgPicture.asset(ImageConstant.earnedpoints),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        'Total Expired Points: ${Get.arguments[0]['calculatedpayout'] ?? '0'}',
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            color: appTheme.black900,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  const Divider(),
                  SizedBox(height: 10.h),
                  Text(
                    'Filter Criteria',
                    style: TextStyle(
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: appTheme.black900),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 2,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5.h),
                              Text(
                                'Year',
                                style: TextStyle(
                                  fontFamily: GoogleFonts.roboto().fontFamily,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.normal,
                                  color: appTheme.greytextcolour,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              _buildYear(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  _searchBar(),
                  SizedBox(height: 10.h),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return const Center(
                        child: SpinKitFadingCircle(
                          color: Colors.black,
                          size: 50.0,
                        ),
                      );
                    }
                    if (controller.transactions.isEmpty) {
                      return const Center(child: Text('No expired points'));
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.filteredTransactions.length,
                      itemBuilder: (context, index) {
                        var transaction =
                            controller.filteredTransactions[index];
                        String? expiryDateString = transaction.expiryDate;
                        String? dateString = transaction.recorddate;
                        DateTime? expiryDate = transaction.expiryDate != null
                            ? DateTime.tryParse(expiryDateString!)
                            : null;
                        DateTime? date = transaction.recorddate != null
                            ? DateTime.tryParse(dateString!)
                            : null;
                        String formattedDate = expiryDate != null
                            ? DateFormat('dd-MM-yyyy').format(expiryDate)
                            : '';
                        String formattedrecordDate = date != null
                            ? DateFormat('dd-MM-yyyy').format(date)
                            : '';
                        return Container(
                          height: 120.h,
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 10.h),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: appTheme.greybordercolour),
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
                                    _buildDataRow('Transaction Id',
                                        transaction.transactionCode ?? ''),
                                    _buildDataRow('Campaign Name',
                                        transaction.programName ?? ''),
                                    _buildDataRow('Date', formattedrecordDate),
                                    _buildDataRow('Expiry Date', formattedDate),
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8, right: 10),
                                    child: Text(
                                      '+${controller.transactions[index].points}',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: appTheme.green,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8, right: 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            AppRoutes.campaignearnedviewdetails,
                                            arguments: controller
                                                .transactions[index]
                                                .transactionHeaderIdPk);
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
                  })
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
            width: 27.w,
            height: 18.h,
          ),
        ),
      ),
      title: Text(
        'Earned Points',
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

  Widget _buildYear() {
    return Obx(() {
      return CustomDropdown<String?>(
        items: controller.year,
        onChanged: (String? value) {
          controller.yearValue(value);
        },
        value: controller.yearValue.value,
        getLabel: (String? value) {
          return value != null ? value.toString() : "All";
        },
        hintText: "All",
      );
    });
  }

  Widget _searchBar() {
    return SizedBox(
      height: 48.h,
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

  Widget _buildDataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                value,
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
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
