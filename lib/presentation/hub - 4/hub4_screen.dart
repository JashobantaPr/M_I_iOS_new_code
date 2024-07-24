import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/hub%20-%204/controller/hub4_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/arcpainter.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Hub4Screen extends GetWidget<Hub4Controller> {
  const Hub4Screen({super.key});

  @override
 Widget build(BuildContext context) {
  return ScreenUtilInit(
    child: SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        backgroundColor: appTheme.grey,
        appBar: _customAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
            itemCount: 10, 
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildProfilePic(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    ),
  );
}

Widget _buildProfilePic() {
  return Expanded(
    child: Container(
      width: double.infinity,
      height: 480,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: Colors.transparent,
          width: 2,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.asset(
          ImageConstant.profilepic,
          fit: BoxFit.cover,
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
            width: 20.w,
            height: 10.h,
          ),
        ),
      ),
      title: Text(
        'Product Info',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: GoogleFonts.roboto().fontFamily,
          fontWeight: FontWeight.w500,
          fontSize: 20.sp,
          color: appTheme.white,
        ),
      ),
    );
  }
}
