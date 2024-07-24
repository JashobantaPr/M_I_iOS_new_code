import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/rewards/supercheque/controller/supercheque_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/customTextField.dart';
import 'package:incentivesgit/widgets/dialoguebox1.dart';

class SuperChequeScreen extends GetWidget<SuperchequeController> {
  const SuperChequeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        appBar: _customAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _fieldData(),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Enter the code and click on \'Credit Points\'',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Poppins',
                  color: appTheme.greytextcolour,
                ),
              ),
              SizedBox(
                height: 31.h,
              ),
              Obx(() {
                if (controller.responsemsg.value.status != 'success') {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      controller.responsemsg.value.msg,
                      style: TextStyle(
                        color: Color(0xFFFF0000),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ),
                  );
                } else {
                  Future.delayed(Duration.zero, () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDialog1(
                          title: 'Success',
                          message: controller.responsemsg.value.msg,
                          onYesPressed: () {
                            Get.offNamed(AppRoutes.rewards);
                          },
                        );
                      },
                    );
                  });
                  return Container();
                }
              }),
              Obx(() {
                if (controller.errormsg.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      controller.errormsg.value,
                      style: TextStyle(
                        color: Color(0xFFFF0000),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              }),
              Divider(
                indent: BorderSide.strokeAlignCenter,
                color: appTheme.greydivider,
                thickness: 1,
              ),
              SizedBox(
                height: 20.h,
              ),
              Align(alignment: Alignment.center, child: _button())
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _customAppBar() {
    return AppBar(
      title: Text(
        "Enter Supercheque Code",
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
      labelText: 'Credit your supercheque',
      controller: controller.superchequecontroller,
      hintText: 'Enter',
    );
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
