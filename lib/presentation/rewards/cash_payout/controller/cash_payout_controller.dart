import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CashPayoutController extends GetxController {
  TextEditingController numberController = TextEditingController();
  TextEditingController mobilenumberController = TextEditingController();
  var selectedProfileType = ''.obs;
  final RxBool isValid = false.obs;
  var showError = false.obs;

  @override
  void onClose() {
    numberController.dispose();
    mobilenumberController.dispose();
    super.onClose();
  }

  void updateProfileType(String value) {
    selectedProfileType.value = value;
    showError.value = value == 'Bank Account (IN)';
  }
}
