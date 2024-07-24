import 'package:get/get.dart';
import 'package:incentivesgit/presentation/Anniversaries/Anniversaries_1/controller/Anniversaries_1_controller.dart';

class Anniversaries1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Anniversaries1Controller());
  }
}
