import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/Approvals/Approval_MyRequest/module/myrequestModule.dart';
import 'package:incentivesgit/presentation/Approvals/Approval_MyRequest/service/myrequestService.dart';

class MyRequestController extends GetxController {
  var budgetRequests = <Request>[].obs;

  @override
  void onInit() {
    fetchRequest();
    super.onInit();
  }

  void fetchRequest() async {
    try {
      var response = await MyrequestService().fetchMyRequest();
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