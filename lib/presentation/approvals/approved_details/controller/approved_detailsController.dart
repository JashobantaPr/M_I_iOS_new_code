import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/Approvals/approved_details/module/requestApproved_module.dart';
import 'package:incentivesgit/presentation/Approvals/approved_details/service/requestapproved_service.dart';

class ApprovedViewDetailsController extends GetxController{
  var myRequestApproved = Rxn<UserResponse>();

  @override
  void onInit() {
    super.onInit();
    fetchRequestApproved();
  }

  void fetchRequestApproved() async {
    try {
      var product = await RequestApprovedService().getRequestApproved();
      if (product != null) {
        myRequestApproved.value = product;
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