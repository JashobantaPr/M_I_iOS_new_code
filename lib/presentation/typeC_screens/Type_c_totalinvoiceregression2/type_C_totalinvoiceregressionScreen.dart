import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/model/gridItem.dart';
import 'package:incentivesgit/presentation/typeC_screens/Type_c_totalinvoiceregression2/controller/type_C_totalinvoiceController.dart';
import 'package:incentivesgit/presentation/typeC_screens/claim_approval_based_awarding_of_points_claim_management/claim_approval_based_awarding_of_points_claim_management_screen.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/popupview.dart';

class TypeCTotalInvoiceRegression
    extends GetWidget<TypeCTotalinvoiceRegression> {
  const TypeCTotalInvoiceRegression({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        appBar: _customAppBar(context),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Obx(() {
                return IndexedStack(
                  index: controller.currentIndex.value,
                  children: [
                    dashboard(),
                    const ClaimApprovalBasedAwardingofPointsClaimManagement()
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _customAppBar(BuildContext context) {
    return AppBar(
        backgroundColor: const Color.fromRGBO(228, 28, 57, 1),
        automaticallyImplyLeading: false,
        title: Text(
          '${controller.controllpoints.terminologytext} Details',
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontWeight: FontWeight.normal),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            onPressed: () => Get.back(),
            icon: SvgPicture.asset(
              ImageConstant.arrowback,
              width: 2.75.w,
              height: 14.76.h,
            ),
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
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Opacity(
                              opacity: controller.currentIndex.value == 0
                                  ? 1.0
                                  : 0.5,
                              alwaysIncludeSemantics: true,
                              child: Text(
                                '${controller.controllpoints.terminologytext} Summary',
                                style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.currentIndex.value = 1;
                      },
                      child: Obx(() {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Opacity(
                              opacity: controller.currentIndex.value == 1
                                  ? 1.0
                                  : 0.5,
                              child: Text(
                                "Claim Management",
                                style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  ],
                ),
                Obx(() {
                  return Positioned(
                    bottom: 0,
                    left: controller.currentIndex.value == 0
                        ? MediaQuery.of(context).size.width * 0
                        : MediaQuery.of(context).size.width * 0.50,
                    child: Container(
                      height: 2.0,
                      width: MediaQuery.of(context).size.width * 0.50,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  );
                }),
              ],
            ),
          ),
        ));
  }

  Widget dashboard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      color: const Color.fromRGBO(240, 240, 240, 1),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${controller.controllpoints.terminologytext} Points Dashboard',
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                      color: const Color.fromRGBO(25, 25, 25, 1)),
                ),
                const SizedBox(width: 5),
                const PopoverButton()
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.campaignearnedprogramId, arguments: [
                    {'calculatedpayout': controller.points.value.earnedpoints},
                    {'programId': Get.arguments}
                  ]);
                },
                child: OptionCard(
                  imagePath: ImageConstant.earnedpoints,
                  points: controller
                      .parsePoints(controller.points.value.earnedpoints),
                  text: 'Earned Point',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.campaignredeemedprogramId, arguments: [
                    {'calculatedpayout': controller.points.value.redempoints},
                    {'programId': Get.arguments}
                  ]);
                },
                child: OptionCard(
                  imagePath: ImageConstant.redeemedpoints,
                  points: controller
                      .parsePoints(controller.points.value.redempoints),
                  text: 'Redeemed Point',
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    imagePath: ImageConstant.expiredpoints,
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
                    imagePath: ImageConstant.balancepoints,
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
                padding: const EdgeInsets.only(top: 21, left: 5),
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
                visible: controller
                            .leaderBoardResponse.value.programDetails !=
                        null &&
                    controller
                        .leaderBoardResponse.value.programDetails!.isNotEmpty &&
                    controller.leaderBoardResponse.value.programDetails![0]
                            .participantsViewLeaderboard ==
                        '1' &&
                    controller.leaderBoardResponse.value.allRank!.isNotEmpty &&
                    controller.leaderBoardResponse.value.allRank != "",
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
          Padding(
            padding: const EdgeInsets.only(top: 6, left: 10),
            child: Obx(
              () => Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_month,
                    size: 14.sp,
                    color: const Color.fromARGB(255, 102, 101, 101),
                  ),
                  const SizedBox(
                      width:
                          4), // Add some spacing between the icon and the text
                  Text(
                    'Date ending on ${controller.leaderBoardResponse.value.leaderboardDate}',
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 10.sp,
                      color: const Color.fromARGB(255, 102, 101, 101),
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
                  leaderBoardResponse.allRank != null &&
                  leaderBoardResponse.allRank!.isNotEmpty) {
                // final programDetails = leaderBoardResponse.programDetails!;
                // final userIds = leaderBoardResponse.userIds!;
                // final users = leaderBoardResponse.users!;
                // final allRanks = leaderBoardResponse.allRank!;

                return Container(
                  width: 360.sp,
                  color: const Color.fromARGB(255, 174, 173, 173),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          controller.leaderBoardResponse.value.userIds!.length,
                          (index) {
                            final userId = controller
                                .leaderBoardResponse.value.userIds![index];
                            final user = controller
                                .leaderBoardResponse.value.users![userId];
                            final userRank = controller
                                .leaderBoardResponse.value.allRank![userId];

                            return Padding(
                              padding: const EdgeInsets.only(right: 2),
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
                                            Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                  color: appTheme
                                                      .rediconbackground,
                                                  width: 2,
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
                                                                Widget child,
                                                                ImageChunkEvent?
                                                                    loadingProgress) {
                                                          if (loadingProgress ==
                                                              null) {
                                                            return child;
                                                          } else {
                                                            return Center(
                                                              child:
                                                                  CircularProgressIndicator(
                                                                value: loadingProgress
                                                                            .expectedTotalBytes !=
                                                                        null
                                                                    ? loadingProgress
                                                                            .cumulativeBytesLoaded /
                                                                        loadingProgress
                                                                            .expectedTotalBytes!
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
                                                          return const Icon(
                                                              Icons.person,
                                                              size: 60);
                                                        },
                                                      )
                                                    : const Icon(Icons.person,
                                                        size: 60),
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
                                                  '${index + 1}',
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          '${user!.firstName} ${user.lastName}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                          overflow: TextOverflow
                                              .ellipsis, // Truncate long text
                                          maxLines: 1, // Limit to one line
                                        ),
                                        const SizedBox(height: 1),
                                        Text(
                                          'Scope: ${user.scope}',
                                          style: const TextStyle(
                                            fontSize: 10,
                                            color: Colors.grey,
                                          ),
                                          overflow: TextOverflow
                                              .ellipsis, // Truncate long text
                                          maxLines: 1, // Limit to one line
                                        ),
                                        const SizedBox(height: 1),
                                        Text(
                                          'Points: ${userRank?.points ?? 'N/A'}', // Assuming 'points' is a field in the user model
                                          style: const TextStyle(
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
            padding: const EdgeInsets.only(top: 21),
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
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: appTheme.white,
            ),
            child: Obx(
              () => Column(
                children: [
                  _basicinformation(
                      '${controller.controllpoints.terminologytext} Name',
                      controller.leaderBoardResponse.value.programDetails!
                              .isNotEmpty
                          ? controller.leaderBoardResponse.value
                                  .programDetails![0].name ??
                              ''
                          : 'No Campaign Name Available'),
                  _basicinformation(
                      // 'Campaign Id',
                      '${controller.controllpoints.terminologytext} id',
                      controller.leaderBoardResponse.value.programDetails!
                              .isNotEmpty
                          ? controller.leaderBoardResponse.value
                                  .programDetails![0].programCode ??
                              ''
                          : 'No Campaign Name Available'),
                  if (controller.leaderBoardResponse.value.programDetails!
                          .isNotEmpty &&
                      controller.leaderBoardResponse.value.programDetails![0]
                              .bannerUrl !=
                          null)
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            '${controller.controllpoints.terminologytext}\n Bananer               ',
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 14.sp,
                                color: appTheme.black600,
                                fontWeight: FontWeight.normal),
                          ),
                        ),

                        const SizedBox(
                            width: 25), // Add some space between text and image
                        Image.network(
                          'https://s3.ap-south-1.amazonaws.com/grginternal/stage/COMP000080/' +
                              controller.leaderBoardResponse.value
                                  .programDetails![0].bannerUrl!,
                          width: 150,
                          height: 50,
                          errorBuilder: (context, error, stackTrace) {
                            return Text(
                              'Image not found ',
                              style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromRGBO(25, 25, 25, 1)),
                            );
                          },
                        ),
                      ],
                    )
                  else
                    _basicinformation('Banner', 'No Banner Available'),
                  _basicinformation(
                      'Start Date',
                      controller.leaderBoardResponse.value.programDetails!
                              .isNotEmpty
                          ? controller.leaderBoardResponse.value
                                  .programDetails![0].startDate ??
                              ''
                          : 'No Campaign Name Available'),
                  _basicinformation(
                      'End Date',
                      controller.leaderBoardResponse.value.programDetails!
                              .isNotEmpty
                          ? controller.leaderBoardResponse.value
                                  .programDetails![0].endDate ??
                              ''
                          : 'No Campaign Name Available'),
                  _basicinformation(
                      'Expiry',
                      controller.leaderBoardResponse.value.programDetails!
                              .isNotEmpty
                          ? controller.leaderBoardResponse.value
                                  .programDetails![0].expiryDate ??
                              ''
                          : 'No Campaign Name Available'),
                  _basicinformation(
                      '${controller.controllpoints.terminologytext} Description',
                      controller.leaderBoardResponse.value.programDetails!
                              .isNotEmpty
                          ? controller.leaderBoardResponse.value
                                  .programDetails![0].description ??
                              ''
                          : 'No Campaign Name Available'),
                  _basicinformation(
                      '${controller.controllpoints.terminologytext} Owner',
                      controller.leaderBoardResponse.value.programOwners!
                              .isNotEmpty
                          ? controller.leaderBoardResponse.value
                                  .programOwners![0].name ??
                              ''
                          : 'No Campaign Owner Available'),
                  _basicinformation(
                      '${controller.controllpoints.terminologytext} Co-owner',
                      controller.leaderBoardResponse.value.programCoOwners!
                              .isNotEmpty
                          ? controller.leaderBoardResponse.value
                                  .programCoOwners![0].name ??
                              ''
                          : 'No Campaign Co-Owner Available'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // Widget _basicinformation(String label, String value) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(vertical: 5.0),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         SizedBox(
  //           width: 120.w,
  //           child: Text(
  //             label,
  //             textAlign: TextAlign.left,
  //             style: TextStyle(
  //               fontFamily: GoogleFonts.poppins().fontFamily,
  //               fontSize: 12.sp,
  //               color: appTheme.black600,
  //               fontWeight: FontWeight.normal,
  //             ),
  //           ),
  //         ),
  //         const Text(':'),
  //         const SizedBox(width: 10),
  //         Expanded(
  //           child: Text(
  //             value,
  //             textAlign: TextAlign.left,
  //             maxLines: 3, // Allow text to wrap into multiple lines
  //             overflow: TextOverflow.ellipsis,
  //             style: TextStyle(
  //               fontFamily: GoogleFonts.poppins().fontFamily,
  //               fontSize: 12.sp,
  //               color: appTheme.black600,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _basicinformation(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SizedBox(
                width: 140.w,
                child: Text(
                  label,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 14.sp,
                      color: appTheme.black600,
                      fontWeight: FontWeight.normal),
                )),
          ),
          const Text(':'),
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: SizedBox(
              width: 140.w,
              child: Text(
                value,
                textAlign: TextAlign.left,
                // overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 14.sp,
                    color: appTheme.black600,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
