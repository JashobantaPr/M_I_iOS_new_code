import 'package:incentivesgit/core/app_export.dart';

import '../controller/trending_article_controller.dart';

class TreandingArticleScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TreandingArticleScreenController());
  }
}
