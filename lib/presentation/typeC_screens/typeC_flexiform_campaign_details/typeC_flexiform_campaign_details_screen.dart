import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/controller/campaigncontroller.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/model/gridItem.dart';
import 'package:incentivesgit/presentation/typeC_screens/claim_approval_based_awarding_of_points_claim_management/claim_approval_based_awarding_of_points_claim_management_screen.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_flexiform_campaign_details/controller/typeC_flexiform_campaign_details_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';

class TypeCCampaignDetailsScreen
    extends GetWidget<TypeCCampaignDetailsController> {
  const TypeCCampaignDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CampaingController());
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
                      const ClaimApprovalBasedAwardingofPointsClaimManagement()
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
      title: const Text(
        "Campaign Details",
        style: TextStyle(
          color: Colors.white, // Set text color to white
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white, // Set arrow color to white
        ),
        onPressed: () {
          Get.back();
        },
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
                          "Campaign Summary",
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
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
                            fontWeight: FontWeight.w400,
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
      padding: const EdgeInsets.symmetric(horizontal: 18),
      color: const Color.fromRGBO(240, 240, 240, 1),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Points Dashboard',
                  style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                      color: const Color.fromRGBO(25, 25, 25, 1)),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.info_outline_rounded,
                    size: 18.sp,
                    color: const Color.fromRGBO(109, 109, 109, 1),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  points: 6400,
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
                  points: 4927,
                  text: 'Redeemed Point',
                ),
              )
            ],
          ),
          const SizedBox(height: 5),
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
                child: OptionCard(
                  imagePath: ImageConstant.redeemedpoints,
                  points: 73,
                  text: 'Expired Point',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.campaignbalanceprogramId, arguments: [
                    {'calculatedpayout': controller.points.value.balancePoints},
                    {'programId': Get.arguments}
                  ]);
                },
                child: OptionCard(
                  imagePath: ImageConstant.redeemedpoints,
                  points: 1400,
                  text: 'Balance Point',
                ),
              )
            ],
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
          _buildBasicInformation(),
        ],
      ),
    );
  }

  Widget _buildBasicInformation() {
    return Container(
      color: Colors.white, // Set background color to white
      padding: const EdgeInsets.all(10), // Add padding for spacing
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.start, // Align to the start (left side)
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 120, // Adjust the width as needed
                child: Text(
                  'Campaign Id',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13,
                  ),
                ),
              ),
              const Spacer(), // Adds space between 'Transaction' and ':'
              const Text(":"),
              const Spacer(), // Adds space between ':' and 'Credit'
              SizedBox(
                width: 178, // Adjust the width as needed
                child: Text(
                  'PID000077 ',
                  style: TextStyle(
                      color: const Color(0xFF383853),
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 13),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.start, // Align to the start (left side)
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 120, // Adjust the width as needed
                child: Text(
                  'Campaign Name',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13,
                  ),
                ),
              ),
              const Spacer(), // Adds space between 'Transaction' and ':'
              const Text(":"),
              const Spacer(), // Adds space between ':' and 'Credit'
              SizedBox(
                width: 178, // Adjust the width as needed
                child: Text(
                  'Type C : Claim Approval Based Awarding of Points',
                  style: TextStyle(
                      color: const Color(0xFF383853),
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 13),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.start, // Align to the start (left side)
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 120, // Adjust the width as needed
                child: Text(
                  'Start Date ',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13,
                  ),
                ),
              ),
              const Spacer(), // Adds space between 'Transaction' and ':'
              const Text(":"),
              const Spacer(), // Adds space between ':' and 'Credit'
              SizedBox(
                width: 178, // Adjust the width as needed
                child: Text(
                  '29-03-2023',
                  style: TextStyle(
                      color: const Color(0xFF383853),
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 13),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.start, // Align to the start (left side)
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 120, // Adjust the width as needed
                child: Text(
                  'End Date',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13,
                  ),
                ),
              ),
              const Spacer(), // Adds space between 'Transaction' and ':'
              const Text(":"),
              const Spacer(), // Adds space between ':' and 'Credit'
              SizedBox(
                width: 178, // Adjust the width as needed
                child: Text(
                  '29-03-2023',
                  style: TextStyle(
                      color: const Color(0xFF383853),
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 13),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.start, // Align to the start (left side)
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 120, // Adjust the width as needed
                child: Text(
                  'Banner',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13,
                  ),
                ),
              ),
              const Spacer(), // Adds space between 'Transaction' and ':'
              const Text(":"),
              const Spacer(), // Adds space between ':' and 'Credit'
              SizedBox(
                width: 178, // Adjust the width as needed
                child: Text(
                  'CL10201001',
                  style: TextStyle(
                      color: const Color(0xFF383853),
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 13),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.start, // Align to the start (left side)
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 120, // Adjust the width as needed
                child: Text(
                  'Description',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13,
                  ),
                ),
              ),
              const Spacer(), // Adds space between 'Transaction' and ':'
              const Text(":"),
              const Spacer(), // Adds space between ':' and 'Credit'
              SizedBox(
                width: 178, // Adjust the width as needed
                child: Text(
                  'Dell Storm Trooper1',
                  style: TextStyle(
                      color: const Color(0xFF383853),
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 13),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.start, // Align to the start (left side)
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 120, // Adjust the width as needed
                child: Text(
                  'Owner',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13,
                  ),
                ),
              ),
              const Spacer(), // Adds space between 'Transaction' and ':'
              const Text(":"),
              const Spacer(), // Adds space between ':' and 'Credit'
              SizedBox(
                width: 178, // Adjust the width as needed
                child: Text(
                  'Nikhil Patil ',
                  style: TextStyle(
                      color: const Color(0xFF383853),
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 13),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.start, // Align to the start (left side)
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 120, // Adjust the width as needed
                child: Text(
                  'Co-Owners',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13,
                  ),
                ),
              ),
              const Spacer(), // Adds space between 'Transaction' and ':'
              const Text(":"),
              const Spacer(), // Adds space between ':' and 'Credit'
              SizedBox(
                width: 178, // Adjust the width as needed
                child: Text(
                  '-',
                  style: TextStyle(
                      color: const Color(0xFF383853),
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 13),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.start, // Align to the start (left side)
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 120, // Adjust the width as needed
                child: Text(
                  'Points Owners ',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13,
                  ),
                ),
              ),
              const Spacer(), // Adds space between 'Transaction' and ':'
              const Text(":"),
              const Spacer(), // Adds space between ':' and 'Credit'
              SizedBox(
                width: 178, // Adjust the width as needed
                child: Text(
                  '-',
                  style: TextStyle(
                      color: const Color(0xFF383853),
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 13),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.start, // Align to the start (left side)
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 120, // Adjust the width as needed
                child: Text(
                  'Report Owners',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13,
                  ),
                ),
              ),
              const Spacer(), // Adds space between 'Transaction' and ':'
              const Text(":"),
              const Spacer(), // Adds space between ':' and 'Credit'
              SizedBox(
                width: 178, // Adjust the width as needed
                child: Text(
                  '-',
                  style: TextStyle(
                      color: const Color(0xFF383853),
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 13),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.start, // Align to the start (left side)
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 120, // Adjust the width as needed
                child: Text(
                  'Sponsor Name',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13,
                  ),
                ),
              ),
              const Spacer(), // Adds space between 'Transaction' and ':'
              const Text(":"),
              const Spacer(), // Adds space between ':' and 'Credit'
              SizedBox(
                width: 178, // Adjust the width as needed
                child: Text(
                  'WazirX',
                  style: TextStyle(
                      color: const Color(0xFF383853),
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 13),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.start, // Align to the start (left side)
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 120, // Adjust the width as needed
                child: Text(
                  '1st level Approval',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13,
                  ),
                ),
              ),
              const Spacer(), // Adds space between 'Transaction' and ':'
              const Text(":"),
              const Spacer(), // Adds space between ':' and 'Credit'
              SizedBox(
                width: 178, // Adjust the width as needed
                child: Text(
                  'Chetana Shelar',
                  style: TextStyle(
                      color: const Color(0xFF383853),
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 13),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.start, // Align to the start (left side)
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 125, // Adjust the width as needed
                child: Text(
                  '2nd level Approval',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13,
                  ),
                ),
              ),
              const Spacer(), // Adds space between 'Transaction' and ':'
              const Text(":"),
              const Spacer(), // Adds space between ':' and 'Credit'
              SizedBox(
                width: 178, // Adjust the width as needed
                child: Text(
                  '-',
                  style: TextStyle(
                      color: const Color(0xFF383853),
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 13),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.start, // Align to the start (left side)
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 122, // Adjust the width as needed
                child: Text(
                  '3rd level Approval',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13,
                  ),
                ),
              ),
              const Spacer(), // Adds space between 'Transaction' and ':'
              const Text(":"),
              const Spacer(), // Adds space between ':' and 'Credit'
              SizedBox(
                width: 178, // Adjust the width as needed
                child: Text(
                  '-',
                  style: TextStyle(
                      color: const Color(0xFF383853),
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 13),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment:
                MainAxisAlignment.start, // Align to the start (left side)
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 120, // Adjust the width as needed
                child: Text(
                  'Expiry date',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontSize: 13,
                  ),
                ),
              ),
              const Spacer(), // Adds space between 'Transaction' and ':'
              const Text(":"),
              const Spacer(), // Adds space between ':' and 'Credit'
              SizedBox(
                width: 178, // Adjust the width as needed
                child: Text(
                  '29-03-2023 ',
                  style: TextStyle(
                      color: const Color(0xFF383853),
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 13),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
