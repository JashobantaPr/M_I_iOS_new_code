import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/forgetPassword/controller/forget_controller.dart';

class ForgetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => forgetController());
  }
}
