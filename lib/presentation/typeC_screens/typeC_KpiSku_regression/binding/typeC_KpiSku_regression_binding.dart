import 'package:get/get.dart';
import 'package:incentivesgit/presentation/typeC_screens/TypeC_KpiSku_Regression_awardingpoints_claim_management/controller/TypeC_KpiSku_Regression_awardingpoints_claim_management_controller.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_KpiSku_regression/controller/typeC_KpiSku_regression_controller.dart';

class TypeCKpiSkuRegressionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TypeCKpiSkuRegressionController());
    Get.lazyPut(() => TypeCKpiSkuAwardingPointsClaimManagementController());
  }
}
