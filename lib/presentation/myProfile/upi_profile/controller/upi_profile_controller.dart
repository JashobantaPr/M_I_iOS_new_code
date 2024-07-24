import 'dart:convert';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myProfile/upi_profile/module/upiupdate_model.dart';
import 'package:incentivesgit/presentation/myProfile/upi_profile/module/user_details_module.dart';
import 'package:incentivesgit/presentation/myProfile/upi_profile/service/upi_details_service.dart';

class UpiProfileController extends GetxController {
  TextEditingController upiIdcontroller = TextEditingController();
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  RxBool isUpdated = false.obs;
  var upiData = UpiProfileSubmitResponse().obs;
  var errors = {}.obs;
  var decryptedupiId = ''.obs;
  var decryptedFirstName = ''.obs;
  var decryptedLastName = ''.obs;

  var upiDetails = UpiDetails().obs;

  void fetchUpiDetails() async {
    try {
      UpiDetails? upiDetail = await UpiDetailsService().userUpiDetails();
      if (upiDetail != null) {
        upiDetails.value = upiDetail;
        decryptedupiId.value = decryptText(upiDetail.upiDetails?.upiId ?? '');
        decryptedFirstName.value =
            decryptText(upiDetail.upiDetails?.upiFname ?? "");
        decryptedLastName.value =
            decryptText(upiDetail.upiDetails?.upiLname ?? "");
      } else {
        print('UPI details are null');
      }
    } catch (e) {
      print('Error fetching UPI details: $e');
    }
  }

  void upiUpdateStatus(String statusCode) async {
    bool? update = await UpiDetailsService().upiData(statusCode);
    if (update != null) {
      isUpdated.value = update;
    }
  }

  void panConfirm() async {
    final firstName = firstnamecontroller.text;
    final lastName = lastnamecontroller.text;
    final upiId = upiIdcontroller.text;
    final encryptedFirstName = encryptText(firstName);
    final encryptedLastName = encryptText(lastName);
    final encryptedupiId = encryptText(upiId);
    UpiProfileSubmitResponse? response = await UpiDetailsService()
        .updateUpiData(encryptedFirstName, encryptedLastName, encryptedupiId);
    if (response != null) {
      upiData.value = response; // Store the response
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
    if (upiIdcontroller.text.isEmpty) {
      errors['upiId'] = 'This field is required';
    }
    if (firstnamecontroller.text.isEmpty) {
      errors['firstName'] = 'This field is required';
    }
    if (lastnamecontroller.text.isEmpty) {
      errors['lastName'] = 'This field is required';
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
    fetchUpiDetails();
    upiIdcontroller.addListener(() => clearError('upiId'));
    firstnamecontroller.addListener(() => clearError('firstName'));
    lastnamecontroller.addListener(() => clearError('lastName'));

    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    upiIdcontroller.clear();
    firstnamecontroller.clear();
    lastnamecontroller.clear();
    super.dispose();
  }
}
