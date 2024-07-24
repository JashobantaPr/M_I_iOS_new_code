import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/Approvals/Approval_MyApproval/module/myapprovalmodule.dart';
import 'package:incentivesgit/presentation/Approvals/Approval_MyApproval/service/myapprovalservice.dart';

class MyApprovalController extends GetxController {
  var budgetRequests = <BudgetRequest>[].obs;

  @override
  void onInit() {
    fetchApprovals();
    super.onInit();
  }

  void fetchApprovals() async {
    try {
      var response = await MyapprovalService().fetchMyApproval();
      if (response.status) {
        budgetRequests.assignAll(response.list);
      } else {
        print('Failed to fetch approvals: Status is false');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }
}
