import 'package:get/get.dart';

class Buzz32Controller extends GetxController {
  var selectedOption1 = false.obs;
  var selectedOption2 = false.obs;

  void selectOption1(bool value) {
    selectedOption1.value = value;
    if (value) selectedOption2.value = false; // Deselect option 2 when option 1 is selected
  }

  void selectOption2(bool value) {
    selectedOption2.value = value;
    if (value) selectedOption1.value = false; // Deselect option 1 when option 2 is selected
  }
}
