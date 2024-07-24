import 'package:incentivesgit/core/app_export.dart';

import 'package:flutter/material.dart';

import '../../../../core/utils/custom_snackbar.dart';
import '../../../../data/onboarding_services.dart';
import '../../../../routes/app_routes.dart';
import '../models/login_model.dart';

class LoginController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();
  RxList<cuntryPickerModel> getCountryData = <cuntryPickerModel>[].obs;

  final isLoading = false.obs;
  final isSelected = false.obs;
  RxString selectedNumber = RxString('');
  RxString selectedCountryId = RxString('');
  RxString selectedCountryName = RxString('');
  RxString validateMsg = RxString('');
  RxInt selectedIndex = (-1).obs;

  int selectedId = 0;
  RxBool isButtonPressed = false.obs; // Define isButtonPressed here
  //RxBool isButtonTapped = false.obs;
  void clearValidateMsg() {
    validateMsg.value = ''; // Clear the error message
    isButtonPressed.value = false;
  }

  @override
  void onInit() {
    super.onInit();

    getCountrysData();
  }

  setLoading(bool value) {
    isLoading.value = value;
  }

  void handleSelectedCountry(String countryId, String cuntryName, int index) {
    selectedCountryId.value = countryId;
    selectedCountryName.value = cuntryName;
    selectedIndex.value = index;
    Get.back();
  }

  bool isFirstCharNumeric(String str) {
    if (str.isEmpty) return false;
    return int.tryParse(str[0]) != null;
  }

  Future<void> getCountrysData() async {
    setLoading(true);
    final response = await OnBoardingServices().getCountryDetails();
    if (response != null && response.isNotEmpty) {
      print('response: $response');
      getCountryData.value = response
          .map((country) => cuntryPickerModel.fromJson(country))
          .toList();
    }
    setLoading(false);
  }

  void onSubmitlogin() async {
    Map<String, dynamic> loginResult = await OnBoardingServices().login();

    if (loginResult['success'] == true) {
      // Login successful, display success message
      print('Login successful');
    } else {
      // Login failed, set the error message to validateMsg
      validateMsg.value = loginResult['error'];
      print('Login failed');
    }
  }

  // void onSubmitlogin() async {
  //   await OnBoardingServices().login();

  //   phoneNumberController.clear();
  // }

  // void onSubmitlogin() async {
  //   String? errorMessage = await OnBoardingServices().login();

  //   if (errorMessage == null) {
  //     // Login successful
  //     validateMsg.value = '';
  //     Get.toNamed(AppRoutes.loginPassword,
  //         arguments: phoneNumberController.text);
  //   } else {
  //     // Login failed, set error message from backend
  //     validateMsg.value = errorMessage;
  //   }
  // }

  bool isValidEmail(String email) {
    // Use regex pattern to check email format
    final emailRegex = RegExp(
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'); // Simple email pattern, modify as needed
    return emailRegex.hasMatch(email);
  }
}
