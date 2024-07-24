import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/Approvals/Program%20Approval/controller/programApproval_controller.dart';

class ProgramApprovalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProgramApprovalController());
  }
}
