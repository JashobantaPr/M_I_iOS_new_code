import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/Approvals/Approval_MyApproval/controller/myapprovalcontroller.dart';

class MyApprovalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyApprovalController());
  }
}
