import 'package:flutter/widgets.dart';
import 'package:incentivesgit/core/app_export.dart';

class ProductController extends GetxController {
  TextEditingController adress1Controller = TextEditingController();
  TextEditingController adress2Controller = TextEditingController();
  TextEditingController adress11Controller = TextEditingController();
  TextEditingController adress12Controller = TextEditingController();
  TextEditingController pincode1Controller = TextEditingController();
  TextEditingController pincode12Controller = TextEditingController();
  var selectedProfileType = ''.obs;
  var isExpanded = false.obs;
  var isExpanded1 = false.obs;

  var count = 0.obs;
  void increment() {
    count++;
  }

  void decrement() {
    if (count > 0) {
      count--;
    }
  }

  void toggleExpand() {
    isExpanded.value = !isExpanded.value;
  }

  void toggleExpand1() {
    isExpanded1.value = !isExpanded1.value;
  }
}
