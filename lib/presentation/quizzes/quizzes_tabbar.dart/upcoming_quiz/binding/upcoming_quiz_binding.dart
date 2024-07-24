import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_details/binding/quizzes_details_binding.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_tabbar.dart/upcoming_quiz/controller/upcoming_quiz_controller.dart';

class UpcomingQuizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpcomingQuizController());
    Get.lazyPut(() => QuizzesDetailsBinding());
  }
}
