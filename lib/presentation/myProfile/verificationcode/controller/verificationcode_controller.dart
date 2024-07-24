import 'package:flutter/material.dart';
import 'package:incentivesgit/core/app_export.dart';

import '../service/verificationMobileService.dart';

class VerificationCodeController extends GetxController {
  TextEditingController otpController = TextEditingController();
  final arg = Get.arguments;
  void onInit() {
    super.onInit();
  }

  Future<void> otpCheck() async {
    if (otpController.text.isNotEmpty && otpController.text.length == 6) {
      await ProfileService().updateMobileNo();
    }
  }
}
