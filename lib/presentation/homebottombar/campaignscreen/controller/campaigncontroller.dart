import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/model/activecampaignmodel.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/model/campaignmodel.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/service/campaignservice.dart';

import '../model/tiermodel.dart';

class CampaingController extends GetxController {
  var currentIndex = 0.obs;
  final isPopupOpen = false.obs;
  var points = Pointscount().obs;
  var campaigns = <ActiveCampaigns>[].obs;
  var banners = <String>[].obs;
  var terminologytext = ''.obs;
  var accessbanners = ''.obs;
  Rx<int> sliderIndex = 0.obs;
  final dotscontroller = PageController(viewportFraction: 0.8, keepPage: true);
  PageController pageController = PageController();

  void changePage(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  void togglePopup() {
    isPopupOpen.toggle();
  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  var tierData = Rx<TierDataResponse?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchPoints();
    fetchBanners();
    fetchCampaigns();
    bannersaccess();
    terminlogytext();
    fetchtierdata();
  }

  void fetchtierdata() async {
    try {
      var fetchedtierdata = await Campaignservices().tierdata();
      if (fetchedtierdata != null) {
        tierData.value = fetchedtierdata;
      }
    } catch (e) {
      print("Failed to fetch tier data: $e");
    }
  }

  void fetchPoints() async {
    try {
      var fetchedPoints = await Campaignservices().totalpoints();
      if (fetchedPoints != null) {
        points.value = fetchedPoints;
      }
    } catch (e) {
      print("Failed to fetch points: $e");
    }
  }

  int parsePoints(String? pointsStr) {
    if (pointsStr == null) {
      return 0;
    }
    return int.tryParse(pointsStr) ?? 0;
  }

  void fetchCampaigns() async {
    try {
      var fetchedcampaigns = await Campaignservices().campaigns();
      if (fetchedcampaigns != null) {
        campaigns.value = fetchedcampaigns;
      }
    } catch (e) {
      print("Failed to fetch campaigns: $e");
    }
  }

  void fetchBanners() async {
    try {
      var fetchedBanners = await Campaignservices().fetchBanners();
      if (fetchedBanners != null) {
        banners.value = fetchedBanners;
      }
    } catch (e) {
      print("Failed to fetch campaigns: $e");
    }
  }

  void terminlogytext() async {
    try {
      var terminology = await Campaignservices().programterminologytext();
      if (terminology != null) {
        terminologytext.value = terminology;
      }
    } catch (e) {
      print("Failed to fetch campaigns: $e");
    }
  }

  void bannersaccess() async {
    try {
      var bannersaccess = await Campaignservices().displaybanner();
      if (bannersaccess != null) {
        accessbanners.value = bannersaccess;
      }
    } catch (e) {
      print("Failed to fetch campaigns: $e");
    }
  }
}
