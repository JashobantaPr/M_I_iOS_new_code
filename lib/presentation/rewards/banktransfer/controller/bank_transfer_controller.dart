import 'package:flutter/widgets.dart';
import 'package:incentivesgit/core/app_export.dart';

class BankTransferController extends GetxController {
  TextEditingController numberController = TextEditingController();
  var selectedProfileType = ''.obs;

  var count = 0.obs;
  void increment() {
    count++;
  }

  void decrement() {
    if (count > 0) {
      count--;
    }
  }
}
