import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:incentivesgit/presentation/quizzes/quizzes_16/controller/quizzes_16_controller.dart';

class Quizzes16Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Quizzes16Controller
    );
  }
}
