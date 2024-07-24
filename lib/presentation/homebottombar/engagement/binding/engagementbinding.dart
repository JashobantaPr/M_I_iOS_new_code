import 'package:get/get.dart';
import 'package:incentivesgit/presentation/homebottombar/engagement/controller/engagementcontroller.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_tabbar.dart/controller/quizzes_tabbar_controller.dart';

class EngagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EngagementController());
    Get.lazyPut(() => QuizzesTabbarController());
  }
}
