import 'dart:convert';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myProfile/paytm_profile/model/paytm_model.dart';
import 'package:incentivesgit/presentation/myProfile/paytm_profile/model/paytm_submit_model.dart';
import 'package:incentivesgit/presentation/myProfile/paytm_profile/service/paytm_service.dart';

class PaytmProfileController extends GetxController {
  TextEditingController mobilenumbercontroller = TextEditingController();
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  var decryptedMobileNumber = ''.obs;
  var decryptedFirstName = ''.obs;
  var decryptedLastName = ''.obs;
  RxBool isUpdated = false.obs;
  var paytmData = PaytmDetailsResponse().obs;
  var errors = {}.obs;
  var updatedData = PaytmProfileResponse().obs;
  Map<String, String> userKeys = {};

  void editPaytm() async {
    PaytmDetailsResponse? editData = await PaytmService().paytmData();
    if (editData != null) {
      paytmData.value = editData;
      print('dkhfbhf ${editData.paytmDetails}');
      if (editData.paytmDetails != null) {
        decryptedMobileNumber.value =
            decryptText(editData.paytmDetails?.paytmLinkedMobile ?? '');
        decryptedFirstName.value =
            decryptText(editData.paytmDetails?.paytmHolderFname ?? '');
        decryptedLastName.value =
            decryptText(editData.paytmDetails?.paytmHolderLname ?? '');
      }
    }
  }

  void paytmUpdateStatus() async {
    bool? update = await PaytmService().editPaytm();
    if (update != null) {
      isUpdated.value = update;
    }
  }

  void paytmConfirm() async {
    final firstName = firstnamecontroller.text;
    final lastName = lastnamecontroller.text;
    final mobileNumber = mobilenumbercontroller.text;
    final encryptedFirstName = encryptText(firstName);
    final encryptedLastName = encryptText(lastName);
    final encryptedMobileNumber = encryptText(mobileNumber);
    PaytmProfileResponse? response = await PaytmService().updatePaytm(
        encryptedFirstName, encryptedLastName, encryptedMobileNumber);
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
    String key = "df22bb7f8ef8f7b6d0ad6d58de758182";
    const int CIPHER_KEY_LEN = 16;

    // Adjust key length
    if (key.length < CIPHER_KEY_LEN) {
      key = key.padRight(CIPHER_KEY_LEN, '0');
    } else if (key.length > CIPHER_KEY_LEN) {
      key = key.substring(0, CIPHER_KEY_LEN);
    }

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
    if (mobilenumbercontroller.text.isEmpty) {
      errors['userFirstName'] = 'This field is required';
    }
    if (firstnamecontroller.text.isEmpty) {
      errors['userLastName'] = 'This field is required';
    }
    if (lastnamecontroller.text.isEmpty) {
      errors['mobilenumber'] = 'This field is required';
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
    firstnamecontroller.addListener(() => clearError('userFirstName'));
    lastnamecontroller.addListener(() => clearError('userLastName'));
    mobilenumbercontroller.addListener(() => clearError('mobilenumber'));
    editPaytm();
    super.onInit();
  }

  @override
  void dispose() {
    firstnamecontroller.clear();
    lastnamecontroller.clear();
    mobilenumbercontroller.clear();
    super.dispose();
  }
}
