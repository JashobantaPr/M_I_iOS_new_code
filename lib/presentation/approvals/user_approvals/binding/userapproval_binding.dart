import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/Approvals/user_approvals/controller/userapproval_controller.dart';

class UserApprovalsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserApprovalController());
  }
}
