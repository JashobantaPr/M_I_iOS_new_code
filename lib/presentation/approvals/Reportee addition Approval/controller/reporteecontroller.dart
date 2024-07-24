import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/Approvals/Reportee%20addition%20Approval/module/rportee_module.dart';
import 'package:incentivesgit/presentation/Approvals/Reportee%20addition%20Approval/service/repotee_service.dart';

class ReporteeAdditionApprovalController extends GetxController {
  var myReporteeDetails = Rxn<UserResponse>();

  @override
  void onInit() {
    super.onInit();
    fetchReporteeViewDetails();
  }

  void fetchReporteeViewDetails() async {
    try {
      var product = await ReporteeDetailsService().getReporteeDetails();
      if (product != null) {
        myReporteeDetails.value = product;
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
