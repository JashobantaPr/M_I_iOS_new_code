import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_details/controller/quizzes_details_controller.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_details/myscrore_card/controller/my_score_card_controller.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_details/top_rankers/controller/top_ranker_controller.dart';

class QuizzesDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizzesDetailsController());
    Get.lazyPut(() => MyScoreCardController());
    Get.lazyPut(() => ToprankersController());
  }
}
