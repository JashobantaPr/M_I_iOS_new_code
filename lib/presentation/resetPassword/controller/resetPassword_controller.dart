import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:incentivesgit/core/utils/custom_snackbar.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/onBoarding/login_screen/controller/login_controller.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

import '../../../core/app_export.dart';
import '../../../core/utils/cache_service.dart';
import '../../forgetPassword/controller/forget_controller.dart';

class ResetPasswordController extends GetxController {
  final CacheService _cacheService = CacheService();

  TextEditingController otpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();
  final forgetController controller = Get.find();
  RxBool isButtonPressed = false.obs;

  var isObscure = true.obs;
  final isVisibele = true.obs;

  String key = "df22bb7f8ef8f7b6d0ad6d58de758182";

  late String encryptedPassword;
  late String encryptedOtp;
  RxString validateMsg = RxString('');

  void clearValidateMsg() {
    validateMsg.value = ''; // Clear the error message
    isButtonPressed.value = false;
  }

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

  Future<void> otpVerify() async {
    // Check if OTP is empty or less than 6 digits
    if (otpController.text.isEmpty && passwordController.text.isEmpty) {
      // Display error message
      validateMsg.value = 'Password And OTP is required';
      return;
    }

    if (otpController.text.isEmpty && newpasswordController.text.isEmpty) {
      // Display error message
      validateMsg.value = 'Password And OTP is required';
      return;
    }

    if (otpController.text.isEmpty) {
      // Display error message
      validateMsg.value = 'OTP is required';
      return;
    }

    if (otpController.text.length < 6) {
      // Display error message
      validateMsg.value = 'Incorrect OTP';
      return;
    }

    // Check if both password fields are empty
    if (passwordController.text.isEmpty && newpasswordController.text.isEmpty) {
      // Display error message for missing passwords
      validateMsg.value = 'Password and Confirm Password are required';
      return;
    }

    if (passwordController.text.isEmpty) {
      // Display error message for missing passwords
      validateMsg.value = 'Password are required';
      return;
    }

    if (newpasswordController.text.isEmpty) {
      // Display error message for missing passwords
      validateMsg.value = ' Confirm Password are required';
      return;
    }

    // Check if at least one of the password fields is empty
    if (passwordController.text.isEmpty || newpasswordController.text.isEmpty) {
      // Display error message for missing password or OTP
      validateMsg.value = '';
      return;
    }

    // Check if passwords match
    if (passwordController.text != newpasswordController.text) {
      // Display error message for mismatched passwords
      validateMsg.value = 'Both passwords should be match';
      return;
    }

    final otp = await _cacheService.getCache(OTP_TOKEN);
    encryptedOtp = encryptPassword(otpController.text, key);

    // Verify if entered OTP matches the stored OTP
    if (encryptedOtp == otp) {
      // OTP verification successful, proceed with password reset
      resetPassword();
    } else {
      // Display error message for incorrect OTP
      validateMsg.value = 'Invalid OTP';
    }
  }

  // Future<void> otpVerify() async {
  //   // Check if OTP is empty or less than 6 digits
  //   if (otpController.text.isEmpty || otpController.text.length < 6) {
  //     // Display error message
  //     validateMsg.value = 'OTP invalid';
  //     return;
  //   }

  //   final otp = await _cacheService.getCache(OTP_TOKEN);
  //   encryptedOtp = encryptPassword(otpController.text, key);

  //   // Verify if entered OTP matches the stored OTP
  //   if (encryptedOtp == otp) {
  //     // OTP verification successful, proceed with password reset
  //     resetPassword();
  //   } else {
  //     // Display error message for incorrect OTP
  //     validateMsg.value = 'OTP invalid';
  //   }
  // }

  Future<void> resetPassword() async {
    final userId = await _cacheService.getCache(USERID);

    if (userId == null) {
      print('Error: User ID is null');
      // Handle the error, perhaps by displaying a message to the user
      return;
    }

    encryptedPassword = encryptPassword(passwordController.text, key);

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=lt7h79bo99eu279j7ki7bku7fifr0apc'
    };

    var request = http.Request(
      'POST',
      Uri.parse('${Url.baseUrl}/login/user_pass_update'),
    );
    request.bodyFields = {
      'password': encryptedPassword,
      'uid': userId ?? '', // Provide a default value if userId is null
    };
    request.headers.addAll(headers);
    print('sadsasf${request.bodyFields}');

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        print('asasas${responseBody}');
        Map<String, dynamic> jsonResponse = json.decode(responseBody);

        if (jsonResponse['status'] == true) {
          String message =
              jsonResponse['mssg'] ?? ''; // Provide a default value if null
          Get.snackbar(
            'Success',
            message,
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 3),
            backgroundColor: appTheme.white,
            colorText: appTheme.black600,
          );
          Get.toNamed(AppRoutes.loginsuccesfully);
        } else {
          if (jsonResponse.containsKey('error')) {
            validateMsg.value = jsonResponse['error'].toString();
          } else {
            print('Error: No error message provided in response');
            // Handle this case as per your requirement
          }
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
        print(response.reasonPhrase);
        validateMsg.value = 'An error occurred';
      }
    } catch (e) {
      print('Error occurred during reset password request: $e');
      // You can add custom handling here if needed, but no generic error message is set
    }
  }

  Future<void> resendOtp() async {
    controller.newuservalidate();
  }

  void toggleObscure() {
    print('print11$isObscure');
    isObscure.value = !isObscure.value;
  }

  void togglevisible() {
    isVisibele.value = !isVisibele.value;
  }
}
