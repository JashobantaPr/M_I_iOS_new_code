import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/News/news_Tabbar/controller/News_tabbarController.dart';

class  NewsTabBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewsTabBarController());
  }
}
