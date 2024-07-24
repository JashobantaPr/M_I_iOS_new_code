import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_tabbar.dart/live_quiz/controller/live_quiz_controller.dart';

class LiveQuizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LiveQuizController());
    // TODO: implement dependencies
  }
}
