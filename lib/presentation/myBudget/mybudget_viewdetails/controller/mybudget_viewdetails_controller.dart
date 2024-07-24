import 'package:get/get.dart';

import '../../mybudget_balance/model/view_all_trancition.dart';
import '../model/mybudget_viewdetails_model.dart';
import '../service/mybudget_viewdetails_service.dart';

class MyBudgetViewDetailsController extends GetxController {
  RxBool isLoading = false.obs;

  RxList<ViewDetailsModel> details = <ViewDetailsModel>[].obs;

  ViewAllTransition data = Get.arguments;

  void onInit() {
    super.onInit();
    fetchDetails();
  }

  Future<void> fetchDetails() async {
    isLoading.value = true;
    try {
      var fetchedPoints = await Transactiondetail().transactiondata();
      print('fetchedPoints$fetchedPoints');
      if (fetchedPoints != null) {
        details.value = fetchedPoints;
      }
    } catch (e) {
      print("Failed to fetch points: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
