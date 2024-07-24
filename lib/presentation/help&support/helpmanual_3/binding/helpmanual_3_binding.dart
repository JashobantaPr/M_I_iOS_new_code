import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:incentivesgit/presentation/help&support/helpmanual_3/controller/helpmanual_3_controller.dart';

class HelpandSupportHelpManual3Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HelpandSupportHelpManual3Controller);
  }
}
