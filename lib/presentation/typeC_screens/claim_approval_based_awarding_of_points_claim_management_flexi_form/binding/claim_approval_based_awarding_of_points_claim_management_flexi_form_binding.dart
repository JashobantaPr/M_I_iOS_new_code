import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeC_screens/claim_approval_based_awarding_of_points_claim_management_flexi_form/controller/claim_approval_based_awarding_of_points_claim_management_flexi_form_Controller.dart';

class ClaimApprovalBasedAwardingofPointsClaimManagementFlexiFormBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ClaimApprovalBasedAwardingofPointsClaimManagementFlexiFormController());
  }
  
}