import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/Approvals/claim_approval_1/module/productmodule.dart';
import 'package:incentivesgit/presentation/Approvals/claim_approval_1/service/productService.dart';

class ClaimApproval1Controller extends GetxController {
  var myProductDetails = Rxn<ClaimDetails>();

  @override
  void onInit() {
    super.onInit();
    fetchProductDetails();
  }

  void fetchProductDetails() async {
    try {
      var product = await ProductService().getProduct();
      if (product != null) {
        myProductDetails.value = product;
      } else {
        print('Failed to fetch product details');
      }
    } catch (e) {
      print('Exception during fetchProductDetails: $e');
      // Handle exception as per your app's logic
    }
  }
}
