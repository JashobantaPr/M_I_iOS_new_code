import 'package:get/get.dart';

class EarnedPointsViewDetailsController extends GetxController {
  var isDropdownOpen = false.obs;
  var transactionType = "".obs;

  void toggleDropdown() {
    isDropdownOpen.value = !isDropdownOpen.value;
  }

   var isExpanded = false.obs;

  void toggleExpansion() {
    isExpanded.toggle();
  }

  void setTransactionType(String type) {
    transactionType.value = type;
    isDropdownOpen.value = false; // Optionally, close dropdown after selection
  }
}
