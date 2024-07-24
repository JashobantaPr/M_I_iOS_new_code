import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/Approvals/user_approvals/module/userapproval_module.dart';
import 'package:incentivesgit/presentation/Approvals/user_approvals/service/userapproval_service.dart';

class UserApprovalController extends GetxController {
  var myUserApproval = Rxn<UserResponse>();

  @override
  void onInit() {
    super.onInit();
    fetchUserApproval();
  }

  void fetchUserApproval() async {
    try {
      var product = await UserApprovalsService().getUserApprovals();
      if (product != null) {
        myUserApproval.value = product;
        // Update any UI or perform actions based on fetched data
      } else {
        // Handle case where product is null
        print('Failed to fetch product details');
      }
    } catch (e) {
      print('Exception during fetchProductDetails: $e');
      // Handle exception as per your app's logic
    }
  }
}
