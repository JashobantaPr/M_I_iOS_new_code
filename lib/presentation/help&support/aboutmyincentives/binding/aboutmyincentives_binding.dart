import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:incentivesgit/presentation/help&support/aboutmyincentives/controller/aboutmyincentives_controller.dart';

class HelpandSupportAboutMyIncentivesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HelpandSupportAboutMyIncentivesController
    );
  }
}
