import 'package:flutter/material.dart';
import 'package:incentivesgit/core/app_export.dart';

class ReferAFriendController extends GetxController {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  final textFieldController = TextEditingController();
   var selectedItems = <String>[].obs;

  
    @override
  void onClose() {
    textFieldController.dispose();
    super.onClose();
  }
}
