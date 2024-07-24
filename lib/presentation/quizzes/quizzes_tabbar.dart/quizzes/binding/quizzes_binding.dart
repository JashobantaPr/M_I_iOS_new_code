import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_tabbar.dart/quizzes/controller/quizzes_controller.dart';

class QuizzesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizzesController());
    // TODO: implement dependencies
  }
}
