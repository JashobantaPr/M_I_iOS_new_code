import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/Approvals/claimapproval_viewdetails/module/productDetailsmodule.dart';
import 'package:incentivesgit/presentation/Approvals/claimapproval_viewdetails/service/productviewdetailsService.dart';

class ClaimApprovalViewDetailsController extends GetxController {
  var myProductDetails = Rxn<ApiResponse>();

  @override
  void onInit() {
    super.onInit();
    fetchProductViewDetails();
  }

  void fetchProductViewDetails() async {
    try {
      var product = await ProductDetailsService().getProductDetails();
      if (product != null) {
        myProductDetails.value = product;
        print(
            'details${myProductDetails.value?.viewReferral?.getProgram?.name}');
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
