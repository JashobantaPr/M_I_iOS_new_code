import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/type_A_view_details/controller/view_details_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:get/get.dart';

class ViewDetailsForAchivementsScreen
    extends GetWidget<ViewDetailsForAchivementsController> {
  const ViewDetailsForAchivementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.white,
        appBar: AppBar(
          title: const Text(
            "View Details for Achievements",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color(0XFFE41C39),
          iconTheme: const IconThemeData(color: Colors.white),
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
        ),
        body: Obx(() {
          if (controller.achievements.value == null) {
            return const Center(
              child: SpinKitFadingCircle(
                color: Colors.black,
                size: 50.0,
              ),
            );
          }

          final achievements = controller.achievements.value!;
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              height: 490,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                        ),
                        Text(
                          'Achievements',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    thickness: 1,
                    color: Colors.grey[400],
                    height: 10,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        children: [
                          if (achievements.desc1?.isNotEmpty ?? false) ...[
                            _buildDataRow(
                              achievements.desc1!,
                              (double.tryParse(achievements.achievement1
                                              ?.toString() ??
                                          '')
                                      ?.toStringAsFixed(0)) ??
                                  '',
                            ),
                            SizedBox(height: 10),
                          ],
                          if (achievements.desc2?.isNotEmpty ?? false) ...[
                            _buildDataRow(
                              achievements.desc2!,
                              (double.tryParse(achievements.achievement2
                                              ?.toString() ??
                                          '')
                                      ?.toStringAsFixed(0)) ??
                                  '',
                            ),
                            SizedBox(height: 10),
                          ],
                          if (achievements.desc3?.isNotEmpty ?? false) ...[
                            _buildDataRow(
                              achievements.desc3!,
                              (double.tryParse(achievements.achievement3
                                              ?.toString() ??
                                          '')
                                      ?.toStringAsFixed(0)) ??
                                  '',
                            ),
                            SizedBox(height: 10),
                          ],
                          if (achievements.desc4?.isNotEmpty ?? false) ...[
                            _buildDataRow(
                              achievements.desc4!,
                              (double.tryParse(achievements.achievement4
                                              ?.toString() ??
                                          '')
                                      ?.toStringAsFixed(0)) ??
                                  '',
                            ),
                            SizedBox(height: 10),
                          ],
                          if (achievements.desc5?.isNotEmpty ?? false) ...[
                            _buildDataRow(
                              achievements.desc5!,
                              (double.tryParse(achievements.achievement5
                                              ?.toString() ??
                                          '')
                                      ?.toStringAsFixed(0)) ??
                                  '',
                            ),
                            SizedBox(height: 10),
                          ],
                          if (achievements.desc6?.isNotEmpty ?? false) ...[
                            _buildDataRow(
                              achievements.desc6!,
                              (double.tryParse(achievements.achievement6
                                              ?.toString() ??
                                          '')
                                      ?.toStringAsFixed(0)) ??
                                  '',
                            ),
                            SizedBox(height: 10),
                          ],
                          if (achievements.desc7?.isNotEmpty ?? false) ...[
                            _buildDataRow(
                              achievements.desc7!,
                              (double.tryParse(achievements.achievement7
                                              ?.toString() ??
                                          '')
                                      ?.toStringAsFixed(0)) ??
                                  '',
                            ),
                            SizedBox(height: 10),
                          ],
                          if (achievements.desc8?.isNotEmpty ?? false) ...[
                            _buildDataRow(
                              achievements.desc8!,
                              (double.tryParse(achievements.achievement8
                                              ?.toString() ??
                                          '')
                                      ?.toStringAsFixed(0)) ??
                                  '',
                            ),
                            SizedBox(height: 10),
                          ],
                          if (achievements.desc9?.isNotEmpty ?? false) ...[
                            _buildDataRow(
                              achievements.desc9!,
                              (double.tryParse(achievements.achievement9
                                              ?.toString() ??
                                          '')
                                      ?.toStringAsFixed(0)) ??
                                  '',
                            ),
                            SizedBox(height: 10),
                          ],
                          if (achievements.desc10?.isNotEmpty ?? false) ...[
                            _buildDataRow(
                              achievements.desc10!,
                              (double.tryParse(achievements.achievement10
                                              ?.toString() ??
                                          '')
                                      ?.toStringAsFixed(0)) ??
                                  '',
                            ),
                            SizedBox(height: 10),
                          ],
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: const Color.fromARGB(255, 218, 213, 213),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                          Text(
                            (double.tryParse(achievements.totalAchievement
                                            ?.toString() ??
                                        '')
                                    ?.toStringAsFixed(2)) ??
                                '',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildDataRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            value,
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 12.sp,
              color: appTheme.black600,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
