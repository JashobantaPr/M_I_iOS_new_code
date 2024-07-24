import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:incentivesgit/core/app_export.dart';

class Redeemcode1Controller extends GetxController {
  TextEditingController invoiceidcontroller = TextEditingController();
  TextEditingController referrelcodecontroller = TextEditingController();
  TextEditingController calendercontroller = TextEditingController();
  TextEditingController singlefilecontroller = TextEditingController();

  void chooseFile() async {
    // Open file picker
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      // Update text in TextField with the selected file's name
      String? fileName = result.files.single.name;
      singlefilecontroller.text = fileName;
    } else {
      // User canceled the picker
      print('User canceled the file picking.');
    }
  }

  void chooseFileCamera() async {
    // Open file picker
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // Update text in TextField with the selected file's name
      String? fileName = pickedFile.name;
      singlefilecontroller.text = fileName;
    } else {
      // User canceled the picker
      print('User canceled the file picking.');
    }
  }
}
