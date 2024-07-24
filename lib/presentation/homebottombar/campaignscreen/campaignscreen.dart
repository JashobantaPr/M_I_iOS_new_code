import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/controller/campaigncontroller.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/model/activecampaignmodel.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/model/gridItem.dart';
import 'package:incentivesgit/presentation/homebottombar/my_campainns/controller/my_campains_controller.dart';
import 'package:incentivesgit/presentation/homebottombar/my_campainns/my_campains_screen.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import 'package:incentivesgit/widgets/popupview.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CampaignScreen extends GetWidget<CampaingController> {
  const CampaignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CampaingController());
    Get.put(
        MyCampainsController()); // Ensure the MyCampainsController is put here
    return ScreenUtilInit(
      builder: (context, child) => Scaffold(
        appBar: _customAppBar(context),
        body: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Obx(() {
                  return PageView(
                    controller: controller.pageController,
                    pageSnapping: true,
                    onPageChanged: controller.onPageChanged,
                    children: [
                      dashboard(context),
                      const MyCapmainsScreen(),
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

  PreferredSizeWidget _customAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(228, 28, 57, 1),
      automaticallyImplyLeading: false,
      title: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(5.w),
          child: Image.asset(
            ImageConstant.imgLogo,
            width: 110.w,
            height: 16.h,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.hub);
            },
            child: SvgPicture.asset(
              ImageConstant.folder,
              width: 23.44.w,
              height: 20.24.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.notification);
            },
            child: SvgPicture.asset(
              ImageConstant.notification,
              width: 23.44.w,
              height: 20.24.h,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
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
                      controller.changePage(0);
                    },
                    child: Obx(() {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Opacity(
                            opacity:
                                controller.currentIndex.value == 0 ? 1.0 : 0.5,
                            child: Text(
                              "Dashboard",
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
                      controller.changePage(1);
                    },
                    child: Obx(() {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Opacity(
                            opacity:
                                controller.currentIndex.value == 1 ? 1.0 : 0.5,
                            child: Text(
                              "My ${controller.terminologytext}",
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
      ),
    );
  }

  Widget dashboard(BuildContext context) {
    final points = controller.points.value;
    return Container(
      color: appTheme.grey,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 11),
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
                  width: 3.w,
                ),
                const PopoverButton()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.campaignearnedpoints,
                        arguments: controller.points.value.earnedpoints);
                  },
                  child: OptionCard(
                    imagePath: ImageConstant.earnedpoints,
                    points: controller.parsePoints(points.earnedpoints),
                    text: 'Earned Points',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.campaignredeemedpoints,
                        arguments: controller.points.value.redempoints);
                  },
                  child: OptionCard(
                    imagePath: ImageConstant.redeemedpoints,
                    points: controller.parsePoints(points.redempoints),
                    text: 'Redeemed Points',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 3),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.campaignexpiredpoints,
                      arguments: controller.points.value.expirepoints),
                  child: OptionCard(
                    imagePath: ImageConstant.expiredpoints,
                    points: controller.parsePoints(points.expirepoints),
                    text: 'Expired Points',
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.campaignbalancepoints,
                      arguments: controller.points.value.balancePoints),
                  child: OptionCard(
                    imagePath: ImageConstant.balancepoints,
                    points:
                        controller.parsePoints(points.balancePoints.toString()),
                    text: 'Balance Points',
                  ),
                ),
              ],
            ),
          ),
          //view Tier screen .........
          Obx(() {
            return GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.viewtierscreen);
              },
              child: Row(
                children: controller.tierData.value?.tierType.map((tier) {
                      return Expanded(
                        child: Container(
                          height: 59,
                          margin: const EdgeInsets.only(
                              left: 13, right: 13, top: 5, bottom: 5),
                          decoration:
                              const BoxDecoration(color: Color(0XFFD1AB3E)),
                          child: Row(
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        '${Url.profileimageUrl}/${tier.tierLogoName}'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(4.0),
                                  child: Icon(
                                    Icons.circle,
                                    size: 37,
                                  ),
                                ),
                              ),
                              Text(
                                'You are a ',
                                style: TextStyle(
                                  color: const Color(0XFFFFFFFF),
                                  fontSize: 13,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              Text(
                                tier.tierName, // Use the actual tier name here
                                style: TextStyle(
                                  color: const Color(0XFFFFFFFF),
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              Text(
                                ' member.',
                                style: TextStyle(
                                  color: const Color(0XFFFFFFFF),
                                  fontSize: 13,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList() ??
                    [], // Default to an empty list if `tierType` is null
              ),
            );
          }),
          const SizedBox(
            height: 10,
          ),
          Obx(() {
            if (controller.accessbanners.value == '1') {
              if (controller.banners.isEmpty) {
                return const Center(
                  child: SpinKitFadingCircle(
                    color: Colors.black,
                    size: 50.0,
                  ),
                );
              } else {
                return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CarouselSlider.builder(
                          options: CarouselOptions(
                            aspectRatio: 16 / 9,
                            disableCenter: true,
                            height: 140.h,
                            initialPage: 0,
                            autoPlay: true,
                            viewportFraction: 1.0,
                            enableInfiniteScroll: false,
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (index, reason) {
                              controller.sliderIndex.value = index;
                            },
                          ),
                          itemCount: controller.banners.length,
                          itemBuilder: (context, index, realIndex) {
                            final banner = controller.banners[index];
                            return Image.network(
                              '${Url.imageUrl}$banner',
                              fit: BoxFit.fill,
                              width: MediaQuery.of(context)
                                  .size
                                  .width, // Full width
                            );
                          },
                        ),
                        Positioned(
                          bottom: 10.h,
                          child: Obx(() {
                            return AnimatedSmoothIndicator(
                              activeIndex: controller.sliderIndex.value,
                              count: controller.banners.length,
                              effect: JumpingDotEffect(
                                dotHeight: 11,
                                dotWidth: 11,
                                activeDotColor: appTheme.white,
                                dotColor: appTheme.grey,
                                verticalOffset: 10,
                              ),
                            );
                          }),
                        ),
                      ],
                    ));
              }
            } else {
              return const SizedBox();
            }
          }),
          Padding(
            padding: const EdgeInsets.only(top: 21, left: 11, right: 11),
            child: Text(
              'Active ${controller.terminologytext}',
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(25, 25, 25, 1),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(() {
            if (controller.campaigns.isEmpty) {
              return const Center(
                child: SpinKitFadingCircle(
                  color: Colors.black,
                  size: 50.0,
                ),
              );
            }
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.campaigns.length,
              itemBuilder: (context, index) {
                final campaign = controller.campaigns[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 11),
                  child: buildCampaignContainer(campaign, index),
                );
              },
            );
          }),
        ],
      ),
    );
  }

  Widget buildCampaignContainer(ActiveCampaigns campaign, index) {
    return Container(
      color: const Color.fromRGBO(255, 255, 255, 1),
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                campaign.name ?? '',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.sp,
                  color: const Color.fromRGBO(25, 25, 25, 1),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Divider(
                color: appTheme.greydivider,
                thickness: 1,
              ),
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                height: 107.h,
                child: Image.network('${Url.imageUrl}${campaign.bannerUrl}',
                    errorBuilder: (BuildContext context, Object exception,
                        StackTrace? stackTrace) {
                  return Container(
                    color: Colors.white,
                  );
                }),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                'Description :',
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontWeight: FontWeight.bold,
                  fontSize: 10.sp,
                  color: const Color.fromRGBO(25, 25, 25, 1),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Flexible(
                child: Text(
                  campaign.description ?? '',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.w500,
                    fontSize: 10.sp,
                    color: const Color.fromRGBO(25, 25, 25, 1),
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    if (campaign.campaignMode!
                        .isCaseInsensitiveContains('Type A')) {
                      Get.toNamed(AppRoutes.directawardingofpoints,
                          arguments: campaign.programId);
                    } else if (campaign.name!
                        .isCaseInsensitiveContains('Type B')) {
                      Get.toNamed(AppRoutes.typebcampaignDetails,
                          arguments: campaign.programId);
                    } else if (campaign.name!
                            .isCaseInsensitiveContains('Type C') &&
                        campaign.name!.isCaseInsensitiveContains('hierarchy')) {
                      Get.toNamed(AppRoutes.typectotalinvoiceregression,
                          arguments: campaign.programId);
                    } else if (campaign.name!
                            .isCaseInsensitiveContains('Type C') &&
                        campaign.name!.isCaseInsensitiveContains('KPI SKU')) {
                      Get.toNamed(AppRoutes.typectotalinvoiceregression,
                          arguments: campaign.programId);
                    } else if (campaign.name!
                            .isCaseInsensitiveContains('Type C') &&
                        campaign.name!
                            .isCaseInsensitiveContains('Total Invoice')) {
                      Get.toNamed(AppRoutes.typectotalinvoiceregression,
                          arguments: campaign.programId);
                    } else if (campaign.name!
                        .isCaseInsensitiveContains('Type C SKU')) {
                      Get.toNamed(AppRoutes.typectotalinvoiceregression,
                          arguments: campaign.programId);
                      print('sdadsfddddC${campaign.programId}');
                    } else if (campaign.name!
                            .isCaseInsensitiveContains('Type D') &&
                        campaign.name!
                            .isCaseInsensitiveContains('progress bar')) {
                      Get.toNamed(AppRoutes.campaigndetailscardprogressbar,
                          arguments: campaign.programId);
                    } else if (campaign.name!
                            .isCaseInsensitiveContains('Type D') &&
                        campaign.name!.isCaseInsensitiveContains('Card')) {
                      Get.toNamed(AppRoutes.campaigndetailscardscreen,
                          arguments: campaign.programId);
                    } else if (campaign.name!
                            .isCaseInsensitiveContains('Type D') &&
                        campaign.name!
                            .isCaseInsensitiveContains('target meter')) {
                      Get.toNamed(AppRoutes.campaigndetailstargetmeter,
                          arguments: campaign.programId);
                    } else if (campaign.name!
                        .isCaseInsensitiveContains('Type E')) {
                      Get.toNamed(AppRoutes.campaigndetailstargetmeter,
                          arguments: campaign.programId);
                    } else if (campaign.name!
                        .isCaseInsensitiveContains('Type F')) {
                      Get.toNamed(AppRoutes.directawardingofpoints,
                          arguments: campaign.programId);
                    } else if (campaign.name!
                        .isCaseInsensitiveContains('Type G')) {
                      Get.toNamed(AppRoutes.typegcampaigndetails,
                          arguments: campaign.programId);
                    }
                  },
                  child: Text(
                    'View Details',
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp,
                      color: const Color.fromRGBO(0, 14, 238, 1),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
