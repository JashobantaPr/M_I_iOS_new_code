import 'package:incentivesgit/core/app_export.dart';

class ToprankersController extends GetxController{
  var isExpanded = false.obs;
  var isExpanded1 = false.obs;

  void toggleExpand() {
    isExpanded.value = !isExpanded.value;
  }
  void toggleExpand1() {
    isExpanded1.value = !isExpanded1.value;
  }
}