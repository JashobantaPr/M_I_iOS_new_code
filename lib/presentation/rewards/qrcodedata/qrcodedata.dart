import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/rewards/qrcodedata/controller/qrcode_data_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/customTextField.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeDataScreen extends GetWidget<QRCodeDataController> {
  const QRCodeDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        backgroundColor: appTheme.background,
        appBar: _customAppBar(),
        body: Padding(
          padding: EdgeInsets.only(left: 10.w, right: 10.w, top: 16.h),
          child: Container(
            height: 581,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: appTheme.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 28.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: QrImageView(
                    data: 'Scan',
                    size: 224,
                    embeddedImageStyle: const QrEmbeddedImageStyle(
                      size: Size(
                        224,
                        225,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 28.h,
                ),
                _fieldData(),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Click on " Credit Points"',
                  style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Poppins',
                      color: appTheme.greytextcolour),
                ),
                SizedBox(
                  height: 31.h,
                ),
                Divider(
                  indent: BorderSide.strokeAlignCenter,
                  color: appTheme.greydivider,
                  thickness: 1,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Align(alignment: Alignment.center, child: _button()),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      'Scan Again',
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          color: appTheme.blue50),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _customAppBar() {
    return AppBar(
      title: Text(
        "Scan QR Code",
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
    );
  }

  Widget _fieldData() {
    return CustomTextField(
        readOnly: true,
        backgroundColor: appTheme.grey500,
        labelText: 'supercheque Code',
        hintText: '${controller.qrCode}');
  }

  Widget _button() {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
            ),
            backgroundColor:
                MaterialStatePropertyAll(appTheme.rediconbackground),
            fixedSize: const MaterialStatePropertyAll(Size(134, 40))),
        onPressed: () {
          if (controller.responsemsg.value.status == 'success') {
            controller.superCheque();
          } else {
            controller.superCheque();
          }
        },
        child: Text(
          'Credit Points',
          style: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: appTheme.white,
          ),
        ));
  }
}
