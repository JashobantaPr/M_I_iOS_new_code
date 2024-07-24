import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:popover/popover.dart';

class PopoverButton extends StatelessWidget {
  const PopoverButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showPopover(
          arrowDyOffset: 10,
          backgroundColor: appTheme.black900,
          context: context,
          bodyBuilder: (context) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 8.0, top: 12, bottom: 12, left: 14.5),
                  child: Text(
                    'The points associated with the orders in received status are not used in the calculation.',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal,
                      fontSize: 10.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, right: 12.5),
                child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Image.asset(
                      ImageConstant.cancel,
                      width: 12.93,
                      height: 12.93,
                    )),
              ),
            ],
          ),
          direction: PopoverDirection.top,
          width: 260.w,
          height: 70,
          arrowHeight: 15,
          arrowWidth: 30,
        );
      },
      child: Icon(
        Icons.info_outline_rounded,
        size: 23.sp,
        color: const Color.fromRGBO(109, 109, 109, 1),
      ),
    );
  }
}
