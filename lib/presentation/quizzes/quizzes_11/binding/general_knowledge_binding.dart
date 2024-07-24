import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_11/controller/general_knowledge_controller.dart';

class GeneralKnowledgeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => GeneralKnowledgeController());
  }
}
