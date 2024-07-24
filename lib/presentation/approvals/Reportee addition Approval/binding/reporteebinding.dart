import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/Approvals/Reportee%20addition%20Approval/controller/reporteecontroller.dart';

class ReporteeAdditionApprovalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReporteeAdditionApprovalController());
  }
}
