import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import '../../../../data/onboarding_services.dart';

class PasswordLoginController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  final isVisibele = true.obs;
  final mobileNo = Get.arguments;
  final email = Get.arguments;
  final isSelected = false.obs;
  RxString selectedNumber = RxString('');
  RxBool isButtonPressed = false.obs;
  RxString validateMsg = RxString('');
  var isLoading = false.obs;

  void toggleObscure() {
    isVisibele.value = !isVisibele.value;
  }

  void clearValidateMsg() {
    validateMsg.value = '';
  }

  String key = "df22bb7f8ef8f7b6d0ad6d58de758182";

  late String encryptedPassword;

  bool isFirstCharNumeric(String str) {
    if (str.isEmpty) return false;
    return int.tryParse(str[0]) != null;
  }

  String encryptPassword(String password, String key) {
    int cipherKeyLen = 16;
    String cipherName = "AES/CBC/PKCS5PADDING";

    if (key.length < cipherKeyLen) {
      key = key.padRight(cipherKeyLen, '0');
    } else if (key.length > cipherKeyLen) {
      key = key.substring(0, cipherKeyLen);
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

  // Future<void> onSubmit() async {
  //   String password = passwordController.text;
  //   if (password.isNotEmpty) {
  //     isLoading.value = true;

  //     String password = passwordController.text;

  //     String encryptedPassword = encryptPassword(password, key);
  //     final errorMessage =
  //         await OnBoardingServices().loginWithPass(encryptedPassword);
  //     print('errorMessage11${errorMessage!.passwordFailed}');
  //     print('errorMessage112${errorMessage.passwordFailedAttempts}');
  //     // if (errorMessage.passwordFailedAttempts.contains('8')) {
  //     //   validateMsg.value = errorMessage.passwordLockMessage;
  //     // } else {
  //     //   validateMsg.value = errorMessage.passwordLockMessage;
  //     // }
  //     validateMsg.value = errorMessage.passwordLockMessage;
  //     isLoading.value = false;
  //   } else {
  //     validateMsg.value = 'Password is required!';
  //   }
  // }

  Future<void> onSubmit() async {
    String password = passwordController.text;
    if (password.isNotEmpty) {
      isLoading.value = true;

      String encryptedPassword = encryptPassword(password, key);
      final errorMessage =
          await OnBoardingServices().loginWithPass(encryptedPassword);

      if (errorMessage != null) {
        print('errorMessage11${errorMessage.passwordFailed}');
        print('errorMessage112${errorMessage.passwordFailedAttempts}');
        validateMsg.value = errorMessage.passwordLockMessage;
      } else {
        validateMsg.value = '';
      }
      isLoading.value = false;
    } else {
      validateMsg.value = 'Password is required!';
    }
  }
}
