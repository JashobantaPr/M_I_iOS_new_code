import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incentivesgit/core/utils/image_constant.dart';
import 'package:incentivesgit/presentation/bottonnavivationBar/bottomnavigationbar.dart';
import 'package:incentivesgit/presentation/homebottombar/account/accountscreen.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/campaignscreen.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/controller/campaigncontroller.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/service/campaignservice.dart';
import 'package:incentivesgit/presentation/homebottombar/engagement/engagementscreen.dart';
import 'package:incentivesgit/presentation/rewards/rewards-landing/reward-landing_screen.dart';

/// A controller class for the HomeOneScreen.
///
/// This class manages the state of the HomeOneScreen, including the
/// current homeOneModelObj
class BottomNavigationBarController extends GetxController {
  var selectedIndex = 0.obs;
  var terminologytext = ''.obs;

  void changePage(int index) {
    final CampaingController controllerz = Get.find();
    selectedIndex.value = index;
    if (index == 0) {
      controllerz.onPageChanged(0);
    }

    // Update bottom menu list
    for (int i = 0; i < bottomMenuList.length; i++) {
      bottomMenuList[i].isSelected = i == index;
    }
    // Notify observers about the changes
    bottomMenuList.refresh();
  }

  void terminlogytext() async {
    try {
      var terminology = await Campaignservices().programterminologytext();
      if (terminology != null) {
        terminologytext.value = terminology;
        bottomMenuList[0].title.value =
            terminology; // Update the title reactively
      }
    } catch (e) {
      print("Failed to fetch campaigns: $e");
    }
  }

  List<Widget> get pages => _pages;

  final List<Widget> _pages = [
    const CampaignScreen(),
    const EngagementScreen(),
    const RewardsScreen(),
    const AccountScreen(),
  ];

  RxList<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.campaigninactive,
      activeIcon: ImageConstant.campaignactive,
      title: "", // Initialize with an empty string
      type: BottomBarEnum.campaign,
      isSelected: true,
    ),
    BottomMenuModel(
      icon: ImageConstant.engagementinactive,
      activeIcon: ImageConstant.engagementactive,
      title: "Engagement",
      type: BottomBarEnum.engagement,
      isSelected: false,
    ),
    BottomMenuModel(
      icon: ImageConstant.rewardsinactive,
      activeIcon: ImageConstant.rewardsactive,
      title: "Rewards",
      type: BottomBarEnum.reward,
      isSelected: false,
    ),
    BottomMenuModel(
      icon: ImageConstant.accountinactive,
      activeIcon: ImageConstant.accountactive,
      title: "Account",
      type: BottomBarEnum.account,
      isSelected: false,
    )
  ].obs;
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    required String title,
    required this.type,
    this.isSelected = false,
  }) : title = title.obs;

  String icon;
  String activeIcon;
  RxString title;
  BottomBarEnum type;
  bool isSelected;
}
