import 'package:get/get.dart';

class Hub2Controller extends GetxController {
  // Define a list of years
  List<String> years = [
    '2020',
    '2021',
    '2022',
    '2023',
    '2024',
    // Add more years as needed
  ];

  // Define Rx variable to hold the selected year
  RxString selectedYear = RxString('2024');

  // Method to update the selected year
  void updateSelectedYear(String year) {
    selectedYear.value = year;
  }
}
