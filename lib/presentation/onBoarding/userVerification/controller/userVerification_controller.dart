import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/data/onboarding_services.dart';
import 'package:incentivesgit/presentation/onBoarding/login_screen/models/login_model.dart';

class UserVerificationController extends GetxController {
  TextEditingController phoneNumberController = TextEditingController();
  RxList<cuntryPickerModel> getCountryData = <cuntryPickerModel>[].obs;

  final isLoading = false.obs;
  final isSelected = false.obs;
  RxString selectedNumber = RxString('');
  RxString selectedCountryId = RxString('');
  RxString selectedCountryName = RxString('');
  RxString validateMsg = RxString('');

  int selectedId = 0;
  RxBool isButtonPressed = false.obs;
  final arguments = Get.arguments ?? "";

  @override
  void onInit() {
    super.onInit();
    print('userVerifyuserVerify$arguments');
    getCountrysData();
    // onSubmitlogin();
  }

  setLoading(bool value) {
    isLoading.value = value;
  }

  void handleSelectedCountry(String countryId, String cuntryName) {
    selectedCountryId.value = countryId;
    selectedCountryName.value = cuntryName;
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
    await OnBoardingServices().login();
  }

  bool isValidEmail(String email) {
    // Use regex pattern to check email format
    final emailRegex = RegExp(
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'); // Simple email pattern, modify as needed
    return emailRegex.hasMatch(email);
  }

  void onVerified(String arg) async {
    if (arg != null) {
      var dada = await OnBoardingServices().verifyMail(arg);

      if (dada['success'] == true) {
        // Login successful, display success message
        print('Login successful');
      } else {
        // Login failed, set the error message to validateMsg
        validateMsg.value = dada['error'];
        print('Login failed: ${dada['error']}');
      }
    } else {
      print('Argument is null.');
    }
  }
}
