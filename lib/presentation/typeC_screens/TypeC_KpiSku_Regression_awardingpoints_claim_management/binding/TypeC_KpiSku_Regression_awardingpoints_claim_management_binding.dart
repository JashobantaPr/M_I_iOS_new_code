import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeC_screens/TypeC_KpiSku_Regression_awardingpoints_claim_management/controller/TypeC_KpiSku_Regression_awardingpoints_claim_management_controller.dart';

class TypeCKpiSkuAwardingPointsClaimManagementBinding
    extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () =>TypeCKpiSkuAwardingPointsClaimManagementController());
  }
}
