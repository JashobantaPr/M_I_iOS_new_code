import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/routes/app_routes.dart';

import '../../viewDetails/controller/viewdetails_controller.dart';

class OrderOtpController extends GetxController {
  final myorderViewController = Get.find<MyorderViewDetailsController>();

  verifyOtp(String? orderOtp) async {
    String otp = myorderViewController.orderOtpCode.value.toString();

    if (orderOtp?.length != 6) {
      Get.snackbar("error", "Please entered 6 Digit otp");
    } else if (otp == orderOtp) { 
      Get.offNamed(AppRoutes.voucharDetails);
      Get.snackbar("Sucess", "Otp Verified Sucessfully");
    } else {
      Get.snackbar("Error", "Please Enter Correct Otp");
    }
  }

  resendOtp() async {
    await myorderViewController.orderOtp();
  }
}
