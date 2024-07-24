import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myOrders/myorder/models/myorders.model.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

import '../controller/myOrderController.dart';

class MyOrderWidget extends StatelessWidget {
  const MyOrderWidget({super.key, required this.item});
  final MyOrdersModel item;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MyOrderController>();
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.myordersviewdetails, arguments: {
          "Wallet type": item.walletTypeName,
          "Wallet Name": item.walletName,
          "Product Code": item.productCode,
          "Product Name": item.productName,
          "product Category": item.productCategory,
          "order Quantity": item.quantity,
          "reward Value": item.points,
          "total Points": item.tdsPoint,
          "value Status": item.ordersStatus,
          "comments": item.transactionComment,
        });
        controller.onChangeOrderId(item.orderRequestNo);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        height: 170.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(3.r)),
        ),
        child: Row(
          children: [
            Container(
              width: 120.w,
              height: 120.h,
              decoration: BoxDecoration(
                color: Colors.grey, // Placeholder color for the image
                borderRadius: BorderRadius.circular(3.r),
                image: DecorationImage(
                  image: NetworkImage(item.smallImageLink ?? ""),
                  // Replace with your image URL

                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.productName ?? ""),
                  _buildBudgetHistory(
                      'Order placed on', ':', item.orderPlacedBy ?? ""),
                  SizedBox(height: 2.h),
                  _buildBudgetHistory('Order id', ':', item.orderTypeId ?? ""),
                  SizedBox(height: 2.h),
                  _buildBudgetHistory('Quantity', ':', item.quantity ?? ""),
                  SizedBox(height: 2.h),
                  _buildBudgetHistory(
                      'Wallet Name', ':', item.walletName ?? ""),
                  SizedBox(height: 2.h),
                  _buildBudgetHistory(
                      'Total Value', ':', item.productPoints ?? ""),
                  _buildBudgetHistory('Status', ':', item.ordersStatus ?? ""),
                  _buildBudgetHistory(
                      'Ship To', ':', item.ordersShipToName ?? ""),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBudgetHistory(String label1, String separator, String label2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80.w, // Adjust the width as needed
          child: Text(
            label1,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: appTheme.black600,
            ),
          ),
        ),
        Text(
          separator,
          style: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            fontFamily: GoogleFonts.poppins().fontFamily,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            label2,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.poppins().fontFamily,
              color: appTheme.black600,
            ),
          ),
        ),
      ],
    );
  }
}
