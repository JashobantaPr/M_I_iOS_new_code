import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/News/create_news/controller/create_news_controller.dart';

class CreaateNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateNewsController());
  }
}
