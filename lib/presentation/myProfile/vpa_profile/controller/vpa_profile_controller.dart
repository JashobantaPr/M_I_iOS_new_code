import 'dart:convert';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myProfile/vpa_profile/model/documentsubmission_model.dart';
import 'package:incentivesgit/presentation/myProfile/vpa_profile/model/vpa_model.dart';
import 'package:path/path.dart' as path;

import '../service/vpa_service.dart';

class VpaProfileController extends GetxController {
  TextEditingController userNamecontroller = TextEditingController();
  TextEditingController pancardnumbercontroller = TextEditingController();
  TextEditingController singlefilecontroller = TextEditingController();
  var selectedProfileTypeIndex = 1.obs;
  RxBool isUpdated = false.obs;
  var vpaData = VpaProfileResponse(
    vpaWalletList: [],
    vpaDetails: VpaDetails(
      userId: '',
      vpaAccount: '',
      approvalStatusId: '',
      approvalStatus: '',
      userFirstName: '',
      userLastName: '',
      userEmail: '',
      userVpaId: '',
      vpaSubmitDate: '',
      vpaLinkedMobile: '',
      userCode: '',
      vpaWalletName: '',
      vpaWalletType: '',
      vpaWalletId: '',
      pennyDropProcess: '',
      allowUserToEditVpa: false,
      disabled: 0,
      showAutomatedApiCheck: 0,
    ),
    approvalDetails: ApprovalDetails(
      vpaApprovalId: '',
      userVpaId: '',
      userId: '',
      comments: null,
      approvalStatusId: '',
      vpaAccountNameApproved: '',
      vpaWalletNameApproved: '',
      vpaMobileApproved: '',
      pennyDropApproved: '',
      approverUserId: '',
      approverUserName: '',
      approverUserEmail: '',
      vpaBeneficiaryName: null,
      vpaBeneficiaryNameManualApproved: '',
      vpaBeneficiaryNameAutoApproved: '',
      pennyDropResponse: null,
      createdAt: '',
    ),
    status: false,
  ).obs;

  var decryptedMobileNumber = ''.obs;
  var decryptedAccountNAme = ''.obs;

  var errors = {}.obs;
  var updatedData = DocumentSubmissionResponse().obs;
  Map<String, String> userKeys = {};

  void fetchData() async {
    var vpaProfileResponse = await VpaService().fetchVpaProfile();

    if (vpaProfileResponse != null) {
      print('VPA Wallet List: ${vpaProfileResponse.vpaWalletList}');
      print('VPA Details: ${vpaProfileResponse.vpaDetails}');
      print('Approval Details: ${vpaProfileResponse.approvalDetails}');
    } else {
      print('Failed to fetch VPA profile');
    }
  }

  void panUpdateStatus() async {
    bool? update = await VpaService().panData();
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

    DocumentSubmissionResponse? response = await VpaService().updatePanData(
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
    final key = encrypt.Key.fromLength(32); // Adjust key length if needed
    final iv = encrypt.IV.fromLength(16); // Adjust IV length if needed
    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  String decryptText(String encryptedText) {
    final key =
        encrypt.Key.fromUtf8('your-32-character-key'); // Use your actual key
    final iv = encrypt.IV.fromLength(16);
    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    return encrypter.decrypt64(encryptedText, iv: iv);
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
    fetchData();
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
