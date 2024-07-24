import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_details/myscrore_card/controller/my_score_card_controller.dart';

class MyScoreCardBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => MyScoreCardController());
  }
}
