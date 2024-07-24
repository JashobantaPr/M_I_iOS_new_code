import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:incentivesgit/core/app_export.dart';

class CreateClaimFlexiFormController extends GetxController {
  TextEditingController otpController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();

  var isObscure = true.obs;

  var selectedSKUs = <String>[].obs;

  final List<String> displayTextList = [
    'Windows 1.05',
    'Holiday Treats, Chocolate bar Medium, Sugar-free Holiday Treats, Chocolate bar, Medium, Sugar-free',
    'Headphones, Golden, Bluetooth wireless',
    'Holiday Treats, Chocolate bar, Small, Sugar-free',
    'Home Decor, Scented Candles, Pack of 4',
  ];

  void toggleSelectedSKU(String sku) {
    if (selectedSKUs.contains(sku)) {
      selectedSKUs.remove(sku);
    } else {
      selectedSKUs.add(sku);
    }
  }

  void chooseFile() async {
    // Open file picker
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      // Update text in TextField with the selected file's name
      String? fileName = result.files.single.name;
      otpController.text = fileName!;
    } else {
      // User canceled the picker
      print('User canceled the file picking.');
    }
  }
}
