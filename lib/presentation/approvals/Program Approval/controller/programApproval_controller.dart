import 'package:get/get.dart';

class ProgramApprovalController extends GetxController {
  var isExpanded = false.obs;

  void toggleExpansion() {
    isExpanded.value = !isExpanded.value;
  }
}
