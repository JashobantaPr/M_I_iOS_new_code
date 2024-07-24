import 'package:incentivesgit/core/app_export.dart';

import '../controller/create_article_controller.dart';

class AwCreateArticleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateArticleController());
  }
}
