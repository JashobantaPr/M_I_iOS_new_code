import 'package:flutter/material.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import '../../../../core/app_export.dart';
import '../../../../data/onboarding_services.dart';

class ResendOtpVerifyController extends GetxController {
  RxString validateMsg = RxString('');
  final argumentt = Get.arguments;
  var isLoading = false.obs;

  void clearValidateMsg() {
    validateMsg.value = ''; // Clear the error message
  }

  void resendOTP() async {
    await OnBoardingServices().loginWithOtp();
  }

  TextEditingController otpController = TextEditingController();
  // RxString enteredText = RxString('');
  // RxString encryptedText = RxString('');

  // Rx<ResendotpModel> splashModelObj = ResendotpModel().obs;

  Future<void> onsubmit() async {
    isLoading.value = true;
    String? response = await OnBoardingServices().verifyOtp();

    if (response == null) {
      // OTP is valid, navigate to bottom navigation screen
      // Get.toNamed(AppRoutes.bottomtab);
      onTapVerify();
    } else {
      // OTP is invalid, show error message
      validateMsg.value = response;
    }

    isLoading.value = false;
  }

  void onTapVerify() async {
    isLoading.value = true;
    String? response = await OnBoardingServices().verifyMaill();

    if (response == null) {
      // Get.toNamed(AppRoutes.bottomtab);

      ontapVerify();
    } else {
      // OTP is invalid, show error message
      validateMsg.value = response;
    }

    isLoading.value = false;
    // otpController.clear();
  }

  void ontapVerify() async {
    isLoading.value = true;
    String? response = await OnBoardingServices().verifyMailSuccess();

    if (response != null && response.contains('successfully')) {
      // Navigate to bottom tab screen
      Get.toNamed(AppRoutes.bottomtab);
    } else {
      // OTP is invalid, show error message
      validateMsg.value = response ?? 'Verification failed';
    }

    isLoading.value = false;
    otpController.clear();
  }
}
