import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/Approvals/Approval_MyApproval/controller/myapprovalcontroller.dart';
import 'package:incentivesgit/presentation/Approvals/Approval_MyRequest/controller/myrequestController.dart';
import 'package:incentivesgit/presentation/Approvals/approvalTabBar/controller/approvalTabBar_controller.dart';

class ApprovalTabBarBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApprovaltabBarController());
    Get.lazyPut(() => MyApprovalController());
  Get.lazyPut(() => MyRequestController());
  }
}
