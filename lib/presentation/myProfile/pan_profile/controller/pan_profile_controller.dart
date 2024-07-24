import 'dart:convert';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myProfile/pan_profile/model/documentsubmission_model.dart';
import 'package:incentivesgit/presentation/myProfile/pan_profile/model/pan_model.dart';
import 'package:incentivesgit/presentation/myProfile/pan_profile/service/pan_service.dart';
import 'package:path/path.dart' as path;

class PanProfileController extends GetxController {
  TextEditingController userNamecontroller = TextEditingController();
  TextEditingController pancardnumbercontroller = TextEditingController();
  TextEditingController singlefilecontroller = TextEditingController();
  var selectedProfileTypeIndex = 1.obs;
  RxBool isUpdated = false.obs;
  var panData = PanProfileEdit().obs;
  var errors = {}.obs;
  var updatedData = DocumentSubmissionResponse().obs;
  Map<String, String> userKeys = {};
  var decryptedPanCardNumber = ''.obs;
  var decryptedPanCardName = ''.obs;

  void chooseFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      String? fileName = result.files.single.name;
      singlefilecontroller.text = fileName;
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
    } else {
      print('User canceled the file picking.');
    }
  }

  void editPan() async {
    PanProfileEdit? editData = await PanService().panEdit();
    if (editData != null) {
      panData.value = editData;
      if (editData.panDetails != null) {
        decryptedPanCardNumber.value =
            decryptText(editData.panDetails?.panCardNumber ?? '');
        decryptedPanCardName.value =
            decryptText(editData.panDetails?.nameOnPanCard ?? '');
      }
    }
  }

  void panUpdateStatus() async {
    bool? update = await PanService().panData();
    if (update != null) {
      isUpdated.value = update;
    }
  }

  void panConfirm() async {
    final name = userNamecontroller.text;
    final panCardNumber = pancardnumbercontroller.text;
    final pancardImagePath = singlefilecontroller.text;

    final encryptedNameOnPancard = encryptText(name);
    final encryptedPancardNumber = encryptText(panCardNumber);

    DocumentSubmissionResponse? response = await PanService().updatePanData(
      profileType: selectedProfileTypeIndex.value,
      nameOnPancard: encryptedNameOnPancard,
      pancardNumber: encryptedPancardNumber,
      pancardImage: pancardImagePath,
      pancardImageExtension:
          path.extension(pancardImagePath).replaceFirst('.', ''),
    );

    if (response != null) {
      updatedData.value = response;
    }
  }

  String encryptText(String plainText) {
    const int CIPHER_KEY_LEN = 16;
    String key = "df22bb7f8ef8f7b6d0ad6d58de758182";
    String ivKey = "1234567891011121";

    if (key.length < CIPHER_KEY_LEN) {
      key = key.padRight(CIPHER_KEY_LEN, '0');
    } else if (key.length > CIPHER_KEY_LEN) {
      key = key.substring(0, CIPHER_KEY_LEN);
    }

    final keyBytes = utf8.encode(key);
    final ivBytes = utf8.encode(ivKey);
    final iv = encrypt.IV.fromUtf8(ivKey);

    final encrypter = encrypt.Encrypter(encrypt.AES(
        encrypt.Key.fromBase64(base64.encode(keyBytes)),
        mode: encrypt.AESMode.cbc));

    final encrypted = encrypter.encrypt(plainText, iv: iv);

    // Encode IV to Base64
    String base64Iv = base64.encode(ivBytes);

    return '${encrypted.base64}:$base64Iv';
  }

  String decryptText(String encryptedText) {
    const String ivKey = "1234567891011121";
    String key = "df22bb7f8ef8f7b6d0ad6d58de758182";
    const int CIPHER_KEY_LEN = 16;

    // Adjust key length
    if (key.length < CIPHER_KEY_LEN) {
      key = key.padRight(CIPHER_KEY_LEN, '0');
    } else if (key.length > CIPHER_KEY_LEN) {
      key = key.substring(0, CIPHER_KEY_LEN);
    }

    final iv = encrypt.IV.fromUtf8(ivKey);
    final keyBytes =
        encrypt.Key.fromUtf8(key); // Use fromUtf8 instead of fromBase64

    final encrypter =
        encrypt.Encrypter(encrypt.AES(keyBytes, mode: encrypt.AESMode.cbc));

    // Assuming the input format is encryptedText:iv
    final parts = encryptedText.split(":");
    if (parts.length != 2) {
      throw Exception("Invalid encrypted text format");
    }

    final encryptedBase64 = parts[0];
    final encryptedIV = parts[1];

    final ivFromBase64 = encrypt.IV.fromBase64(encryptedIV);

    // Decrypt the data
    final decrypted = encrypter.decrypt64(encryptedBase64, iv: ivFromBase64);

    return decrypted; // Return the decrypted text
  }

  bool validateForm() {
    errors.clear();
    if (userNamecontroller.text.isEmpty) {
      errors['userName'] = 'This field is required';
    }
    if (pancardnumbercontroller.text.isEmpty) {
      errors['cardNumber'] = 'This field is required';
    }
    if (singlefilecontroller.text.isEmpty) {
      errors['image'] = 'This field is required';
    }

    return errors.isEmpty;
  }

  void clearError(String key) {
    if (errors.containsKey(key)) {
      errors.remove(key);
    }
  }

  @override
  void onInit() {
    editPan();
    userNamecontroller.addListener(() => clearError('userName'));
    pancardnumbercontroller.addListener(() => clearError('cardName'));
    singlefilecontroller.addListener(() => clearError('cardNumber'));

    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    userNamecontroller.clear();
    pancardnumbercontroller.clear();
    singlefilecontroller.clear();
    super.dispose();
  }
}
