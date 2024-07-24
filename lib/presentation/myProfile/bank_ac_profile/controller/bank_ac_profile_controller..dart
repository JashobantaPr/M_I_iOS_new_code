import 'dart:convert';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myProfile/bank_ac_profile/model/bank_acc_data_model.dart';
import 'package:incentivesgit/presentation/myProfile/bank_ac_profile/model/bank_acc_model.dart';
import 'package:incentivesgit/presentation/myProfile/bank_ac_profile/service/bank_acc_service.dart';
import 'package:path/path.dart' as path;

class BankAccountProfileController extends GetxController {
  TextEditingController holderNamecontroller = TextEditingController();
  TextEditingController accountnumbercontroller = TextEditingController();
  TextEditingController ifsccontroller = TextEditingController();
  TextEditingController singlefilecontroller = TextEditingController();
  var selectedProfileTypeIndex = 1.obs;
  var selectedAccountTypeIndex = 1.obs;
  var bankData = BankProfileData().obs;
  RxBool isUpdated = false.obs;
  var updatedData = BankDocumentSubmissionResponse().obs;
  var decryptedaccountholderName = ''.obs;
  var decryptedAccountNumber = ''.obs;
  var decryptedIfscCode = ''.obs;
  var errors = {}.obs;
  var selectedBankIndex = 0.obs;

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

  void editBank() async {
    BankProfileData? editData = await BankService().bankData();
    if (editData != null) {
      bankData.value = editData;
      if (editData.bankDetails != null) {
        decryptedaccountholderName.value =
            decryptText(editData.bankDetails?.accountHolderName ?? '');
        decryptedAccountNumber.value =
            decryptText(editData.bankDetails?.bankAccountNumber ?? '');
        decryptedIfscCode.value =
            decryptText(editData.bankDetails?.ifscCode ?? '');
      }
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
    if (holderNamecontroller.text.isEmpty) {
      errors['userName'] = 'This field is required';
    }
    if (accountnumbercontroller.text.isEmpty) {
      errors['accountNumber'] = 'This field is required';
    }
    if (ifsccontroller.text.isEmpty) {
      errors['ifscCode'] = 'This field is required';
    }
    if (selectedProfileTypeIndex.value.isNegative) {
      errors['profileType'] = 'This field is required';
    }
    if (selectedAccountTypeIndex.value.isNegative) {
      errors['accountindex'] = 'This field is required';
    }
    if (selectedBankIndex.value.isNegative) {
      errors['bankIndex'] = 'This field is required';
    }
    if (ifsccontroller.text.isEmpty) {
      errors['ifscCode'] = 'This field is required';
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

  void bankUpdateStatus() async {
    bool? update = await BankService().editBankData();
    if (update != null) {
      isUpdated.value = update;
    }
  }

  void bankConfirm() async {
    final holderName = holderNamecontroller.text;
    final accountNumber = accountnumbercontroller.text;
    final ifscCode = ifsccontroller.text;
    final passBookImagePath = singlefilecontroller.text;

    final encryptedNameOnPancard = encryptText(holderName);
    final encryptedPancardNumber = encryptText(accountNumber);
    final ifsccode = encryptText(ifscCode);
    BankDocumentSubmissionResponse? response = await BankService().saveBankData(
      accountHolderName: encryptedNameOnPancard,
      accountNumber: encryptedPancardNumber,
      ifscCode: ifsccode,
      passbookImage: passBookImagePath,
      profileType: selectedProfileTypeIndex.value,
      bankId: selectedBankIndex.value,
      accountType: selectedAccountTypeIndex.value,
      pancardImageExtension:
          path.extension(passBookImagePath).replaceFirst('.', ''),
    );
    if (response != null) {
      updatedData.value = response;
    }
  }

  @override
  void onInit() {
    editBank();
    holderNamecontroller.addListener(() => clearError('username'));
    accountnumbercontroller.addListener(() => clearError('accountNumber'));
    ifsccontroller.addListener(() => clearError('ifscCode'));
    singlefilecontroller.addListener(() => clearError('image'));

    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    holderNamecontroller.clear();
    accountnumbercontroller.clear();
    ifsccontroller.clear();
    singlefilecontroller.clear();
    super.dispose();
  }
}
