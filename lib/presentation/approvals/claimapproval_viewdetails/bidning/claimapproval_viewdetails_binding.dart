import 'package:get/get.dart';
import 'package:incentivesgit/presentation/Approvals/claimapproval_viewdetails/controller/claimapproval_viewdetails_controller.dart';

class ClaimApprovalViewDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClaimApprovalViewDetailsController());
  }
}
