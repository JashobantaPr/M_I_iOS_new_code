import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_create_claim_screen/controller/create_claim_controller.dart';


class CreateClaimBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateClaimController());
  }
}
