import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/type_A_leaderboard/controller/leaderboard_controller.dart';

class LeaderBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LeaderBoardController());
  }
}
