import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateGalleryController extends GetxController {
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
  var selectedFiles = <XFile>[].obs;

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

  @override
  void onInit() {
    super.onInit();
  }

  void pickFiles() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? pickedFiles = await picker.pickMultiImage();

    if (pickedFiles != null) {
      selectedFiles.addAll(pickedFiles);
    }
  }

  void clearFiles() {
    selectedFiles.clear();
  }
}
