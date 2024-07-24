import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/myOrders/myorder/controller/myOrderController.dart';
import 'package:incentivesgit/presentation/myOrders/myorder/models/myorders.model.dart';

import 'package:incentivesgit/theme/theme_helper.dart';

import 'widgets/myorder_widget.dart';

class MyOrderScreen extends GetWidget<MyOrderController> {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: appTheme.redappbar));

    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) {
        return Scaffold(
          appBar: _customAppBar(),
          body: Container(
            width: 1.sw,
            color: appTheme.grey500,
            child: Padding(
              padding: EdgeInsets.all(14.0.w),
              child: Obx(() => ListView.builder(
                    itemCount: controller.myOdersList!
                        .length, // Replace with the actual number of items
                    itemBuilder: (context, index) {
                      MyOrdersModel item = controller.myOdersList![index];
                      return MyOrderWidget(item: item);

                      // Column(
                      //   children: [
                      //     _buildOrderContainer(item),

                      //     // Replace 4 with itemCount - 1
                      //     SizedBox(height: 10.h),
                      //     Divider(
                      //       color: appTheme.gray500,
                      //       thickness: 1.0,
                      //     ),
                      //   ],
                      // );
                    },
                  )),
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
        'My order',
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
}
