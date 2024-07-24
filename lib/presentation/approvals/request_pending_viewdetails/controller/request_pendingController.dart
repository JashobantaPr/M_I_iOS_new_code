import 'dart:ffi';

import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/Approvals/request_pending_viewdetails/model/request_pendingModel.dart';
import 'package:incentivesgit/presentation/Approvals/request_pending_viewdetails/service/requestPending_Service.dart';

class RequestPendingViewDetailsController extends GetxController {
  var myRequestPending = Rxn<ClaimDetails>();

  @override
  void onInit() {
    super.onInit();
    fetchProductDetails();
  }

  void fetchProductDetails() async {
    try {
      var product = await RequestPendingViewDetailsService().getRequestPending();
      if (product != null) {
        myRequestPending.value = product;
      } else {
        print('Failed to fetch product details');
      }
    } catch (e) {
      print('Exception during fetchProductDetails: $e');
      // Handle exception as per your app's logic
    }
  }
}
