import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/model/gridItem.dart';
import 'package:incentivesgit/presentation/type_A_directawardingofpoints/controller/directawardingofpoint_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:incentivesgit/widgets/popupview.dart';

class CampaignDetailstypeAScreen
    extends GetWidget<DirectAwardingOfPointsController> {
  const CampaignDetailstypeAScreen({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return ScreenUtilInit(
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
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                          SizedBox(
                            width: 3.w,
                          ),
                          const PopoverButton()
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: GestureDetector(
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
                              child: Obx(
                                () => OptionCard(
                                  imagePath: ImageConstant.earnedpoints,
                                  points: controller.parsePoints(
                                      controller.points.value.earnedpoints),
                                  text: 'Earned Point',
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(
                          //     width: 0), // Add some spacing between the cards
                          Expanded(
                            child: GestureDetector(
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
                              child: Obx(
                                () => OptionCard(
                                  imagePath: ImageConstant.redeemedpoints,
                                  points: controller.parsePoints(
                                      controller.points.value.redempoints),
                                  text: 'Redeemed Point',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => Get.toNamed(
                                  AppRoutes.campaignexpiredprogramId,
                                  arguments: [
                                    {
                                      'calculatedpayout':
                                          controller.points.value.expirepoints
                                    },
                                    {'programId': Get.arguments}
                                  ]),
                              child: Obx(
                                () => OptionCard(
                                  imagePath: ImageConstant.expiredpoints,
                                  points: controller.parsePoints(
                                      controller.points.value.expirepoints),
                                  text: 'Expired Point',
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(
                          //     width:
                          //         10), // Add some spacing between the cards
                          Expanded(
                            child: GestureDetector(
                              onTap: () => Get.toNamed(
                                  AppRoutes.campaignbalanceprogramId,
                                  arguments: [
                                    {
                                      'calculatedpayout':
                                          controller.points.value.balancePoints
                                    },
                                    {'programId': Get.arguments}
                                  ]),
                              child: Obx(
                                () => OptionCard(
                                  imagePath: ImageConstant.balancepoints,
                                  points: controller.parsePoints(controller
                                      .points.value.balancePoints
                                      .toString()),
                                  text: 'Balance Point',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 1.h),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'My performance',
                    style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromRGBO(25, 25, 25, 1)),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  height: 275.sp, // Adjusted height to accommodate the red box
                  color: const Color.fromRGBO(255, 255, 255, 1),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      top: 10,
                      right: 20,
                      bottom: 10,
                    ),
                    child: SingleChildScrollView(
                      physics: NeverScrollableScrollPhysics(),
                      // Added SingleChildScrollView to handle overflow
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Credit card',
                                style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.sp,
                                  color: const Color.fromRGBO(25, 25, 25, 1),
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRoutes.inceniveplans,
                                      arguments: controller.leaderBoardResponse
                                          .value.programDetails![0].programId);
                                },
                                child: Text(
                                  'View Incentives Plan',
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.sp,
                                    color:
                                        const Color.fromARGB(255, 26, 7, 236),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          const Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Container(
                                  width:
                                      10, // Adjust width of the box as needed
                                  height:
                                      10, // Adjust height of the box as needed
                                  decoration: BoxDecoration(
                                    color: Colors.green, // Color of the box
                                    shape:
                                        BoxShape.rectangle, // Shape of the box
                                    borderRadius: BorderRadius.circular(
                                        2), // Adjust border radius as needed
                                  ),
                                ),
                              ),
                              const SizedBox(
                                  width:
                                      5), // Add spacing between the box and text
                              Text(
                                'Indicates overachievement region',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10.sp,
                                  color: Color.fromARGB(255, 14, 14, 14),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: SizedBox(
                              width: 300.sp,
                              // height: 200,
                              child: Obx(
                                () => Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    SfRadialGauge(
                                      enableLoadingAnimation: true,
                                      axes: <RadialAxis>[
                                        RadialAxis(
                                          minimum: 0,
                                          maximum: 15,
                                          startAngle: 180,
                                          endAngle: 0,
                                          showLabels: false,
                                          showTicks: false,
                                          axisLineStyle: AxisLineStyle(
                                            thickness: 35,
                                            color: Colors.grey[200],
                                            thicknessUnit:
                                                GaugeSizeUnit.logicalPixel,
                                            cornerStyle: CornerStyle.bothCurve,
                                          ),
                                          pointers: const <GaugePointer>[
                                            NeedlePointer(
                                              value: 9,
                                              enableAnimation: true,
                                              needleLength: 1,
                                              needleStartWidth: 0,
                                              needleEndWidth: 8,
                                              needleColor: Colors.black,
                                              knobStyle:
                                                  KnobStyle(knobRadius: 0.1),
                                            ),
                                          ],
                                          ranges: <GaugeRange>[
                                            GaugeRange(
                                              startValue: 0,
                                              endValue: 3.5,
                                              color: Color(0xFF36b2e5),
                                              startWidth: 40,
                                              endWidth: 40,
                                            ),
                                            GaugeRange(
                                              startValue: 3.5,
                                              endValue: 6.5,
                                              color: Color(0xFFe64857),
                                              startWidth: 40,
                                              endWidth: 40,
                                            ),
                                            GaugeRange(
                                              startValue: 6.5,
                                              endValue: 10,
                                              color: Color(0xFFfc8f2d),
                                              startWidth: 40,
                                              endWidth: 40,
                                            ),
                                            GaugeRange(
                                              startValue: 10,
                                              endValue: 13.5,
                                              color: Color(0xFFfbe807),
                                              startWidth: 40,
                                              endWidth: 40,
                                            ),
                                            GaugeRange(
                                              startValue: 13.5,
                                              endValue: 15,
                                              color: Color(0xFF008000),
                                              startWidth: 40,
                                              endWidth: 40,
                                            ),
                                          ],
                                          annotations: <GaugeAnnotation>[
                                            GaugeAnnotation(
                                              widget: Transform.rotate(
                                                angle: -1.7,
                                                child: Text(
                                                  (controller
                                                              .controll
                                                              .achievements
                                                              ?.value
                                                              .targetdat ??
                                                          '')
                                                      .split('.')
                                                      .first,
                                                  // Replace with your static or dynamic value
                                                  style: TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 8.sp,
                                                    color: Color.fromARGB(
                                                        255, 14, 14, 14),
                                                  ),
                                                ),
                                              ),
                                              angle: 180,
                                              positionFactor: 1.19,
                                            ),
                                            GaugeAnnotation(
                                              widget: Transform.rotate(
                                                angle:
                                                    -0.7, // Rotate text by 0.5 radians (about 28.65 degrees)
                                                child: Text(
                                                  NumberFormat('#,###').format(
                                                    int.parse(
                                                      (controller
                                                                  .controll
                                                                  .achievements
                                                                  ?.value
                                                                  ?.targetdata ??
                                                              '')
                                                          .split('.')
                                                          .first,
                                                    ),
                                                  ),
                                                  style: TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 8.sp,
                                                    color: Color.fromARGB(
                                                        255, 14, 14, 14),
                                                  ),
                                                ),
                                              ),
                                              angle: 225,
                                              positionFactor:
                                                  1.25, // Change the position of the text
                                            ),
                                            GaugeAnnotation(
                                              widget: Text(
                                                NumberFormat('#,###').format(
                                                  int.parse(
                                                    (controller
                                                                .controll
                                                                .achievements
                                                                ?.value
                                                                ?.targetdataa ??
                                                            '')
                                                        .split('.')
                                                        .first,
                                                  ),
                                                ),
                                                // Replace with your static or dynamic value
                                                style: TextStyle(
                                                  fontStyle: FontStyle.italic,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 8.sp,
                                                  color: Color.fromARGB(
                                                      255, 14, 14, 14),
                                                ),
                                              ),
                                              angle: 260,
                                              positionFactor: 1.25,
                                            ),
                                            GaugeAnnotation(
                                              widget: Transform.rotate(
                                                angle: 0.4,
                                                child: Text(
                                                  NumberFormat('#,###').format(
                                                    int.parse(
                                                      (controller
                                                                  .controll
                                                                  .achievements
                                                                  ?.value
                                                                  ?.targetdataaa ??
                                                              '')
                                                          .split('.')
                                                          .first,
                                                    ),
                                                  ),
                                                  // Replace with your static or dynamic value
                                                  style: TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 8.sp,
                                                    color: Color.fromARGB(
                                                        255, 14, 14, 14),
                                                  ),
                                                ),
                                              ),
                                              angle: 300,
                                              positionFactor: 1.25,
                                            ),
                                            GaugeAnnotation(
                                              widget: Transform.rotate(
                                                angle: 1.4,
                                                child: Text(
                                                  NumberFormat('#,###').format(
                                                    int.parse(
                                                      (controller
                                                                  .controll
                                                                  .achievements
                                                                  ?.value
                                                                  ?.targetdataaaa ??
                                                              '')
                                                          .split('.')
                                                          .first,
                                                    ),
                                                  ),
                                                  // Replace with your static or dynamic value
                                                  style: TextStyle(
                                                    fontStyle: FontStyle.italic,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 8.sp,
                                                    color: Color.fromARGB(
                                                        255, 14, 14, 14),
                                                  ),
                                                ),
                                              ),
                                              angle: 345,
                                              positionFactor: 1.24,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 75
                      .h, // Increase height to accommodate positioned elements
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 8.h,
                        left: 38.w,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  45.w), // Add padding for better alignment
                          height: 30.h,
                          color: Color.fromARGB(255, 190, 22, 10),
                          alignment: Alignment.center,
                          child: Obx(
                            () {
                              final achievementValue = double.tryParse(
                                  controller.controll?.achievements?.value
                                          ?.totalAchievement ??
                                      '');
                              return Text(
                                'Your Achievement: ${achievementValue != null ? achievementValue.toStringAsFixed(3) : ''}',
                                style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: Color.fromARGB(255, 242, 240, 240),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50.h,
                        left: 140.w,
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.viewdetailsforachivdements,
                                arguments: controller.leaderBoardResponse.value
                                    .programDetails![0].programId);
                          },
                          child: Text(
                            'View Details',
                            style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontWeight: FontWeight.w900,
                              fontSize: 10.sp,
                              color: Color.fromARGB(255, 33, 33, 243),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 21),
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
                    // Padding(
                    //     padding: const EdgeInsets.only(top: 21),
                    //     child: GestureDetector(
                    //       onTap: () {
                    //         Get.toNamed(AppRoutes.typeAleaderboard,
                    //             arguments: controller.leaderBoardResponse
                    //                 .value.programDetails![0].programId);
                    //       },
                    //       child: Text(
                    //         'View All',
                    //         style: TextStyle(
                    //             fontFamily: GoogleFonts.poppins().fontFamily,
                    //             fontSize: 12.sp,
                    //             fontWeight: FontWeight.bold,
                    //             color: Colors.blue),
                    //       ),
                    //     )),
                    Visibility(
                      visible:
                          controller.leaderBoardResponse.value.programDetails !=
                                  null &&
                              controller.leaderBoardResponse.value
                                  .programDetails!.isNotEmpty &&
                              controller
                                      .leaderBoardResponse
                                      .value
                                      .programDetails![0]
                                      .participantsViewLeaderboard ==
                                  '1',
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
                          Icons.calendar_today, // Use the desired icon here
                          size: 12.sp, // Adjust the icon size as needed
                          color: const Color.fromARGB(255, 102, 101, 101),
                        ),
                        SizedBox(
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
                    // Check if leaderboard is enabled
                    if (controller.leaderBoardResponse.value.programDetails
                            ?.isNotEmpty ??
                        controller.leaderBoardResponse.value.programDetails!
                                .first.leaderboardEnable !=
                            '1') {
                      return Container(
                        width: 360.sp,
                        height: 189.sp,
                        color: const Color.fromARGB(255, 174, 173, 173),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 0, right: 0, bottom: 5, top: 5),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                controller
                                    .leaderBoardResponse.value.userIds!.length,
                                (index) {
                                  final userId = controller.leaderBoardResponse
                                      .value.userIds![index];
                                  final user = controller
                                      .leaderBoardResponse.value.users![userId];
                                  final userRank = controller
                                      .leaderBoardResponse
                                      .value
                                      .allRank![userId];
                                  // Print URL for debugging
                                  print(
                                      'Profile image URL: ${Url.profileimageUrl}${user?.profile}');

                                  return Padding(
                                    padding: const EdgeInsets.only(right: 0),
                                    child: Card(
                                      elevation: 4,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
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
                                                        color: Colors
                                                            .red, // Border color red
                                                        width:
                                                            2, // Border width
                                                      ),
                                                    ),
                                                    child: ClipOval(
                                                      child:
                                                          user?.profile != null
                                                              ? Image.network(
                                                                  '${Url.imageUrl}${user!.profile}',
                                                                  width: 60,
                                                                  height: 60,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  loadingBuilder: (BuildContext
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
                                                                          value: loadingProgress.expectedTotalBytes != null
                                                                              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                                                              : null,
                                                                        ),
                                                                      );
                                                                    }
                                                                  },
                                                                  errorBuilder: (BuildContext
                                                                          context,
                                                                      Object
                                                                          exception,
                                                                      StackTrace?
                                                                          stackTrace) {
                                                                    return Icon(
                                                                        Icons
                                                                            .person,
                                                                        size:
                                                                            60);
                                                                  },
                                                                )
                                                              : const Icon(
                                                                  Icons.person,
                                                                  size: 60),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    bottom: 0,
                                                    right: 0,
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      decoration:
                                                          const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.red,
                                                      ),
                                                      child: Text(
                                                        '${index + 1}',
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
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                                overflow: TextOverflow
                                                    .ellipsis, // Truncate long text
                                                maxLines:
                                                    1, // Limit to one line
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
                                                maxLines:
                                                    1, // Limit to one line
                                              ),
                                              const SizedBox(height: 1),
                                              Text(
                                                'Points: ${userRank?.points ?? 'N/A'}', // Assuming 'points' is a field in the user model
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
                      // Return a different widget or null if leaderboard is not enabled
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
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                  ),
                                ),
                              ),
                            ],
                          )); // Or any other widget you want to display
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
                            // 'Campaign Name',
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
                            controller.leaderBoardResponse.value
                                    .programDetails![0].bannerUrl !=
                                null)
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Row(
                              children: [
                                Text(
                                  '${controller.controllpoints.terminologytext}\n Bananer',
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w100,
                                      color:
                                          const Color.fromRGBO(25, 25, 25, 1)),
                                ),

                                const SizedBox(
                                    width:
                                        60), // Add some space between text and image
                                Image.network(
                                  'https://s3.ap-south-1.amazonaws.com/grginternal/stage/COMP000080/' +
                                      controller.leaderBoardResponse.value
                                          .programDetails![0].bannerUrl!,
                                  width: 150,
                                  height: 50,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Text(
                                      'Image not found',
                                      style: TextStyle(
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold,
                                          color: const Color.fromRGBO(
                                              25, 25, 25, 1)),
                                    );
                                  },
                                ),
                              ],
                            ),
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
                            controller.leaderBoardResponse.value
                                    .programCoOwners!.isNotEmpty
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
          ),
        ),
      ),
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
            width: 3.7.w,
            height: 15.7.h,
          ),
        ),
      ),
      title: Text(
        // 'Campaign Details',
        '${controller.controllpoints.terminologytext} Details',
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

  Widget _basicinformation(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: SizedBox(
                width: 150.w,
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
