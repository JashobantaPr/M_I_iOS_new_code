import 'dart:math';

import 'package:incentivesgit/core/app_export.dart';

import 'package:flutter/material.dart';

import '../../../../core/utils/custom_snackbar.dart';
import '../../../../data/onboarding_services.dart';
import '../../login_screen/controller/login_controller.dart';
import '../../new_user_screen/controller/new_user_controller.dart';

class LoginOtpController extends GetxController {
  TextEditingController captchaController = TextEditingController();
  RxBool isButtonPressed = false.obs;
  RxBool isButtonPressed1 = false.obs;
  var isLoading = false.obs;
  final countryData = Get.find<LoginController>();

  RxString selectedNumber = RxString('');
  RxString selectedCountryId = RxString('');
  RxString selectedCountryName = RxString('');
  RxString captcha = RxString('');

  final captchCode = Get.find<NewUserController>();

  String? receivedMobileNo;

  @override
  void onInit() {
    receivedMobileNo = Get.arguments;
    super.onInit();
    countryData.getCountrysData();
    generateCaptcha();
  }

  bool isFirstCharNumeric(String str) {
    if (str.isEmpty) return false;
    return int.tryParse(str[0]) != null;
  }

  void generateCaptcha() {
    const letters =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    const length = 6;
    final random = Random();
    captcha.value = String.fromCharCodes(List.generate(
        length, (index) => letters.codeUnitAt(random.nextInt(letters.length))));
    update();
  }

  Future<void> newUserLogin() async {
    isLoading.value = true;
    await OnBoardingServices().loginWithOtp();
    isLoading.value = false;
  }
}
