// import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:incentivesgit/core/app_export.dart';

class TypeCKpiSkuCreateClaimController extends GetxController {
    TextEditingController otpController = TextEditingController();

  // Observable variables for checkboxes
  var checkbox1 = false.obs;
  var checkbox2 = false.obs;
  var checkbox3 = false.obs;
  var checkbox4 = false.obs;

  // Observable variable for selected date
  var selectedDate = DateTime.now().obs;

  // Observable variable for radio button value
  var radioButtonValue = 0.obs;

  // Method to toggle checkbox values
  void toggleCheckbox(int checkboxIndex, bool value) {
    switch (checkboxIndex) {
      case 1:
        checkbox1.value = value;
        break;
      case 2:
        checkbox2.value = value;
        break;
      case 3:
        checkbox3.value = value;
        break;
      case 4:
        checkbox4.value = value;
        break;
    }
  }

  // Method to select a date
  void selectDate(BuildContext context, TextEditingController dateController) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      selectedDate.value = pickedDate;
      dateController.text = "${pickedDate.toLocal()}".split(' ')[0]; // Update the text field with the selected date
    }
  }

  // Method to handle radio button selection
  void handleRadioValueChanged(int value) {
    radioButtonValue.value = value;
  }

  // Method to check if a radio button is selected
  bool isRadioButtonSelected(int value) {
    return radioButtonValue.value == value;
  }

  // Method to reset radio button selection
  void resetRadioButtons() {
    radioButtonValue.value = 0;
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
