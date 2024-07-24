import 'package:get/get.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_KpiSku_ClaimDetails/controller/typeC_KpiSku_ClaimDetails_controller.dart';

class TypeCKpiSkuClaimDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TypeCKpiSkuClaimDetailsController());
  }
}
