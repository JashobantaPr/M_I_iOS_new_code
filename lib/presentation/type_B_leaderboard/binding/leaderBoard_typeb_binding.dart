import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:incentivesgit/presentation/type_B_leaderboard/controller/leaderBoard_typeb_controller.dart';

class LeaderBoardTypeBBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LeaderBTypeBController);
  }
}
