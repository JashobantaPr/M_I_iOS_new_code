import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_KpiSku_createclaim_management/controller/typeC_KpiSku_createclaim_management_controller.dart';


class TypeCKpiSkuCreateClaimBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TypeCKpiSkuCreateClaimController());
  }
}
