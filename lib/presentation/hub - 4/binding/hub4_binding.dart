import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/hub%20-%204/controller/hub4_controller.dart';


class Hub4Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Hub4Controller());
  }
}
