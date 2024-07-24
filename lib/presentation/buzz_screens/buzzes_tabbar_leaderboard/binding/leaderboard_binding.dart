import 'package:get/get.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzzes_tabbar_leaderboard/controller/leaderboard_controller.dart';

class BuzzesTabbarLeaderBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BuzzesTabbarLeaderBoardController());
  }
}
