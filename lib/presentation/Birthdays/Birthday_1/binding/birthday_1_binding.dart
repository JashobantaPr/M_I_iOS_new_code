import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/Birthdays/Birthday_1/controller/birthday_1_controller.dart';

class Birthday1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Birthday1Controller());
  }
}
