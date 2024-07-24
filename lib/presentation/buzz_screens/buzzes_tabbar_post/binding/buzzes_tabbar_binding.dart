import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzzes_tabbar_post/controller/buzzes_tabbar_post_controller.dart';

class BuzzesTabbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BuzzesTababrPostController());
  }
}
