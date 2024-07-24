import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/campaign_calculatedpoints_programId/model/dropdown.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_tabbar.dart/quizzes/controller/quizzes_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class QuizzeScreen extends GetWidget<QuizzesController> {
  const QuizzeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: _searchBar(),
            ),
            SizedBox(
              height: 10.h,
            ),
            _buildCampaign(),
            SizedBox(
              height: 10.h,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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
                  margin: EdgeInsets.only(bottom: 10.h),
                  decoration: BoxDecoration(
                    color: appTheme.white,
                    border: Border.all(color: appTheme.greybordercolour),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 10.w),
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
                            _buildDataRow('Status', 'Completed'),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          PopupMenuButton<String>(
                            position: PopupMenuPosition.under,
                            offset: const Offset(-13, 0),
                            onSelected: (String value) {
                              if (value == 'View Details') {}
                            },
                            itemBuilder: (
                              BuildContext context,
                            ) {
                              return [
                                PopupMenuItem<String>(
                                  height: 25,
                                  textStyle: TextStyle(
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                      color: appTheme.black600),
                                  padding: EdgeInsets.only(
                                      left: 10.w, right: 40.w, bottom: 8.h),
                                  value: 'View Details',
                                  onTap: () {},
                                  child: const Text('View Details'),
                                ),
                              ];
                            },
                            icon: SvgPicture.asset(ImageConstant.morevert),
                          ),
                          const Spacer(),
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 8, right: 10),
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: appTheme.redappbar),
                                  fixedSize: const Size(57, 20),
                                  backgroundColor: Colors.red,
                                  shape: ContinuousRectangleBorder(
                                      borderRadius: BorderRadius.circular(0))),
                              child: const Text(
                                'Attempt',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCampaign() {
    return CustomDropdown<String?>(
      backgroundColor: appTheme.white,
      items: [],
      onChanged: (String? value) {},
      value: null,
      getLabel: (String? value) {
        return value ?? "All";
      },
      hintText: "All",
    );
  }

  Widget _searchBar() {
    return Container(
      height: 48.h,
      color: appTheme.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              cursorColor: appTheme.black600,
              onChanged: (value) {
                //   controller.searchQuery.value = value;
              },
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: appTheme.greybordercolour.withOpacity(1),
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: appTheme.greybordercolour,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                ),
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: appTheme.greytextcolour,
                ),
                suffixIcon: Container(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(
                    ImageConstant.search,
                    width: 19.24.w,
                    height: 19.24.h,
                  ),
                ),
              ),
            ),
          ),
        ],
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
