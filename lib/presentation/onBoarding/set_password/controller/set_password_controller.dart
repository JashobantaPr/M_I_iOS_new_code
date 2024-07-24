import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/presentation/onBoarding/new_user_screen/controller/new_user_controller.dart';
import '../../../../core/utils/custom_snackbar.dart';
import '../../../../data/onboarding_services.dart';

class SetPasswordController extends GetxController {
  final CacheService _cacheService = CacheService();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  // TextEditingController newpasswordController = TextEditingController();
  RxString enteredText = RxString('');
  RxString encryptedText = RxString('');
  final isSelected = false.obs;
  final NewUserController controller = Get.find();
  RxBool isButtonPressed = false.obs;
  RxString validateMsg = RxString('');
  final issetpasswordVisible = true.obs;
  final isconfirmpasswordVisible = true.obs;

  void toggleObscure() {
    issetpasswordVisible.value = !issetpasswordVisible.value;
  }

  void toggleObscure1() {
    isconfirmpasswordVisible.value = !isconfirmpasswordVisible.value;
  }

  void toggleCheckbox() {
    isSelected.value = !isSelected.value;
  }

  String key = "df22bb7f8ef8f7b6d0ad6d58de758182";

  late String encryptedPassword;

  String encryptPassword(String password, String key) {
    int cipherKeyLen = 16;
    String cipherName = "AES/CBC/PKCS5PADDING";

    // Ensure the key is of the correct length
    if (key.length < cipherKeyLen) {
      key = key.padRight(cipherKeyLen, '0'); // Zero pad to length 16 bytes
    } else if (key.length > cipherKeyLen) {
      key = key.substring(0, cipherKeyLen); // Truncate to 16 bytes
    }

    String ivKey = "1234567891011121";
    final iv = encrypt.IV.fromUtf8(ivKey);

    final encrypter = encrypt.Encrypter(
        encrypt.AES(encrypt.Key.fromUtf8(key), mode: encrypt.AESMode.cbc));

    final encrypted = encrypter.encrypt(password, iv: iv);
    final encryptedBytes = encrypted.bytes;
    final encryptedBase64 = base64.encode(encryptedBytes);

    final ivBase64 = base64.encode(utf8.encode(ivKey));

    return '$encryptedBase64:$ivBase64';
  }

  // Future<void> onsubmit() async {
  //   encryptedPassword = encryptPassword(otpController.text, key);
  //   await OnBoardingServices().verifyOtpPass(encryptedPassword);
  // }

  Future<void> onsubmit() async {
    if (otpController.text.isEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty) {
      controller.validateMsg.value = 'OTP is required';
      return;
    }

    encryptedPassword = encryptPassword(otpController.text, key);
    String? errorMessage =
        await OnBoardingServices().verifyOtpPass(encryptedPassword);

    if (errorMessage != null) {
      controller.validateMsg.value = errorMessage;
    }
  }

  Future<void> onSett() async {
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    print('password$password');
    print('confirmPassword$confirmPassword');
    if (password != confirmPassword) {
      validateMsg.value = 'Both Passwords should be match';
      return;
    }

    encryptedPassword = encryptPassword(password, key);

    print('Encrypted Password: $encryptedPassword');
    if (encryptedPassword.isEmpty) {
      CustomSnackbar().openSnackbar('', 'Error encrypting password');
      return;
    }

    try {
      await OnBoardingServices().setPassword(encryptedPassword);
      passwordController.clear();
      confirmPasswordController.clear();
      otpController.clear();
    } catch (e) {
      print('Error setting password: $e');
    }
  }

  // Future<void> onSett() async {
  //   String password = passwordController.text.trim();
  //   String confirmPassword = confirmPasswordController.text.trim();

  //   // Check if passwords match
  //   if (password != confirmPassword) {
  //     controller.validateMsg.value = '';
  //     return;
  //   }

  //   // Encrypt the password
  //   encryptedPassword = encryptPassword(password, key);

  //   // Check if encryption was successful
  //   if (encryptedPassword.isEmpty) {
  //     CustomSnackbar().openSnackbar('', 'Error encrypting password');
  //     return;
  //   }

  //   try {
  //     // Set the encrypted password
  //     await OnBoardingServices().setPassword(encryptedPassword);

  //     // Clear input fields
  //     passwordController.clear();
  //     confirmPasswordController.clear();
  //     otpController.clear();
  //   } catch (e) {
  //     print('Error setting password: $e');
  //   }
  // }

  // Future<void> onSett() async {
  //   String password = passwordController.text.trim();

  //   // Encrypt the password
  //   encryptedPassword = encryptPassword(password, key);

  //   // Check if encryption was successful
  //   if (encryptedPassword.isEmpty) {
  //     CustomSnackbar().openSnackbar('', 'Error encrypting password');
  //     return;
  //   }

  //   try {
  //     // Set the encrypted password
  //     await OnBoardingServices().setPassword(encryptedPassword);

  //     // Clear input fields
  //     passwordController.clear();
  //     confirmPasswordController.clear();
  //     otpController.clear();
  //   } catch (e) {
  //     print('Error setting password: $e');
  //   }
  // }

  Future<void> resendOtp() async {
    print('called');
    await OnBoardingServices().newUser();
  }
}
