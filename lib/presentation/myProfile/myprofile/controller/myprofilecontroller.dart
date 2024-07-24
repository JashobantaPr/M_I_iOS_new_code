import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:incentivesgit/presentation/homebottombar/account/service/my_account_service.dart';

import '../model/myProfile.dart';
import '../service/myProfileService.dart';

class MyProfileController extends GetxController {
  var pickedImage = Rx<File?>(null);
  RxList<myProfileModel> details = <myProfileModel>[].obs;
var profilePic = ''.obs;
  RxBool isLoading = false.obs;

  void onInit() {
    fetchDetails();
    fetchuserData();
    super.onInit();
  }

  void fetchuserData() async {
    try {
      final fetchedData = await MyAccountService().primerydata();
      if (fetchedData != null) {
        profilePic.value = fetchedData['profile_pic'] ?? '';
      } else {
        print('No data fetched or data is null');
      }
    } catch (e) {
      print("Failed to fetch ProfiletabData: $e");
    }
  }

  void chooseFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );
    if (result != null && result.files.single.path != null) {
      pickedImage.value = File(result.files.single.path!);
    }
  }

  void chooseFileCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      pickedImage.value = File(pickedFile.path);
    }
  }

  void fetchDetails() async {
    isLoading.value = true;
    try {
      var fetchedData = await MyProfileService().profileTabdata();
      print('fetchedProfiletabData$fetchedData');
      if (fetchedData != null) {
        details.value = fetchedData;
      }
    } catch (e) {
      print("Failed to fetch ProfiletabData: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
