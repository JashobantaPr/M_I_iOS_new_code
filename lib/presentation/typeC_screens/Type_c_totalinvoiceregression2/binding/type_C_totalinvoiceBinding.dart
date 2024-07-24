import 'package:get/get.dart';
import 'package:incentivesgit/presentation/typeC_screens/Type_c_totalinvoiceregression2/controller/type_C_totalinvoiceController.dart';
import 'package:incentivesgit/presentation/typeC_screens/claim_approval_based_awarding_of_points_claim_management/controller/claimapprovalbasedawardingofpointsclaimmanagementController.dart';

class TypeCTotalinvoiceRegressionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TypeCTotalinvoiceRegression());
    Get.lazyPut(
        () => ClaimApprovalBasedAwardingofPointsClaimManagementController());
  }
}
