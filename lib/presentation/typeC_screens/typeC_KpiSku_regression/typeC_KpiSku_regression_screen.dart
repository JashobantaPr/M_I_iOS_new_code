import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/controller/campaigncontroller.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/model/gridItem.dart';
import 'package:incentivesgit/presentation/typeC_screens/TypeC_KpiSku_Regression_awardingpoints_claim_management/TypeC_KpiSku_Regression_awardingpoints_claim_management_screen.dart';
import 'package:incentivesgit/presentation/typeC_screens/claim_approval_based_awarding_of_points_claim_management/claim_approval_based_awarding_of_points_claim_management_screen.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_KpiSku_regression/controller/typeC_KpiSku_regression_controller.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_KpiSku_regression/model/typeC_KpiSku_regression_model.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/popupview.dart';
import 'package:intl/intl.dart';

class TypeCKpiSkuRegressionScreen
    extends GetWidget<TypeCKpiSkuRegressionController> {
  const TypeCKpiSkuRegressionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        appBar: _customAppBar(),
        body: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Obx(() {
                  return IndexedStack(
                    index: controller.currentIndex.value,
                    children: [
                      dashboard(),
                      const TypeCKpiSkuAwardingPointsClaimManagementScreen()
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _customAppBar() {
    return AppBar(
      backgroundColor: const Color.fromRGBO(228, 28, 57, 1),
      title: Text(
        '${controller.controllpoints.terminologytext} Details',
        style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.normal),
      ),
      leading: IconButton(
        onPressed: () => Get.back(),
        icon: SvgPicture.asset(
          ImageConstant.arrowback,
          width: 26.75.w,
          height: 19.76.h,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(27.h),
        child: Container(
          height: 27.h,
          color: const Color.fromRGBO(228, 28, 57, 1),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      controller.currentIndex.value = 0;
                    },
                    child: Obx(() {
                      return Opacity(
                        opacity: controller.currentIndex.value == 0 ? 1.0 : 0.5,
                        child: Text(
                          '${controller.controllpoints.terminologytext} Summary',
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      );
                    }),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Tapped on campaigns');
                      controller.currentIndex.value = 1;
                    },
                    child: Obx(() {
                      return Opacity(
                        opacity: controller.currentIndex.value == 1 ? 1.0 : 0.5,
                        child: Text(
                          "Claim Management",
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
              Positioned(
                // left: controller.currentIndex.value == 0 ? 0 : MediaQuery.of(context).size.width / 2,
                // right: controller.currentIndex.value == 1 ? 0 : MediaQuery.of(context).size.width / 2,
                bottom: 0,
                child: Container(
                  height: 2.0,
                  color: const Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dashboard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: const Color.fromRGBO(240, 240, 240, 1),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    '${controller.controllpoints.terminologytext} Points Dashboard',
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                      color: const Color.fromRGBO(25, 25, 25, 1),
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
                  Get.toNamed(AppRoutes.campaignearnedprogramId, arguments: [
                    {'calculatedpayout': controller.points.value.earnedpoints},
                    {'programId': Get.arguments}
                  ]);
                },
                child: Obx(
                  () => OptionCard(
                    imagePath: ImageConstant.earnedpoints,
                    points: controller
                        .parsePoints(controller.points.value.earnedpoints),
                    text: 'Earned Point',
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.campaignredeemedprogramId, arguments: [
                    {'calculatedpayout': controller.points.value.redempoints},
                    {'programId': Get.arguments}
                  ]);
                },
                child: Obx(
                  () => OptionCard(
                    imagePath: ImageConstant.redeemedpoints,
                    points: controller
                        .parsePoints(controller.points.value.redempoints),
                    text: 'Redeemed Point',
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.campaignexpiredprogramId, arguments: [
                    {'calculatedpayout': controller.points.value.expirepoints},
                    {'programId': Get.arguments}
                  ]);
                },
                child: Obx(
                  () => OptionCard(
                    imagePath: ImageConstant.redeemedpoints,
                    points: controller
                        .parsePoints(controller.points.value.expirepoints),
                    text: 'Expired Point',
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.campaignbalanceprogramId, arguments: [
                    {'calculatedpayout': controller.points.value.balancePoints},
                    {'programId': Get.arguments}
                  ]);
                },
                child: Obx(
                  () => OptionCard(
                    imagePath: ImageConstant.redeemedpoints,
                    points: controller.points.value.balancePoints,
                    text: 'Balance Point',
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
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
              Visibility(
                visible: controller.leaderBoardResponse.value.leaderboardDate !=
                        null &&
                    controller
                        .leaderBoardResponse.value.leaderboardDate!.isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.only(top: 21),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        AppRoutes.typeAleaderboard,
                        arguments: controller.leaderBoardResponse.value
                            .programDetails![0].programId,
                      );
                    },
                    child: Text(
                      'View All',
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Visibility(
            visible:
                controller.leaderBoardResponse.value.leaderboardDate != null &&
                    controller
                        .leaderBoardResponse.value.leaderboardDate!.isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.only(top: 6, left: 8),
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_month_rounded,
                    size: 25,
                    color: const Color.fromARGB(255, 102, 101, 101),
                  ),
                  SizedBox(width: 8),
                  Obx(
                    () => Text(
                      'Date ending on ${controller.leaderBoardResponse.value.leaderboardDate}',
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontStyle: FontStyle.italic,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w800,
                        color: const Color.fromARGB(255, 102, 101, 101),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Obx(
            () {
              final leaderBoardResponse = controller.leaderBoardResponse.value;

              if (leaderBoardResponse != null &&
                  leaderBoardResponse.programDetails != null &&
                  leaderBoardResponse.programDetails!.isNotEmpty &&
                  leaderBoardResponse.userIds != null &&
                  leaderBoardResponse.users != null &&
                  leaderBoardResponse.allRank != null) {
                final programDetails = leaderBoardResponse.programDetails!;
                final userIds = leaderBoardResponse.userIds!;
                final users = leaderBoardResponse.users!;
                final allRanks = leaderBoardResponse.allRank!;

                return Container(
                  width: 360.sp,
                  height: 189.sp,
                  color: const Color.fromARGB(255, 174, 173, 173),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          userIds.length,
                          (index) {
                            final userId = userIds[index];
                            final user = users[userId];

                            // Find user's rank
                            final userRank = allRanks.firstWhere(
                              (rank) => rank.cmsUserIdFk == userId,
                              orElse: () =>
                                  AllRank(), // Provide a default rank if not found
                            );

                            return Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                child: SizedBox(
                                  width: 120,
                                  height: 150,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Stack(
                                          children: [
                                            // Your code for displaying user profile image
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        // Your code for displaying user's name and scope
                                        const SizedBox(height: 1),
                                        // Display user's points (null check)
                                        Text(
                                          'Points: ${userRank.points ?? 'N/A'}',
                                          style: TextStyle(
                                            fontSize: 12,
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
                );
              } else {
                return Container(
                    width: 120,
                    height: 170,
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: appTheme.gray20001,
                          radius: 50,
                          child: Image.asset(
                            ImageConstant.nodocument,
                            width: 60,
                            height: 60,
                            fit: BoxFit
                                .cover, // Ensure the image covers the entire circle
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            'Data not available',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                              color: appTheme.greytextcolour,
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                          ),
                        ),
                      ],
                    ));
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 21, left: 8),
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
          Container(
            margin: const EdgeInsets.only(
                left: 7.0, right: 4), // Adjust the value to move left or right
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: appTheme.white,
            ),
            child: Obx(
              () => Column(
                children: [
                  _basicinformation(
                    '${controller.controllpoints.terminologytext} id',
                    controller.leaderBoardResponse.value.programDetails !=
                                null &&
                            controller.leaderBoardResponse.value.programDetails!
                                .isNotEmpty
                        ? controller.leaderBoardResponse.value
                                .programDetails![0].programCode ??
                            ''
                        : 'No Campaign Name Available',
                  ),
                  _basicinformation(
                    '${controller.controllpoints.terminologytext} Name',
                    controller.leaderBoardResponse.value.programDetails !=
                                null &&
                            controller.leaderBoardResponse.value.programDetails!
                                .isNotEmpty
                        ? controller.leaderBoardResponse.value
                                .programDetails![0].name ??
                            ''
                        : 'No Campaign Name Available',
                  ),
                  _basicinformation(
                    'Start Date',
                    controller.leaderBoardResponse.value.programDetails !=
                                null &&
                            controller.leaderBoardResponse.value.programDetails!
                                .isNotEmpty
                        ? (controller.leaderBoardResponse.value
                                    .programDetails![0].startDate !=
                                null
                            ? DateFormat('dd-MM-yyyy').format(DateTime.parse(
                                controller.leaderBoardResponse.value
                                    .programDetails![0].startDate!))
                            : '')
                        : 'No Campaign Name Available',
                  ),
                  _basicinformation(
                    'End Date',
                    controller.leaderBoardResponse.value.programDetails !=
                                null &&
                            controller.leaderBoardResponse.value.programDetails!
                                .isNotEmpty
                        ? (controller.leaderBoardResponse.value
                                    .programDetails![0].endDate !=
                                null
                            ? DateFormat('dd-MM-yyyy').format(DateTime.parse(
                                controller.leaderBoardResponse.value
                                    .programDetails![0].endDate!))
                            : '')
                        : 'No Campaign Name Available',
                  ),
                  if (controller.leaderBoardResponse.value.programDetails !=
                          null &&
                      controller.leaderBoardResponse.value.programDetails!
                          .isNotEmpty &&
                      controller.leaderBoardResponse.value.programDetails![0]
                              .bannerUrl !=
                          null)
                    Row(
                      children: [
                        Text(
                          '${controller.controllpoints.terminologytext}\n Banner:',
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(25, 25, 25, 1),
                          ),
                        ),
                        const SizedBox(
                            width: 22), // Add some space between text and image
                        Image.network(
                          'https://s3.ap-south-1.amazonaws.com/grginternal/stage/COMP000080/' +
                              controller.leaderBoardResponse.value
                                  .programDetails![0].bannerUrl!,
                          width: 150,
                          height: 50,
                          errorBuilder: (context, error, stackTrace) {
                            return Text('Error loading banner image');
                          },
                        ),
                      ],
                    )
                  else
                    _basicinformation('Banner', 'No Banner Available'),
                  _basicinformation(
                    '${controller.controllpoints.terminologytext} Description',
                    controller.leaderBoardResponse.value.programDetails !=
                                null &&
                            controller.leaderBoardResponse.value.programDetails!
                                .isNotEmpty
                        ? controller.leaderBoardResponse.value
                                .programDetails![0].description ??
                            ''
                        : 'No Campaign Description Available',
                  ),
                  _basicinformation(
                    '${controller.controllpoints.terminologytext} Owner',
                    controller.leaderBoardResponse.value.programOwners !=
                                null &&
                            controller.leaderBoardResponse.value.programOwners!
                                .isNotEmpty
                        ? controller.leaderBoardResponse.value.programOwners![0]
                                .name ??
                            ''
                        : 'No Campaign Owner Available',
                  ),
                  _basicinformation(
                    '${controller.controllpoints.terminologytext} Co-owner',
                    controller.leaderBoardResponse.value.programCoOwners !=
                                null &&
                            controller.leaderBoardResponse.value
                                .programCoOwners!.isNotEmpty
                        ? controller.leaderBoardResponse.value
                                .programCoOwners![0].name ??
                            ''
                        : 'No Campaign Co-Owner Available',
                  ),
                  _basicinformation(
                    '${controller.controllpoints.terminologytext} Report Owner',
                    controller.leaderBoardResponse.value.programReportOwners !=
                                null &&
                            controller.leaderBoardResponse.value
                                .programReportOwners!.isNotEmpty
                        ? controller.leaderBoardResponse.value
                                .programReportOwners![0].name ??
                            ''
                        : 'No Campaign Report Owner Available',
                  ),
                  _basicinformation(
                    'Expiry',
                    controller.leaderBoardResponse.value.programDetails !=
                                null &&
                            controller.leaderBoardResponse.value.programDetails!
                                .isNotEmpty
                        ? (controller.leaderBoardResponse.value
                                    .programDetails![0].expiryDate !=
                                null
                            ? DateFormat('dd-MM-yyyy').format(DateTime.parse(
                                controller.leaderBoardResponse.value
                                    .programDetails![0].expiryDate!))
                            : '')
                        : 'No Campaign Expiry Date Available',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _basicinformation(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
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
                    fontWeight: FontWeight.normal),
              )),
          const Text(':'),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: SizedBox(
              width: 110.w,
              child: Text(
                value,
                textAlign: TextAlign.left,
                // overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 12.sp,
                    color: appTheme.black600,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
