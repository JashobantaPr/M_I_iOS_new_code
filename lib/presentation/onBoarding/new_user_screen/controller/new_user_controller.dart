import 'dart:math';

import 'package:country_pickers/country.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/app_export.dart';
import '../../../../core/utils/custom_snackbar.dart';
import '../../../../data/onboarding_services.dart';
import '../../login_screen/models/login_model.dart';
import '../models/new_user_model.dart';

/// A controller class for the Iphone13MiniTenScreen.
///
/// This class manages the state of the Iphone13MiniTenScreen, including the
/// current iphone13MiniTenModelObj
class NewUserController extends GetxController {
  Rx<NewUserhModel> splashModelObj = NewUserhModel().obs;
  TextEditingController phoneNumberController = TextEditingController();
  RxList<cuntryPickerModel> getCountryData = <cuntryPickerModel>[].obs;
  RxString selectedCountryId = RxString('');
  RxString selectedCountryName = RxString('');
  RxString captcha = RxString('');
  RxBool isButtonPressed = false.obs;
  RxInt selectedIndex = (-1).obs;

  TextEditingController captchaController = TextEditingController();

  RxBool isMobileRegistered = true.obs;
  final isRadioSwitched = false.obs;
  RxBool isEmailErrorVisible = false.obs;
  RxBool isMobileErrorVisible = false.obs;
  RxString validateMsg = RxString('');

  Rx<Country> selectedCountry =
      CountryPickerUtils.getCountryByPhoneCode('91').obs;
  String countryCode = '+91';
  void updateSelectedCountry(Country country) {
    selectedCountry.value = country;
  }

  void clearValidateMsg() {
    validateMsg.value = '';
    isButtonPressed.value = false;
  }

  @override
  void onInit() {
    super.onInit();
    getCountrysData();
    generateCaptcha();
  }

  void handleSelectedCountry(String countryId, String cuntryName, int index) {
    selectedCountryId.value = countryId;
    selectedCountryName.value = cuntryName;
    selectedIndex.value = index;
    Get.back();
  }

  Future<void> getCountrysData() async {
    final response = await OnBoardingServices().getCountryDetails();
    if (response != null && response.isNotEmpty) {
      print('response: $response');
      getCountryData.value = response
          .map((country) => cuntryPickerModel.fromJson(country))
          .toList();
    }
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

  // Future<void> newUserLogin() async {
  //   if (phoneNumberController.text.isEmpty) {
  //     return;
  //   }
  //   Map<String, dynamic> loginResult = await OnBoardingServices().newUser();

  //   if (loginResult['success'] == true) {
  //     // Login successful, display success message
  //     print('Login successful');
  //   } else {
  //     // Login failed, set the error message to validateMsg
  //     validateMsg.value = loginResult['error'];
  //     print('Login failed');
  //   }
  //   phoneNumberController.clear();
  // }

  // Future<void> newUserLogin() async {
  //   await OnBoardingServices().newUser();

  //   phoneNumberController.clear();
  // }

  Future<void> newUserLogin() async {
    Map<String, dynamic> response =
        (await OnBoardingServices().newUser()) as Map<String, dynamic>;

    if (response['success']) {
      // newUser request successful
      //  validateMsg.value = response['message']; // Display success message
      // Handle success message if needed
    } else {
      // newUser request failed, set error message
      validateMsg.value =
          response['message'] ?? 'New user creation failed. Please try again.';
    }
  }

  bool isFirstCharNumeric(String str) {
    if (str.isEmpty) return false;
    return int.tryParse(str[0]) != null;
  }

  bool isValidEmail(String email) {
    // Use regex pattern to check email format
    final emailRegex = RegExp(
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'); // Simple email pattern, modify as needed
    return emailRegex.hasMatch(email);
  }

  bool isNumeric(String input) {
    if (input == null) {
      return false;
    }
    return double.tryParse(input) != null;
  }
}
