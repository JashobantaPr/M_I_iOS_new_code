import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/presentation/myProfile/verificationcode/controller/verificationcode_controller.dart';

import '../../primary_profile/controller/primary_profile_controller.dart';

class ProfileService {
  final CacheService _cacheService = CacheService();

  Future<void> updateMobileNo() async {
    final otp = await _cacheService.getCache(OTP_SESSION);
    final data = Get.find<VerificationCodeController>();
    final enteredOtp = data.otpController.text.trim();
    final storedOtp = otp.toString().trim();

    print('otpotp$storedOtp');
    print('enteredotp$enteredOtp');

    if (enteredOtp == storedOtp) {
      Get.snackbar(
        'Success',
        'OTP is correct. Proceed to the next step.',
        snackPosition: SnackPosition.TOP,
      );
      updatePhone();
    } else {
      Get.snackbar(
        'Error',
        'Invalid OTP. Please try again.',
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  Future<void> updatePhone() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    final data = Get.find<VerificationCodeController>();
    final userData = Get.find<PrimaryProfileController>();

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=k935077rulipf5r8ocanfislfjdps85r'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis//home/update_phone'));
    request.bodyFields = {
      'user_id': userId!,
      'c_id': companyId!,
      'number': data.arg
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      var jsonResponse = jsonDecode(responseBody);
      userData.fetchPrimeryDetails();
      Get.back();
      Get.back();
      Get.back();
      if (jsonResponse['status']) {
        Get.snackbar(
          'Success',
          jsonResponse['msg'],
          snackPosition: SnackPosition.TOP,
        );
      } else {
        Get.snackbar(
          'Error',
          jsonResponse['msg'],
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      Get.snackbar(
        'Error',
        'Failed to update phone number. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
      print(response.reasonPhrase);
    }
  }
}
