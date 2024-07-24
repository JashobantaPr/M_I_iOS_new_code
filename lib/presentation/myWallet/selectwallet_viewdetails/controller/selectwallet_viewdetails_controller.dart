import 'package:incentivesgit/core/app_export.dart';

import '../../myWallet_landing/model/viewMyTransition.dart';
import '../model/selectwallet_viewdetails_model.dart';
import '../service/selectwallet_viewdetails_service.dart';

class SelectWalletViewDetailsController extends GetxController {
  final transactionId = Get.arguments;
  RxBool isLoading = false.obs;

  var details = ViewDetailsModel().obs;
  ViewAllTransition data = Get.arguments;

  void onInit() {
    fetchDetails();
    super.onInit();
  }

  void fetchDetails() async {
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
