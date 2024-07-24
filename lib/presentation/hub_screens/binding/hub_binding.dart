import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/hub_screens/controller/hub_controller.dart';


class HubBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HubController());
  }
}
