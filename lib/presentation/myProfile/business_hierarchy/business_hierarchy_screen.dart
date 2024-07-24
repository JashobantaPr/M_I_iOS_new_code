import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/myProfile/business_hierarchy/controller/business_hieararchy_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class BusinessHierarchyScreen extends GetWidget<BusinessHierarchyController> {
  const BusinessHierarchyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        backgroundColor: appTheme.background,
        appBar: _customAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildRow('Sr No.', 'Hierarchy', isHeader: true),
              const SizedBox(height: 5),
              Expanded(
                child: Obx(
                  () => ListView.builder(
                    itemCount: controller.myHierarchy.length,
                    itemBuilder: (context, index) {
                      final item = controller.myHierarchy[index];
                      final hierarchy = [
                        item.level1,
                        item.level2,
                        item.level3,
                        item.level4,
                      ].where((e) => e != null).join(' > ');
                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        child: buildRow('${index + 1}', hierarchy),
                      );
                    },
                  ),
                ),
              ),
            ],
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
            ImageConstant.backarrow,
            width: 27.w,
            height: 18.h,
          ),
        ),
      ),
      title: Text(
        'Business Hierarchy',
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

  Widget buildRow(String serial, String hierarchy, {bool isHeader = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 60,
          height: 48,
          child: buildContainer(serial, isHeader),
        ),
        const SizedBox(width: 8),
        Expanded(
          child:
              SizedBox(height: 48, child: buildContainer(hierarchy, isHeader)),
        ),
      ],
    );
  }

  Widget buildContainer(String text, bool isHeader,
      {double width = double.infinity, double height = 20}) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.only(left: 14.w),
      alignment: Alignment.centerLeft,
      transformAlignment: Alignment.center,
      constraints: BoxConstraints(maxWidth: width),
      decoration: BoxDecoration(
        color: appTheme.white,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isHeader ? Colors.black : appTheme.black600,
          fontSize: 12,
          fontFamily: GoogleFonts.poppins().fontFamily,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.w400,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }
}
