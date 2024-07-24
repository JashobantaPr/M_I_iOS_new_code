import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/model/gridItem.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/campaign_details_card_progressbar/controller/campaigndetailscardscreenprogressbarcontroller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/popupview.dart';
import 'package:intl/intl.dart';

class CampaignDetailsCardProgressBarScreen
    extends GetWidget<CampaignDetailsCardProgressbarController> {
  const CampaignDetailsCardProgressBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
          backgroundColor: appTheme.background,
          appBar: _customAppBar(),
          body: Obx(() {
            if (controller.isLoading.value) {
              return const Center(
                child: SpinKitFadingCircle(
                  color: Colors.black,
                  size: 50.0,
                ),
              );
            }
            if (controller.leaderBoardResponse.value == null) {
              return const Center(
                child: Text('No data available'),
              );
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, right: 10, left: 7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${controller.terminologytext} Points Dashboard',
                            style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                              color: const Color.fromRGBO(25, 25, 25, 1),
                            ),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          const PopoverButton()
                        ],
                      ),
                    ),
                    points(),
                    const SizedBox(height: 20),
                    _performanceSection(),
                    const SizedBox(height: 10),
                    _kpiListSection(),
                    Text(
                      'Basic Information',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          color: appTheme.black600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _basicInformationSection(),
                  ],
                ),
              ),
            );
          })),
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
            width: 27.w,
            height: 18.h,
          ),
        ),
      ),
      title: Text(
        'Campaign Details',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: GoogleFonts.roboto().fontFamily,
          fontWeight: FontWeight.w600,
          fontSize: 20.sp,
          color: appTheme.white,
        ),
      ),
    );
  }

  Widget _performanceSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'My Performance',
          style: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
            color: appTheme.black900,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.myprogressbar,
                arguments: controller
                    .leaderBoardResponse.value.programDetails![0].programId);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Text(
              'View all',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
                color: appTheme.blue50,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _kpiListSection() {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: 10),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.kpiList.take(4).toList().length,
      itemBuilder: (context, index) {
        return qualifiedleads(index);
      },
    );
  }

  Widget _basicInformationSection() {
    String? startDateString =
        controller.leaderBoardResponse.value.programDetails![0].startDate;
    DateTime? startDate = DateTime.tryParse(startDateString!);
    String formattedDate =
        startDate != null ? DateFormat('dd-MM-yyyy').format(startDate) : '';
    String? endDateString =
        controller.leaderBoardResponse.value.programDetails![0].endDate;
    DateTime? endDate = DateTime.tryParse(endDateString!);
    String formattedDate1 =
        endDate != null ? DateFormat('dd-MM-yyyy').format(endDate) : '';

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: appTheme.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _basicinformation(
              '${controller.terminologytext} Name',
              controller.leaderBoardResponse.value.programDetails!.isNotEmpty
                  ? controller
                          .leaderBoardResponse.value.programDetails![0].name ??
                      ''
                  : 'No Campaign Name Available'),
          _basicinformation(
              '${controller.terminologytext} id',
              controller.leaderBoardResponse.value.programDetails!.isNotEmpty
                  ? controller.leaderBoardResponse.value.programDetails![0]
                          .programCode ??
                      ''
                  : 'No Campaign Name Available'),
          _basicinformation(
              'Start Date',
              controller.leaderBoardResponse.value.programDetails!.isNotEmpty
                  ? formattedDate
                  : 'No Campaign Name Available'),
          _basicinformation(
              'End Date',
              controller.leaderBoardResponse.value.programDetails!.isNotEmpty
                  ? formattedDate1
                  : 'No Campaign Name Available'),
          if (controller.leaderBoardResponse.value.programDetails!.isNotEmpty &&
              controller
                      .leaderBoardResponse.value.programDetails![0].bannerUrl !=
                  null)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 120.w,
                    child: Text(
                      '${controller.terminologytext}\n Bananer',
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(25, 25, 25, 1)),
                    ),
                  ),
                ),
                const Text(':'),
                Image.network(
                  Url.imageUrl +
                      controller.leaderBoardResponse.value.programDetails![0]
                          .bannerUrl!,
                  width: 150,
                  height: 50,
                  errorBuilder: (context, error, stackTrace) {
                    return const Text('Error loading banner image');
                  },
                ),
              ],
            )
          else
            _basicinformation('Banner', 'No Banner Available'),
          _basicinformation(
              'Description',
              controller.leaderBoardResponse.value.programDetails!.isNotEmpty
                  ? controller.leaderBoardResponse.value.programDetails![0]
                          .description ??
                      ''
                  : 'No Campaign Name Available'),
          _basicinformation(
              'Owner',
              controller.leaderBoardResponse.value.programOwners!.isNotEmpty
                  ? controller
                          .leaderBoardResponse.value.programOwners![0].name ??
                      ''
                  : 'No Campaign Owner Available'),
          _basicinformation(
              'Co-Owners',
              controller.leaderBoardResponse.value.programCoOwners!.isNotEmpty
                  ? controller
                          .leaderBoardResponse.value.programCoOwners![0].name ??
                      ''
                  : 'No Campaign Co-Owner Available'),
          _basicinformation(
              'Points Owners',
              controller.leaderBoardResponse.value.programCoOwners!.isNotEmpty
                  ? controller.leaderBoardResponse.value.programPointOwners![0]
                          .name ??
                      ''
                  : 'No Campaign Co-Owner Available'),
          _basicinformation(
              'Sponsor Name',
              controller.leaderBoardResponse.value.programCoOwners!.isNotEmpty
                  ? controller
                          .leaderBoardResponse.value.sponsorId!.sponsorName ??
                      ''
                  : 'No Campaign Co-Owner Available'),
        ],
      ),
    );
  }

  Widget _basicinformation(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120.w,
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
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.left,
              maxLines: 3,
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
      ),
    );
  }

  Widget qualifiedleads(int index) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: appTheme.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 10.sp,
                  color: appTheme.black600,
                ),
                children: [
                  TextSpan(
                    text: controller.kpiList[index].kpiName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.sp,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: appTheme.black900,
                    ),
                  ),
                  TextSpan(
                    text: '(in ${controller.kpiList[index].kpiUnit})',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: appTheme.black900,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '${controller.kpiList[index].kpiAchievementValue > 1000 ? '${(controller.kpiList[index].kpiAchievementValue / 1000).toStringAsFixed(2)}k' : controller.kpiList[index].kpiAchievementValue} / ${controller.kpiList[index].kpiTargetValue}',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                  color: appTheme.black900,
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            SizedBox(
              height: 4.h,
              width: double.maxFinite,
              child: LinearProgressIndicator(
                value: controller.kpiList[index].kpiAchievementValue /
                    controller.kpiList[index].kpiTargetValue,
                borderRadius: BorderRadius.circular(5),
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(
                  controller.kpiList[index].kpiAchievementValue >=
                          controller.kpiList[index].kpiTargetValue
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            ),
            SizedBox(
              height: 11.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Your Rank:',
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.normal,
                        fontSize: 10.sp,
                        color: appTheme.greytextcolour,
                      ),
                    ),
                    Text(
                      ' ${controller.kpiList[index].kpiRank}',
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp,
                        color: appTheme.black600,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 18.h,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(227, 245, 222, 1),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  child: Text(
                    '${controller.kpiList[index].kpiPercentage}%',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: appTheme.green1,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget points() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.typedcalculatedpoints, arguments: [
                  {
                    'calculatedpayout':
                        controller.calculatedpoints.value.incentivesPayout
                  },
                  {'programId': Get.arguments},
                  {
                    'programCode': controller.leaderBoardResponse.value
                        .programDetails![0].programCode
                  }
                ]);
              },
              child: OptionCard(
                imagePath: ImageConstant.calculatedpoints,
                points: controller.calculatedpoints.value.incentivesPayout ?? 0,
                text: 'Calculated Points',
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.campaignearnedprogramId, arguments: [
                  {'calculatedpayout': controller.points.value.earnedpoints},
                  {'programId': Get.arguments}
                ]);
              },
              child: OptionCard(
                imagePath: ImageConstant.redeemedpoints,
                points: controller
                    .parsePoints(controller.points.value.earnedpoints),
                text: 'Earned Point',
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.campaignredeemedprogramId, arguments: [
                  {'calculatedpayout': controller.points.value.redempoints},
                  {'programId': Get.arguments}
                ]);
              },
              child: OptionCard(
                imagePath: ImageConstant.redeemedpoints,
                points:
                    controller.parsePoints(controller.points.value.redempoints),
                text: 'Redeemed Point',
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.campaignexpiredprogramId, arguments: [
                  {'calculatedpayout': controller.points.value.expirepoints},
                  {'programId': Get.arguments}
                ]);
              },
              child: OptionCard(
                imagePath: ImageConstant.redeemedpoints,
                points: controller
                    .parsePoints(controller.points.value.expirepoints),
                text: 'Expired Point',
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.campaignbalanceprogramId, arguments: [
                  {'calculatedpayout': controller.points.value.balancePoints},
                  {'programId': Get.arguments}
                ]);
              },
              child: OptionCard(
                imagePath: ImageConstant.redeemedpoints,
                points: controller.parsePoints(
                    controller.points.value.balancePoints.toString()),
                text: 'Balance Point',
              ),
            )
          ],
        ),
      ],
    );
  }
}
