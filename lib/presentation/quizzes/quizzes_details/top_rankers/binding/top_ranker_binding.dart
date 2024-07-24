import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_details/top_rankers/controller/top_ranker_controller.dart';

class TopRankerBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ToprankersController());
  }
}
