import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_tabbar.dart/posts/controller/post_controller.dart';

class QuizzesPostBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizzesPostController());
    // TODO: implement dependencies
  }
}
