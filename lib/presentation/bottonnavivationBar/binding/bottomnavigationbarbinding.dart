import 'package:get/get.dart';
import 'package:incentivesgit/presentation/bottonnavivationBar/controller/bottomnavigationbarcontroller.dart';
import 'package:incentivesgit/presentation/homebottombar/account/controller/accountcontroller.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/controller/campaigncontroller.dart';
import 'package:incentivesgit/presentation/homebottombar/engagement/controller/engagementcontroller.dart';
import 'package:incentivesgit/presentation/rewards/rewards-landing/controller/reward-landing_controller.dart';

/// A binding class for the HomeOneScreen.
///
/// This class ensures that the HomeOneController is created when the
/// HomeOneScreen is first loaded.
class BottomNavBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigationBarController());
    Get.lazyPut(() => CampaingController());
    Get.lazyPut(() => EngagementController());
    Get.lazyPut(() => RewardsController());
    Get.lazyPut(() => AccountController());
  }
}
