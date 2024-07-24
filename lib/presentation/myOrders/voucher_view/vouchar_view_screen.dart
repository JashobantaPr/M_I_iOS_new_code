import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/theme/custom_text_style.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

import '../../../core/utils/image_constant.dart';
import '../../../widgets/vouchar_text.dart';
import 'controller/vouchar_view_controller.dart';

class VoucharViewScreen extends GetWidget<VoucharViewController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: appTheme.gray100,
      appBar: _customAppBar(),
      body: Column(
        children: [
          _buildVoucherDetails(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: appTheme.white,
                ),
                child: _buildDescription()),
          ),
        ],
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
            ImageConstant.backarrow,
            width: 27.w,
            height: 18.h,
          ),
        ),
      ),
      title: Text(
        'Voucher Details',
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

  //Widget VoucherDetails

  Widget _buildVoucherDetails() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4), color: Colors.white),
        child: Column(
          children: [
            VowcharText(
                text: "Product Code",
                subText: controller.myordercontroller.voucherDetails?.value
                        .order?.productCode ??
                    ""),
            VowcharText(
              text: "Product",
              subText: controller.myordercontroller.voucherDetails?.value.order
                      ?.productName ??
                  "",
            ),
            VowcharText(
              text: "Vouchars Key",
              subText: controller.myordercontroller.voucherDetails?.value
                      .vouchers?.evDetails?.first.evoucherKey ??
                  "",
            ),
            VowcharText(
              text: "Pin",
              subText: controller.myordercontroller.voucherDetails?.value
                      .vouchers?.evDetails?.first.pin ??
                  "",
            ),
            VowcharText(
              text: "valitity Date",
              subText: controller.myordercontroller.voucherDetails?.value
                      .vouchers?.evDetails?.first.validityDate ??
                  "",
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3.0),
      child: Container(
        height: 400,
        color: Colors.white,
        padding: EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: appTheme.greydownarrow,
                    size: 30,
                  ), // Down arrow icon
                ),
              ],
            ),
            Divider(
              color: appTheme.gray500,
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.topLeft,
                child: SingleChildScrollView(
                  child: Text(
                    controller.myordercontroller.voucherDetails?.value.order
                            ?.descr ??
                        "",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontFamily: GoogleFonts.poppins().fontFamily,
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

  Widget _buildNOText() {
    return Text("No VouChar Details");
  }
}
