import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_tabbar.dart/live_quiz/controller/live_quiz_controller.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_tabbar.dart/posts/controller/post_controller.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_tabbar.dart/quizzes/controller/quizzes_controller.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_tabbar.dart/upcoming_quiz/controller/upcoming_quiz_controller.dart';

import '../controller/quizzes_tabbar_controller.dart';

class QuizzesTabbarBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizzesTabbarController());
    Get.lazyPut(() => QuizzesPostController());
    Get.lazyPut(() => QuizzesController());
    Get.lazyPut(() => LiveQuizController());
    Get.lazyPut(() => UpcomingQuizController());
    // TODO: implement dependencies
  }
}
