import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/model/gridItem.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/campaign_details_card_screen/controller/campaigndetailscardscreencontroller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/popupview.dart';
import 'package:intl/intl.dart';

class CampaignDetailsCardScreen
    extends GetWidget<CampaignDetailsCardController> {
  const CampaignDetailsCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        return Scaffold(
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
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Obx(
                            () => Text(
                              '${controller.terminologytext} Points Dashboard',
                              style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp,
                                color: const Color.fromRGBO(25, 25, 25, 1),
                              ),
                            ),
                          ),
                          const PopoverButton()
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print(
                                'sfhgfg  ${controller.leaderBoardResponse.value.programDetails![0].programCode}');
                            Get.toNamed(AppRoutes.typedcalculatedpoints,
                                arguments: [
                                  {
                                    'calculatedpayout': controller
                                        .calculatedpoints.value.incentivesPayout
                                  },
                                  {'programId': Get.arguments},
                                  {
                                    'programCode': controller
                                        .leaderBoardResponse
                                        .value
                                        .programDetails![0]
                                        .programCode
                                  }
                                ]);
                          },
                          child: OptionCard(
                            imagePath: ImageConstant.calculatedpoints,
                            points: controller
                                    .calculatedpoints.value.incentivesPayout ??
                                0,
                            text: 'Calculated Points',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print('programId ${Get.arguments}');
                            Get.toNamed(AppRoutes.campaignearnedprogramId,
                                arguments: [
                                  {
                                    'calculatedpayout':
                                        controller.points.value.earnedpoints
                                  },
                                  {'programId': Get.arguments}
                                ]);
                          },
                          child: OptionCard(
                            imagePath: ImageConstant.redeemedpoints,
                            points: controller.parsePoints(
                                controller.points.value.earnedpoints),
                            text: 'Earned Point',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print('programId ${Get.arguments}');
                            Get.toNamed(AppRoutes.campaignredeemedprogramId,
                                arguments: [
                                  {
                                    'calculatedpayout':
                                        controller.points.value.redempoints
                                  },
                                  {'programId': Get.arguments}
                                ]);
                          },
                          child: OptionCard(
                            imagePath: ImageConstant.redeemedpoints,
                            points: controller.parsePoints(
                                controller.points.value.redempoints),
                            text: 'Redeemed Point',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print('programId ${Get.arguments}');
                            Get.toNamed(AppRoutes.campaignexpiredprogramId,
                                arguments: [
                                  {
                                    'calculatedpayout':
                                        controller.points.value.expirepoints
                                  },
                                  {'programId': Get.arguments}
                                ]);
                          },
                          child: OptionCard(
                            imagePath: ImageConstant.redeemedpoints,
                            points: controller.parsePoints(
                                controller.points.value.expirepoints),
                            text: 'Expired Point',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print('programId ${Get.arguments}');
                            Get.toNamed(AppRoutes.campaignbalanceprogramId,
                                arguments: [
                                  {
                                    'calculatedpayout':
                                        controller.points.value.balancePoints
                                  },
                                  {'programId': Get.arguments}
                                ]);
                          },
                          child: OptionCard(
                            imagePath: ImageConstant.redeemedpoints,
                            points: controller.parsePoints(controller
                                .points.value.balancePoints
                                .toString()),
                            text: 'Balance Point',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
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
                            Get.toNamed(AppRoutes.myperformancecard,
                                arguments: controller.leaderBoardResponse.value
                                    .programDetails![0].programId);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Text(
                              'View All',
                              style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.sp,
                                color: appTheme.blue50,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: controller.kpiList.take(4).toList().length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final kpi = controller.kpiList[index];
                        return Container(
                          decoration: BoxDecoration(
                              color: appTheme.white,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: kpi.kpiAchievementValue != 0
                                    ? SizedBox(
                                        height: 50,
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: controller
                                                    .kpiList[index].kpiName,
                                                style: TextStyle(
                                                  fontFamily:
                                                      GoogleFonts.poppins()
                                                          .fontFamily,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10.sp,
                                                  color: appTheme.black600,
                                                ),
                                              ),
                                              TextSpan(
                                                text: controller.kpiList[index]
                                                        .kpiUnit.isNotEmpty
                                                    ? ' (in ${controller.kpiList[index].kpiUnit})'
                                                    : '',
                                                style: TextStyle(
                                                  fontFamily:
                                                      GoogleFonts.poppins()
                                                          .fontFamily,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10.sp,
                                                  color: appTheme.black900,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 50,
                                            child: RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: controller
                                                        .kpiList[index].kpiName,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          GoogleFonts.poppins()
                                                              .fontFamily,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10.sp,
                                                      color: appTheme.black600,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: controller
                                                            .kpiList[index]
                                                            .kpiUnit
                                                            .isNotEmpty
                                                        ? ' (in ${controller.kpiList[index].kpiUnit})'
                                                        : '',
                                                    style: TextStyle(
                                                      fontFamily:
                                                          GoogleFonts.poppins()
                                                              .fontFamily,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10.sp,
                                                      color: appTheme.black900,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 3.w,
                                          ),
                                          SvgPicture.asset(
                                            ImageConstant.error,
                                            width: 12,
                                            height: 12,
                                            color: Colors.red,
                                          ),
                                        ],
                                      ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              kpi.kpiAchievementValue != 0
                                  ? Row(
                                      children: [
                                        Text(
                                          'Your Rank:',
                                          style: TextStyle(
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 10.sp,
                                            color: appTheme.greytextcolour,
                                          ),
                                        ),
                                        Text(
                                          ' ${kpi.kpiRank}',
                                          style: TextStyle(
                                            fontFamily: GoogleFonts.poppins()
                                                .fontFamily,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                            color: appTheme.black600,
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          height: 18.h,
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                227, 245, 222, 1),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 3),
                                          child: Text(
                                            '${kpi.kpiPercentage}%',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: appTheme.green1,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  : const SizedBox.shrink(),
                              Padding(
                                padding: EdgeInsets.only(top: 8.h),
                                child: kpi.kpiAchievementValue != 0
                                    ? Text(
                                        '${controller.kpiList[index].kpiAchievementValue > 1000 ? '${(controller.kpiList[index].kpiAchievementValue / 1000).toStringAsFixed(2)}k' : controller.kpiList[index].kpiAchievementValue}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          color: appTheme.black900,
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : Text(
                                        '-',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 24,
                                            color: appTheme.black600),
                                      ),
                              ),
                              Text(
                                'Achievement',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  color: appTheme.greytextcolour,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: kpi.kpiTargetValue != 0
                                    ? Text(
                                        '${kpi.kpiTargetValue}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          color: appTheme.black600,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      )
                                    : Text(
                                        '-',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            fontSize: 16,
                                            color: appTheme.black600),
                                      ),
                              ),
                              Text(
                                'Target',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  color: appTheme.greytextcolour,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Basic Information',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        color: appTheme.black600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    _basicInformationSection(),
                  ],
                ),
              ),
            );
          }),
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
              maxLines: 3, // Allow text to wrap into multiple lines
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
}
