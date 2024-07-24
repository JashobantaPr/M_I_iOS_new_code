import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/presentation/help&support/customer_support_2/model/customer_support_2_model.dart';
import 'package:incentivesgit/presentation/help&support/customer_support_2/service/customer_support_2_service.dart';

class HelpandSupportCustomerSupport2Controller extends GetxController {
  List<TicketCategory> ticketCategories = <TicketCategory>[].obs;
  final TextEditingController mobilenumber = TextEditingController();
  final TextEditingController subjectline = TextEditingController();
  final TextEditingController message = TextEditingController();
  final TextEditingController singlefilecontroller = TextEditingController();
  var selectedFile = Rxn<File>();
  var selectedCategory = Rxn<String>();
  final CacheService _cacheService = CacheService();
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCustomerSupport2List();
  }

  void fetchCustomerSupport2List() async {
    try {
      ticketCategories
          .assignAll(await CustomerSupport2Service().getTicketCategories());
    } catch (e) {
      print("Failed to fetch help user manual list: $e");
    }
  }

  void chooseFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      String? fileName = result.files.single.name;
      singlefilecontroller.text = fileName;
      selectedFile.value = File(result.files.single.path!);
    } else {
      print('User canceled the file picking.');
    }
  }

  void chooseFileCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      String? fileName = pickedFile.name;
      singlefilecontroller.text = fileName;
      selectedFile.value = File(pickedFile.path);
    } else {
      print('User canceled the file picking.');
    }
  }

  void uploadFile() async {
    if (selectedFile.value == null) {
      print('No file selected.');
      return;
    }
  }

  Future<void> addticket() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    String? companyCode = await _cacheService.getCompanyCode();

    try {
      isLoading.value = true;

      var bodyFields = {
        'company_name': 'HAshtag',
        'subject': subjectline.text,
        'mobile_number': mobilenumber.text,
        'ticket_description': message.text,
        'firstname': 'Viru',
        'lastname': 'Two',
        'country': 'India',
        'state': 'Maharashtra',
        'city': 'Mahad',
        'street': 'Mahad',
        'user_id': '61493',
        'company_id': '80',
        'file': '{{file}}',
        'category': 'Technical Issues',
        'email': 'viru2.k@grgidia.in'
      };

      print('bodyFieldsbodyFields$bodyFields');

      var fetches = await CustomerSupport2Service().addticket(bodyFields);
    } catch (e) {
      print('No Buzzes  $e');
    } finally {
      isLoading.value = false;
    }
  }
}
