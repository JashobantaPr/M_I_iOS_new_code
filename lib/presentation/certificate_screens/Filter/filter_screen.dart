import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_Tabbar/controller/buzzeTabBar_Controller.dart';
import 'package:incentivesgit/presentation/certificate_screens/get_all_certificate_screen/controller/get_all_certificate_controller.dart';
import 'package:incentivesgit/theme/theme_helper.dart';

class FilterBottomSheetScreen extends StatelessWidget {
  final GetAllCertificateController dateController =
      Get.put(GetAllCertificateController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: DraggableScrollableSheet(
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: appTheme.redappbar,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Filter',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        const Spacer(),
                        const Text(
                          'reset Filter',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          padding: const EdgeInsets.only(bottom: 0),
                          icon: const Icon(
                            Icons.rotate_left_sharp,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            dateController.resetFilters();
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0, bottom: 5),
                    child: Text(
                      'Search',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    height: 50,
                    child: TextField(
                      controller: dateController.serchcontroller,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                        labelText: 'Search',
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0, bottom: 5),
                    child: Text(
                      'View',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    height: 50,
                    child: Obx(() => DropdownButtonFormField<String>(
                          value: dateController.selectedOption.value.isEmpty
                              ? null
                              : dateController.selectedOption.value,
                          items:
                              dateController.viewOptions.map((String option) {
                            return DropdownMenuItem<String>(
                              value: option,
                              child: Text(option),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            dateController.setSelectedOption(newValue);
                          },
                          decoration: const InputDecoration(
                            labelText: 'All Certificates',
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            contentPadding: EdgeInsets.all(10),
                          ),
                        )),
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0, bottom: 5),
                    child: Text(
                      'From',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    height: 50,
                    child: Obx(
                      () => TextField(
                        controller: TextEditingController(
                            text: dateController.fromDate.value),
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          labelText: 'From Date',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                          suffixIcon: Icon(
                            Icons.calendar_month,
                            color: Colors.black,
                          ),
                        ),
                        onTap: () => dateController.selectDate(context, true),
                        readOnly: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0, bottom: 5),
                    child: Text(
                      'To',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    height: 50,
                    child: Obx(
                      () => TextField(
                        controller: TextEditingController(
                            text: dateController.toDate.value),
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          labelText: 'To Date',
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(),
                          suffixIcon: Icon(
                            Icons.calendar_month,
                            color: Colors.black,
                          ),
                        ),
                        onTap: () => dateController.selectDate(context, false),
                        readOnly: true,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Divider(color: appTheme.greydivider),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          dateController.isApplyButtonClicked.value = true;
                          dateController.isCancelButtonClicked.value = false;
                          dateController.getAllCertifictes();
                          Get.back();
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.grey),
                          minimumSize: const Size(120, 60),
                        ),
                        child: const Text(
                          'Apply',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      OutlinedButton(
                        onPressed: () {
                          dateController.isApplyButtonClicked.value = false;
                          dateController.isCancelButtonClicked.value = true;
                          // Get.back();
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.grey),
                          minimumSize: const Size(120, 60),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
