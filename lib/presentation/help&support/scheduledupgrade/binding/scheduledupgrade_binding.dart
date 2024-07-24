import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:incentivesgit/presentation/help&support/scheduledupgrade/controller/scheduledupgrade_controller.dart';

class HelpandSupportScheduledUpgradeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HelpandSupportScheduledUpgradeController
    );
  }
}
