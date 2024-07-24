import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/Approvals/incenitves%20approval/module/incentive_approvals_module.dart';
import 'package:incentivesgit/presentation/Approvals/incenitves%20approval/service/incentive_approvals_service.dart';

class IncentiveApprovalController extends GetxController {
  var myIncentiveApprovals = Rxn<ApiResponse>();

  @override
  void onInit() {
    super.onInit();
    fetchIncentiveApprovals();
  }

  void fetchIncentiveApprovals() async {
    try {
      var product = await IncentiveApprovalsService().getIncentiveApprovals();
      if (product != null) {
        myIncentiveApprovals.value = product;
      } else {
        print('Failed to fetch product details');
      }
    } catch (e) {
      print('Exception during fetchProductDetails: $e');
    }
  }
}
