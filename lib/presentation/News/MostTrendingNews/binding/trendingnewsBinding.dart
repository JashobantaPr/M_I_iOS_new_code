import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/News/MostTrendingNews/controller/mosttrending_news_Anniversariescontroller.dart';

class MostTrendingNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MostTrebdingNewsAnniversariesController());
  }
}
