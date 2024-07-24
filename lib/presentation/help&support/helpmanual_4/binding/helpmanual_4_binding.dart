import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:incentivesgit/presentation/help&support/helpmanual_4/controller/helpmanual_4_controller.dart';

class HelpandSupportHelpManual4Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HelpandSupportHelpManual4Controller);
  }
}
