import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/model/gridItem.dart';
import 'package:incentivesgit/presentation/type_b_screen/campain_details_screen/controller/campain_details_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/arcpainter.dart';
import 'package:incentivesgit/widgets/popupview.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class CampaignDetailstypeBScreen extends GetWidget<CampainDetailsController> {
  const CampaignDetailstypeBScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor:
              appTheme.rediconbackground, // Set your desired color here
        ),
      );
      return ScreenUtilInit(
        child: Container(
          color: appTheme.rediconbackground,
          child: SafeArea(
            top: true,
            bottom: true,
            child: Scaffold(
              backgroundColor: appTheme.grey,
              appBar: _customAppBar(),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 7.0),
                              child: Text(
                                '${controller.terminologytext} Points Dashboard',
                                // "Campaigns Points to Dashboard",
                                style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                  color: appTheme.black900,
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                            const PopoverButton()
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
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
                              imagePath: ImageConstant.calculatedpoints,
                              points: controller.parsePoints(
                                  controller.points.value.earnedpoints),
                              text: 'Earned Point',
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
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
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
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
                          GestureDetector(
                            onTap: () {
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
                      const SizedBox(
                        height: 0,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 21, left: 8),
                            child: Text(
                              'Leader Board',
                              style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromRGBO(25, 25, 25, 1)),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.only(top: 6, left: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_month_rounded,
                                  size: 25,
                                  color: const Color.fromARGB(255, 102, 101, 101),
                                ),
                                SizedBox(
                                    width:
                                        4), // Add some space between the icon and text
                                Text(
                                  'Date ending on ${controller.leaderBoardResponse.value.leaderboardDate}',
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.poppins().fontFamily,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w800,
                                    color:
                                        const Color.fromARGB(255, 102, 101, 101),
                                  ),
                                ),
                              ],
                            ),
                            Visibility(
                              visible: controller.leaderBoardResponse.value
                                          .programDetails !=
                                      null &&
                                  controller.leaderBoardResponse.value
                                      .programDetails!.isNotEmpty &&
                                  controller
                                          .leaderBoardResponse
                                          .value
                                          .programDetails![0]
                                          .participantsViewLeaderboard ==
                                      "1",
                              child: Padding(
                                padding: const EdgeInsets.only(right: 7),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.toNamed(
                                      AppRoutes.typebleaderboard,
                                      arguments: controller.leaderBoardResponse
                                          .value.programDetails![0].programId,
                                    );
                                  },
                                  child: Text(
                                    'View All',
                                    style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                      color: appTheme.blue50,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: 360.sp,
                        height: 179.sp,
                        color: const Color.fromARGB(255, 174, 173, 173),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                controller
                                    .leaderBoardResponse.value.userIds!.length,
                                (index) {
                                  final userId = controller
                                      .leaderBoardResponse.value.userIds![index];
                                  final user = controller
                                      .leaderBoardResponse.value.users![userId];
                                  final userRank = controller
                                      .leaderBoardResponse.value.allRank![userId];
                                  // Print URL for debugging
                                  print(
                                      'Profile image URL: ${Url.imageUrl}${user?.profile}');
          
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 1),
                                    child: Card(
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(0.0),
                                      ),
                                      child: SizedBox(
                                        width: 120,
                                        height: 140,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Stack(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                        color: appTheme
                                                            .rediconbackground,
                                                        width: 2, // Border width
                                                      ),
                                                    ),
                                                    child: ClipOval(
                                                      child: user?.profile != null
                                                          ? Image.network(
                                                              '${Url.profileimageUrl}${user!.profile}',
                                                              width: 60,
                                                              height: 60,
                                                              fit: BoxFit.cover,
                                                              loadingBuilder:
                                                                  (BuildContext
                                                                          context,
                                                                      Widget
                                                                          child,
                                                                      ImageChunkEvent?
                                                                          loadingProgress) {
                                                                if (loadingProgress ==
                                                                    null) {
                                                                  return child;
                                                                } else {
                                                                  return Center(
                                                                    child:
                                                                        CircularProgressIndicator(
                                                                      value: loadingProgress.expectedTotalBytes !=
                                                                              null
                                                                          ? loadingProgress.cumulativeBytesLoaded /
                                                                              loadingProgress.expectedTotalBytes!
                                                                          : null,
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                              errorBuilder:
                                                                  (BuildContext
                                                                          context,
                                                                      Object
                                                                          exception,
                                                                      StackTrace?
                                                                          stackTrace) {
                                                                return Icon(
                                                                    Icons.person,
                                                                    size: 60);
                                                              },
                                                            )
                                                          : const Icon(
                                                              Icons.person,
                                                              size: 60,
                                                            ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    bottom: 0,
                                                    right: 0,
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(5),
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: appTheme
                                                            .rediconbackground,
                                                      ),
                                                      child: Text(
                                                        '${userRank?.ranks ?? 'N/A'}',
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                '${user!.firstName} ${user.lastName}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10,
                                                    fontFamily:
                                                        GoogleFonts.poppins()
                                                            .fontFamily,
                                                    color: appTheme.cyan800),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                'Scope: ${user.scope}',
                                                style: TextStyle(
                                                    fontSize: 8,
                                                    fontWeight: FontWeight.normal,
                                                    fontFamily:
                                                        GoogleFonts.poppins()
                                                            .fontFamily,
                                                    color: appTheme.cyan800),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                              const SizedBox(height: 5),
                                              Text(
                                                'Points: ${userRank?.points ?? 'N/A'}', // Assuming 'points' is a field in the user model
                                                style: TextStyle(
                                                  fontSize: 8,
                                                  fontFamily:
                                                      GoogleFonts.poppins()
                                                          .fontFamily,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Text(
                          'Basic Information',
                          style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color.fromRGBO(25, 25, 25, 1)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4.0, right: 4),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: appTheme.white,
                          ),
                          child: Column(
                            children: [
                              _buildBasicDetails(),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
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
            width: 26.75.w,
            height: 19.76.h,
          ),
        ),
      ),
      title: Obx(
        () => Text(
          '${controller.terminologytext} Details',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.normal,
            fontSize: 18.sp,
            color: appTheme.white,
          ),
        ),
      ),
    );
  }

  Widget _buildBasicDetails() {
    return Column(
      children: [
        SizedBox(height: 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
              child: Text(
                '${controller.terminologytext} Id ',
                style: TextStyle(
                  color: appTheme.black900,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
            ),
            Spacer(),
            Text(":"),
            Spacer(),
            SizedBox(
              width: 178,
              child: Text(
                controller.leaderBoardResponse.value.programDetails!.isNotEmpty
                    ? controller.leaderBoardResponse.value.programDetails![0]
                            .programCode ??
                        ''
                    : 'No Campaign Name Available',
                style: TextStyle(
                    color: appTheme.black900,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 12),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
              child: Text(
                '${controller.terminologytext} Name',
                style: TextStyle(
                  color: appTheme.black900,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
            ),
            Spacer(),
            Text(":"),
            Spacer(),
            SizedBox(
              width: 178,
              child: Text(
                controller.leaderBoardResponse.value.programDetails!.isNotEmpty
                    ? controller.leaderBoardResponse.value.programDetails![0]
                            .name ??
                        ''
                    : 'No Campaign Name Available',
                style: TextStyle(
                    color: appTheme.black900,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 12),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
              child: Text(
                'Start Date',
                style: TextStyle(
                  color: appTheme.black900,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
            ),
            Spacer(),
            Text(":"),
            Spacer(),
            SizedBox(
              width: 178,
              child: Text(
                controller.leaderBoardResponse.value.programDetails!.isNotEmpty
                    ? (controller.leaderBoardResponse.value.programDetails![0]
                                .startDate !=
                            null
                        ? DateFormat('dd-MM-yyyy').format(DateTime.parse(
                            controller.leaderBoardResponse.value
                                .programDetails![0].startDate!))
                        : '')
                    : 'No Campaign Name Available',
                style: TextStyle(
                  color: appTheme.black900,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
              child: Text(
                'End Date',
                style: TextStyle(
                  color: appTheme.black900,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
            ),
            Spacer(),
            Text(":"),
            Spacer(),
            SizedBox(
              width: 178,
              child: Text(
                controller.leaderBoardResponse.value.programDetails!.isNotEmpty
                    ? (controller.leaderBoardResponse.value.programDetails![0]
                                .endDate !=
                            null
                        ? DateFormat('dd-MM-yyyy').format(DateTime.parse(
                            controller.leaderBoardResponse.value
                                .programDetails![0].endDate!))
                        : '')
                    : 'No Campaign Name Available',
                style: TextStyle(
                  color: appTheme.black900,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 122,
              child: Text(
                '${controller.terminologytext} Banner',
                style: TextStyle(
                  color: appTheme.black900,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
            ),
            Spacer(),
            Text(":"),
            Spacer(),
            SizedBox(
                width: 180,
                child: Column(
                  children: [
                    if (controller.leaderBoardResponse.value.programDetails !=
                            null &&
                        controller.leaderBoardResponse.value.programDetails!
                            .isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(right: 31.0),
                        child: Image.network(
                          'https://s3.ap-south-1.amazonaws.com/grginternal/stage/COMP000080/' +
                              controller.leaderBoardResponse.value
                                  .programDetails![0].bannerUrl!,
                          width: 146,
                          height: 51,
                          errorBuilder: (context, error, stackTrace) {
                            return Text('Error loading banner image');
                          },
                        ),
                      )
                    else
                      Text('No Banner Available'),
                  ],
                )),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 124,
              child: Text(
                '${controller.terminologytext} Description',
                style: TextStyle(
                  color: appTheme.black900,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
            ),
            Spacer(),
            Text(":"),
            Spacer(),
            SizedBox(
              width: 178,
              child: Text(
                controller.leaderBoardResponse.value.programDetails!.isNotEmpty
                    ? controller.leaderBoardResponse.value.programDetails![0]
                            .description ??
                        ''
                    : 'No Campaign Name Available',
                style: TextStyle(
                    color: appTheme.black900,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 12),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
              child: Text(
                '${controller.terminologytext} Owner',
                style: TextStyle(
                  color: appTheme.black900,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
            ),
            Spacer(),
            Text(":"),
            Spacer(),
            SizedBox(
              width: 178,
              child: Text(
                controller.leaderBoardResponse.value.programOwners!.isNotEmpty
                    ? controller
                            .leaderBoardResponse.value.programOwners![0].name ??
                        ''
                    : 'No Campaign Owner Available',
                style: TextStyle(
                    color: appTheme.black900,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 12),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
              child: Text(
                '${controller.terminologytext} Co-Owners',
                style: TextStyle(
                  color: appTheme.black900,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
            ),
            Spacer(),
            Text(":"),
            Spacer(),
            SizedBox(
              width: 178,
              child: Text(
                controller.leaderBoardResponse.value.programCoOwners!.isNotEmpty
                    ? controller.leaderBoardResponse.value.programCoOwners![0]
                            .name ??
                        ''
                    : 'No Campaign Co-Owner Available',
                style: TextStyle(
                    color: appTheme.black900,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 12),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
              child: Text(
                'Report Owners',
                style: TextStyle(
                  color: appTheme.black900,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
            ),
            Spacer(),
            Text(":"),
            Spacer(),
            SizedBox(
              height: 45,
              width: 178,
              child: Obx(() {
                final programReportOwners =
                    controller.leaderBoardResponse.value.programReportOwners;
                return ListView.builder(
                  itemCount: programReportOwners?.length,
                  itemBuilder: (context, index) {
                    final owner = programReportOwners?[index];
                    print('ownownerver${owner?.name}');

                    return Text(
                      '${owner?.name}',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 12,
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
              child: Text(
                'Expiry Date',
                style: TextStyle(
                  color: appTheme.black900,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.normal,
                  fontSize: 12,
                ),
              ),
            ),
            Spacer(),
            Text(":"),
            Spacer(),
            SizedBox(
              width: 178,
              child: Text(
                controller.leaderBoardResponse.value.programDetails!.isNotEmpty
                    ? (controller.leaderBoardResponse.value.programDetails![0]
                                .expiryDate !=
                            null
                        ? DateFormat('dd-MM-yyyy').format(DateTime.parse(
                            controller.leaderBoardResponse.value
                                .programDetails![0].expiryDate!))
                        : '')
                    : 'No Campaign Name Available',
                style: TextStyle(
                  color: appTheme.black900,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 18,
        ),
      ],
    );
  }
}
