import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:incentivesgit/presentation/help&support/helpmanual_1/controller/helpmanual_1_controller.dart';

class HelpandSupportHelpManual1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HelpandSupportHelpManual1Controller);
  }
}
