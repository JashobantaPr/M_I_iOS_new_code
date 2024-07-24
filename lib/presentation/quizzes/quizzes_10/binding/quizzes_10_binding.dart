import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_10/controller/quizzes_10_controller.dart';

class Quizzes10Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Quizzes10Controller);
  }
}
