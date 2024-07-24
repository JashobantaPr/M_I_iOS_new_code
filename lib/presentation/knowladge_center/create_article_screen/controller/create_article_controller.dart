import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incentivesgit/presentation/certificate_screens/Award%20Certificate/model/awardCertificate_model.dart';

class CreateArticleController extends GetxController {
  final TextEditingController discription = TextEditingController();

  var selectedOption1 = false.obs;
  var selectedOption2 = false.obs;
  var isSelected = false.obs;
  var isUserExpanded = false.obs;
  var selectedRadio = 'text'.obs;
  var isDescriptionExpanded = false.obs;
  var isBehaviourExpanded = false.obs;

  var isCancelTapped = false.obs;
  var isBuzzTapped = false.obs;
  var selectedFileName = ''.obs;
  var radioValue = 1.obs;

  void selectOption1(bool value) {
    selectedOption1.value = value;
    if (value) selectedOption2.value = false;
  }

  void selectOption2(bool value) {
    selectedOption2.value = value;
    if (value) selectedOption1.value = false;
  }

  void toggleBehaviourExpanded() {
    isBehaviourExpanded.value = !isBehaviourExpanded.value;
  }

  void toggleCancel() {
    if (!isCancelTapped.value) {
      isCancelTapped.value = true;
      isBuzzTapped.value = false; // Deselect Buzz
    }
  }

  void toggleBuzz() {
    if (!isBuzzTapped.value) {
      isBuzzTapped.value = true;
      isCancelTapped.value = false; // Deselect Cancel
    }
  }

  var userList = <User>[].obs;
  var isLoading = true.obs;
  var filteredUsers = <User>[].obs;
  var selectedUsers = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      selectedFileName.value = result.files.single.name;
    } else {
      selectedFileName.value = 'No file chosen';
    }
  }
}
