import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/campaign_calculatedpoints_programId/model/dropdown.dart';
import 'package:incentivesgit/presentation/rewards/rewards-landing/controller/reward-landing_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class RewardsScreen extends GetWidget<RewardsController> {
  const RewardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
          backgroundColor: appTheme.background,
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
            if (controller.product.isEmpty) {
              return const Center(child: Text('No Products'));
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.h),
                    data1(),
                    SizedBox(height: 20.h),
                    selectwallet(),
                    SizedBox(height: 19.h),
                    _filter(),
                    SizedBox(height: 20.h),
                    Text(
                      'Products',
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: appTheme.black600,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    _products(),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            );
          })),
    );
  }

  PreferredSizeWidget _customAppBar() {
    return AppBar(
      title: Text(
        "Rewards",
        style: TextStyle(
          color: appTheme.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
      ),
      backgroundColor: appTheme.rediconbackground,
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: SvgPicture.asset(
          ImageConstant.arrowback,
          width: 26.75.w,
          height: 19.76.h,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Text(
            'Wallet balance: ${controller.pointcount.value!.walval}',
            style: TextStyle(
              color: appTheme.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
        ),
      ],
      toolbarHeight: 106,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          child: Container(
            height: 40.h,
            decoration: BoxDecoration(
              color: appTheme.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    cursorColor: appTheme.black600,
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
          ),
        ),
      ),
    );
  }

  Widget data1() {
    return Container(
      height: 40.h,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12.h),
      decoration: BoxDecoration(
        color: appTheme.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: appTheme.grey500),
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'If you have any supercheques code please ',
              style: TextStyle(
                fontSize: 12.sp,
                color: appTheme.black600,
                fontWeight: FontWeight.w400,
                fontFamily: GoogleFonts.roboto().fontFamily,
              ),
            ),
            TextSpan(
              text: 'Click here.',
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.toNamed(AppRoutes.rewardssuperchequescredit);
                },
              style: TextStyle(
                fontSize: 12.sp,
                color: appTheme.blue50,
                fontWeight: FontWeight.w400,
                fontFamily: GoogleFonts.roboto().fontFamily,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget selectwallet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Wallet',
          style: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: appTheme.black600,
          ),
        ),
        SizedBox(height: 10.h),
        CustomDropdown<String?>(
          backgroundColor: appTheme.white,
          hintText: 'All',
          items: controller.walletData.value.typeLists
              .map((walletType) => walletType.typeName)
              .toSet()
              .toList(),
          value: null,
          onChanged: (value) {
            controller.selectedwallet.value = value;
          },
          getLabel: (String? value) {
            return '$value';
          },
        ),
      ],
    );
  }

  Widget _filter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Filter Criteria',
          style: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: appTheme.black600,
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Expanded(
              child: CustomDropdown<String?>(
                backgroundColor: appTheme.white,
                items: ['Points- High to low', 'Points- Low to high'],
                hintText: 'Sort by',
                value: null,
                onChanged: (value) {},
                getLabel: (String? value) {
                  return '$value';
                },
              ),
            ),
            SizedBox(width: 7.w),
            Expanded(
              child: CustomDropdown<String?>(
                backgroundColor: appTheme.white,
                items: controller.category,
                value: null,
                onChanged: (value) {
                  controller.selectedcategory.value = value;
                },
                getLabel: (String? value) {
                  return '$value';
                },
                hintText: 'Select Category',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _products() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 165 / 250,
      ),
      itemCount: controller.product.length,
      itemBuilder: (context, index) {
        return Container(
            decoration: BoxDecoration(
                color: appTheme.white, borderRadius: BorderRadius.circular(4)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  padding: const EdgeInsets.all(4),
                  child: Image.network(
                    controller.product[index].largeImageLink ?? '',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                    alignment: Alignment.center,
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                SizedBox(
                    width: 100,
                    child: Text(
                      controller.product[index].name ?? '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: appTheme.cyan800,
                      ),
                    )),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  'Reward Code:${controller.product[index].productCode}',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                    color: appTheme.greytextcolour,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  '${controller.product[index].newPoints.toString()} Points',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: appTheme.cyan800,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        backgroundColor: MaterialStatePropertyAll(
                            appTheme.rediconbackground),
                        fixedSize:
                            const MaterialStatePropertyAll(Size(98, 38))),
                    onPressed: () {
                      Get.toNamed(AppRoutes.product);
                    },
                    child: Text(
                      'Redeem',
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: appTheme.white,
                      ),
                    )),
                SizedBox(
                  height: 16.h,
                )
              ],
            ));
      },
    );
  }
}
