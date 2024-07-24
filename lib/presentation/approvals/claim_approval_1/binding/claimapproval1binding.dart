import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/Approvals/claim_approval_1/controller/claimapproval1controller.dart';

class ClaimApproval1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClaimApproval1Controller());
  }
}
