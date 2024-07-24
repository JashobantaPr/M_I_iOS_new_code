import 'package:flutter/material.dart';
import '../../../../core/app_export.dart';
import '../../../../data/onboarding_services.dart';

class ResendOtpController extends GetxController {
  RxString validateMsg = RxString('');

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
    String response = await OnBoardingServices().confirmOtp();
    if (response.isNotEmpty) {
      validateMsg.value = response;
      isLoading.value = false;
    }
    otpController.clear();
  }
}
