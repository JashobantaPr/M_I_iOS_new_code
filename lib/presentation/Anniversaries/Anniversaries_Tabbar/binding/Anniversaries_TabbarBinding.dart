import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/Anniversaries/Anniversaries_Tabbar/controller/anniversaries_tabbarController.dart';

class  AnniversariesTabBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AnniversariesTabBarController());
  }
}
