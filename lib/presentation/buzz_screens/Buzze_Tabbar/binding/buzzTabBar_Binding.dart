import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/buzz_screens/Buzze_Tabbar/controller/buzzeTabBar_Controller.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzzes_tabbar_post/controller/buzzes_tabbar_post_controller.dart';

class BuzzesTabBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BuzzesTabBarController());
    Get.lazyPut(() => BuzzesTababrPostController());
  }
}
