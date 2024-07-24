import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeC_screens/claim_approval_based_awarding_of_points_claim_management/controller/claimapprovalbasedawardingofpointsclaimmanagementController.dart';

class ClaimApprovalBasedAwardingofPointsClaimManagementBinding
    extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => ClaimApprovalBasedAwardingofPointsClaimManagementController());
  }
}
