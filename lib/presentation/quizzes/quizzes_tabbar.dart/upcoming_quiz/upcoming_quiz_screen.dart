import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_tabbar.dart/upcoming_quiz/controller/upcoming_quiz_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class UpcomingQuizScreen extends GetWidget<UpcomingQuizController> {
  const UpcomingQuizScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10.w,
        right: 10.w,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          // var transaction = controller.filteredTransactions[index];
          // String? expiryDateString = transaction.expiryDate;
          // String? dateString = transaction.recorddate;
          // DateTime? expiryDate = transaction.expiryDate != null
          //     ? DateTime.tryParse(expiryDateString!)
          //     : null;
          // DateTime? date = transaction.recorddate != null
          //     ? DateTime.tryParse(dateString!)
          //     : null;
          // String formattedDate = expiryDate != null
          //     ? DateFormat('dd-MM-yyyy').format(expiryDate)
          //     : '';
          // String formattedrecordDate = date != null
          //     ? DateFormat('dd-MM-yyyy').format(date)
          //     : '';
          return Container(
            height: 125.h,
            width: double.infinity,
            margin: EdgeInsets.only(top: 10.h),
            decoration: BoxDecoration(
              color: appTheme.white,
              border: Border.all(color: appTheme.greybordercolour),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 15.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      _buildDataRow('Quiz Id', 'QID0008030'),
                      _buildDataRow('Quiz Name', 'Monthly'),
                      _buildDataRow('Start Time', '22 Mar 2024 10:45 AM'),
                      _buildDataRow('End Time', '23 Mar 2024 10:50 AM'),
                      _buildDataRow('Status', 'In Progress'),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    PopupMenuButton<String>(
                      position: PopupMenuPosition.under,
                      offset: const Offset(-13, 0),
                      itemBuilder: (
                        BuildContext context,
                      ) {
                        return [
                          PopupMenuItem<String>(
                            height: 25,
                            textStyle: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: appTheme.black600),
                            padding: EdgeInsets.only(
                                left: 10.w, right: 40.w, bottom: 8.h),
                            value: 'View Details',
                            onTap: () {
                              Get.toNamed(AppRoutes.quizDetailScreen);
                            },
                            child: const Text('View Details'),
                          ),
                        ];
                      },
                      icon: SvgPicture.asset(ImageConstant.morevert),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
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
          const Text(':'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                value,
                maxLines: 3,
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
          ),
        ],
      ),
    );
  }
}
