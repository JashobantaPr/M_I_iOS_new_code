import 'package:incentivesgit/core/app_export.dart';

import '../controller/article_controller.dart';



class ArticleScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleScreenController());
   
  }
}
