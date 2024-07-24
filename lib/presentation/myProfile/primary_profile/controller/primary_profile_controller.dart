import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:incentivesgit/core/app_export.dart';

import '../model/primeryProfile.dart';
import '../service/primeryProfileService.dart';

class PrimaryProfileController extends GetxController {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonenumbercontroller = TextEditingController();
  TextEditingController documentnumbercontroller = TextEditingController();
  TextEditingController singlefilecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  RxBool isLoading = false.obs;
  RxList<Userdata> details = <Userdata>[].obs;
  RxString bussinessData = ('').obs;
  RxString mobileNo = ('').obs;
  void onInit() {
    super.onInit();
    fetchPrimeryDetails();
    businessDetails();
  }

  void chooseFile() async {
    // Open file picker
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      // Update text in TextField with the selected file's name
      String? fileName = result.files.single.name;
      singlefilecontroller.text = fileName;
    } else {
      // User canceled the picker
      print('User canceled the file picking.');
    }
  }

  void chooseFileCamera() async {
    // Open file picker
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // Update text in TextField with the selected file's name
      String? fileName = pickedFile.name;
      singlefilecontroller.text = fileName;
    } else {
      // User canceled the picker
      print('User canceled the file picking.');
    }
  }

  void fetchPrimeryDetails() async {
    isLoading.value = true;
    try {
      final fetchedData = await PrimeryProfileService().primerydata();
      print('fetchedProfiletabData: $fetchedData');
      if (fetchedData != null) {
        // Assuming fetchedData is an instance of MyPrimeryModel
        details.value = fetchedData;
        mobileNo.value = details.first.phoneNumber!;
        print('Details:');
        print('User Code: ${details.first.companyname}');
        print('Company Name: ${details.first.phoneNumber}');

        print('Details updated with fetched data: $details');

        // Add more fields as needed
      } else {
        print('No data fetched or data is null');
      }
    } catch (e) {
      print("Failed to fetch ProfiletabData: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void businessDetails() async {
    isLoading.value = true;
    try {
      final fetchedData = await PrimeryProfileService().businessHierdata();
      if (fetchedData != null) {
        print('Fetched Data: $fetchedData');
        if (fetchedData['status'] == true && fetchedData['hierarchy'] != null) {
          var hierarchy = fetchedData['hierarchy'];
          bussinessData.value = hierarchy['is_hierarchy_enabled'];
          print('Hierarchy Data: ${bussinessData.value}');
        } else {
          print('Invalid data structure or missing hierarchy data.');
        }
      } else {
        print('No data fetched or data is null');
      }
    } catch (e) {
      print("Failed to fetch ProfiletabData: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void onSubmit() async {
    final fetchedData = await PrimeryProfileService().updateMobileNo();
  }
}
