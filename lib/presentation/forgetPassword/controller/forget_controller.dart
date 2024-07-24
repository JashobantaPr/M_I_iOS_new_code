import 'dart:convert';
import 'dart:math';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/onBoarding/login_screen/controller/login_controller.dart';
import 'package:incentivesgit/presentation/onBoarding/login_screen/models/login_model.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:incentivesgit/theme/theme_helper.dart';
import '../../../core/utils/cache_service.dart';
import '../../../core/utils/custom_snackbar.dart';

class forgetController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController captchaController = TextEditingController();
  RxString captcha = RxString('');
  final LoginController controllers = Get.find();
  RxList<cuntryPickerModel> getCountryData = <cuntryPickerModel>[].obs;
  RxString selectedNumber = RxString('');
  RxString selectedCountryId = RxString('');
  RxString selectedCountryName = RxString('');
  final CacheService _cacheService = CacheService();
  String? receivedMobileNo;
  final mobileNo = Get.arguments;

  RxBool isButtonPressed = false.obs;
  RxString validateMsg = RxString('');

  void clearValidateMsg() {
    validateMsg.value = ''; // Clear the error message
    isButtonPressed.value = false;
  }

  @override
  void onInit() {
    receivedMobileNo = Get.arguments;
    super.onInit();
    generateCaptcha();
    // newuservalidate();
  }

  void generateCaptcha() {
    const letters =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    const length = 6;
    final random = Random();
    captcha.value = String.fromCharCodes(List.generate(
        length, (index) => letters.codeUnitAt(random.nextInt(letters.length))));

    // Print a message to verify that the error message is cleared
    print('Error message cleared: ${validateMsg.value}');

    update();
  }

  Future<void> newuservalidate() async {
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=lt7h79bo99eu279j7ki7bku7fifr0apc'
    };

    var request = http.Request(
      'POST',
      Uri.parse('${Url.baseUrl}/login/user_validate'),
    );

    // Determine if input is a phone number or an email
    String input = phoneNumberController.text;
    bool isPhoneNumber = RegExp(r'^\d+$')
        .hasMatch(input); // Simple regex to check if input is digits only

    if (isPhoneNumber) {
      request.bodyFields = {'phone': phoneNumberController.text};
    } else {
      request.bodyFields = {'email': phoneNumberController.text};
    }

    request.headers.addAll(headers);
    print('erewrer${request.bodyFields}');
    http.StreamedResponse response = await request.send();
    print('bbbbbb${response}');
    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      print('cccccc${responseBody}');
      Map<String, dynamic> jsonResponse = json.decode(responseBody);
      print('aaaaaaa${jsonResponse}');
      if (jsonResponse['mssg_type'] == "success") {
        String? token = jsonResponse["token"];

        if (token != null) {
          await _cacheService.setCache(OTP_TOKEN, token);
        }

        var userdata = jsonResponse["user_validate"]["userdata"];
        if (userdata.isNotEmpty) {
          final firstUser = userdata[0];
          String? userId = firstUser["user_id_pk"];

          if (userId != null) {
            await _cacheService.setCache(USERID, userId);
          }
        }

        // Set success message
        //  validateMsg.value = jsonResponse['mssg'];
        // Navigate to the reset password screen
        Get.snackbar(
          'Success',
          jsonResponse['mssg'],
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: appTheme.white,
          colorText: appTheme.black600,
        );
        Get.toNamed(AppRoutes.resetpasword);
      } else {
        // Set error message
        validateMsg.value = jsonResponse['mssg'];
      }
    } else {
      print(response.reasonPhrase);
    }
  }

  void handleSelectedCountry(String countryId, String cuntryName) {
    selectedCountryId.value = countryId;
    selectedCountryName.value = cuntryName;
  }

  bool isFirstCharNumeric(String str) {
    if (str.isEmpty) return false;
    return int.tryParse(str[0]) != null;
  }
}
