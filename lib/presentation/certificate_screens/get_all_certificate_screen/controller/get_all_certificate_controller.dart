import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter/material.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_Tabbar/controller/buzzeTabBar_Controller.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/utils/cache_service.dart';
import '../model/get_all_certificate_model.dart';
import '../service/get_all_service.dart';

class GetAllCertificateController extends GetxController {
  final _service = getAllCertificateServices();
  TextEditingController commentcontroller = TextEditingController();
  Rx<getallcertificateModel> getAllCertificate = getallcertificateModel().obs;
  final CacheService _cacheService = CacheService();
  var isDislikedMap = <String, RxBool>{}.obs;
  RxBool isLoading = false.obs;
  RxBool isLike = false.obs;

  RxString firstName = ('').obs;
  RxString lastName = ('').obs;
  RxString profileImage = ('').obs;
  var isApplyButtonClicked = false.obs;
  var isCancelButtonClicked = false.obs;

  TextEditingController serchcontroller = TextEditingController();
  var selectedOption = ''.obs;
  var fromDate = ''.obs;
  var toDate = ''.obs;
  final CertificateTabBarController scopeController =
      Get.find<CertificateTabBarController>();

  var likedPosts = <String>[].obs;
  String encryptedData = '...';

  @override
  void onInit() {
    super.onInit();

    getAllCertifictes();
  }

  List<String> viewOptions = [
    'All Certificates',
    'My Certificates',
  ];

  void setSelectedOption(String? option) {
    if (option != null) {
      selectedOption.value = option;
    }
  }

  void resetFilters() {
    serchcontroller.clear();
    selectedOption.value = '';
    fromDate.value = '';
    toDate.value = '';
    isApplyButtonClicked.value = false;
    isCancelButtonClicked.value = false;
  }

  Future<void> getAllCertifictes() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    String? companyCode = await _cacheService.getCompanyCode();

    isLoading.value = true; // Set loading to true

    var filter = 'all'; // Default filter value
    switch (selectedOption.value) {
      case 'All Certificate':
        filter = 'all';
        break;
      case 'My Certificate':
        filter = 'Buzzes by me';
        break;
    }
    var mapString = {
      'own_id': userId ?? '',
      'company_id': companyId ?? '',
      'posts_type': 'Certificates',
      'start': '0',
      'end': '9',
      'comp_code': companyCode ?? "",
      'scope_id': scopeController.selectedScopeid.value,
      'keyword': serchcontroller.text,
      'from': fromDate.value,
      'to': toDate.value,
      'filter': filter
    };
    var response =
        await getAllCertificateServices().getAllCertificatesDetails(mapString);
    if (response != null) {
      print('getAll$response');
      getAllCertificate.value = getallcertificateModel.fromJson(response);
      print('getAllCertificates${getAllCertificate.value}');
    }
    isLoading.value = false; // Set loading to false
  }

  Future<void> likepost(
      String postId, String firstname, String lastname) async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    try {
      var bodyFields = {
        'type': 'post',
        'last_name': lastname,
        'first_name': firstname,
        'user_id': userId ?? '',
        'company_id': companyId ?? '',
        'postid': postId,
        'com_post_id': ''
      };

      if (likedPosts.contains(postId)) {
        var dislike = await getAllCertificateServices().removeLike(bodyFields);
        if (dislike == 'success') {
          likedPosts.remove(postId);
          likedPosts.clear();
        }
      } else {
        var like = await getAllCertificateServices().addlike(bodyFields);
        if (like == 'success') {
          likedPosts.add(postId);
          likedPosts.clear();
        }
      }
      getalllikesCertificate(postId);
      refreshCertificatesData();
    } catch (e) {
      print('No Buzzes $e');
    }
  }

  void refreshCertificatesData() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    String? companyCode = await _cacheService.getCompanyCode();

    // Fetch and update data
    try {
      var filter = 'all'; // Default filter value
      switch (selectedOption.value) {
        case 'All Certificate':
          filter = 'all';
          break;
        case 'My Certificate':
          filter = 'Buzzes by me';
          break;
      }
      var mapString = {
        'own_id': userId ?? '',
        'company_id': companyId ?? '',
        'posts_type': 'Certificates',
        'start': '0',
        'end': '9',
        'comp_code': companyCode ?? "",
        'scope_id': scopeController.selectedScopeid.value,
        'keyword': serchcontroller.text,
        'from': fromDate.value,
        'to': toDate.value,
        'filter': filter
      };
      var response = await getAllCertificateServices()
          .getAllCertificatesDetails(mapString);
      if (response != null) {
        print('getAll$response');
        getAllCertificate.value = getallcertificateModel.fromJson(response);
        print('getAllCertificates${getAllCertificate.value}');
      }
    } catch (e) {
      print('Failed to refresh certificates: $e');
    }
  }






  Future<void> getalllikesCertificate(String postId) async {
    String? userId = await _cacheService.getUserId();

    try {
      var bodyFields = {'post_id': postId, 'user_id': userId!};
      var fetches = await getAllCertificateServices().getlikes(bodyFields);

      if (fetches != null) {
        final likedUsers = fetches['users_ids'].split(',');
        if (likedUsers.contains(userId)) {
          likedPosts.add(postId);
        } else {
          likedPosts.remove(postId);
        }
      }
    } catch (e) {
      print('No Buzzes  $e');
    }
  }

  void addcomment(String firstName, String lastName, String postId) async {
    try {
      isLoading.value = true;
      String? userId = await _cacheService.getUserId();
      String? companyId = await _cacheService.getCompanyId();
      print('firstName: $firstName, lastName: $lastName, postId: $postId');

      var bodyFields = {
        'company_id': companyId ?? '',
        'own_id': userId ?? '',
        'postid': postId,
        'product_code': 'P00003',
        'f_name': firstName,
        'l_name': lastName,
        'comment': commentcontroller.text
      };
      print('bodyFields: $bodyFields');
      String? response =
          await getAllCertificateServices().addcomment(bodyFields);

      if (response != null) {
        print('Response from addcomment: $response');
        await getAllCertificate(); // Call getAllCertificate after successful comment addition
        commentcontroller.clear();
      } else {
        print('Failed to add comment');
      }
    } catch (e) {
      print('Error adding comment: $e');
    } finally {
      isLoading.value = false; // End loading, whether successful or not
    }
  }

// Encrypt a certificateUserMappingId using AES with CBC mode
  String encryptId(String id, String keyString, String ivString) {
    final keyBytes =
        latin1.encode(keyString.padRight(16, '0').substring(0, 16));
    final ivBytes = latin1.encode(ivString);

    print('keyBytesvvkeyBytes     $keyBytes');
    print('ivBytesivBytesivBytesivBytes     $ivBytes');

    final key = encrypt.Key(Uint8List.fromList(keyBytes));
    final iv = encrypt.IV(Uint8List.fromList(ivBytes));

    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(id, iv: iv);
    final base64Encrypted = encrypted.base64;

    final base64Iv = base64Encode(ivBytes);
    print('base64Ivbase64Iv    $base64Iv');
    return base64Encode('$base64Encrypted:$base64Iv'.codeUnits);
  }

// Decrypt the PDF data using AES with CBC mode
  String decryptPdfData(
      String base64String, String keyString, String ivString) {
    final decodedString = utf8.decode(base64Decode(base64String));
    final parts = decodedString.split(':');
    final encryptedData = base64Decode(parts[0]);
    final ivBytes = base64Decode(parts[1]);

    final keyBytes =
        latin1.encode(keyString.padRight(16, '0').substring(0, 16));
    final key = encrypt.Key(Uint8List.fromList(keyBytes));
    final iv = encrypt.IV(Uint8List.fromList(ivBytes));

    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    // Decrypt the data
    final decrypted =
        encrypter.decryptBytes(encrypt.Encrypted(encryptedData), iv: iv);
    return utf8.decode(decrypted);
  }

  Future<void> savePdf(String base64String) async {
    final bytes = base64Decode(base64String);
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/downloaded_certificate.pdf';
    final file = File(filePath);
    await file.writeAsBytes(bytes);
    print('PDF saved to $filePath');
  }

  Future<void> downloadCertificate(String certificateUserMappingId) async {
    final keyString = 'df22bb7f8ef8f7b6d0ad6d58de758182';
    final ivString = '1234567891011121';

    // Encrypt the certificateUserMappingId
    final encryptedCertificateId =
        encryptId(certificateUserMappingId, keyString, ivString);

    print('encryptedCertificateId-----$encryptedCertificateId');

    try {
      // Set loading state
      isLoading.value = true;

      // Get user and company IDs
      String? userId = await _cacheService.getUserId();
      String? companyId = await _cacheService.getCompanyId();

      // Prepare body fields for the API request
      var bodyFields = {
        'comp_code': 'COMP000080',
        'user_id': userId ?? 'default_user_id',
        'certificateUserMappingId': encryptedCertificateId,
      };

      // Call the API to download the certificate
      final responseData = await _service.downloadCertificate(bodyFields);

      if (responseData.isNotEmpty) {
        String base64Pdf = responseData['pdf'];
        print('Base64 PDF: $base64Pdf');

        // Decrypt the PDF data
        String decryptedPdfData =
            decryptPdfData(base64Pdf, keyString, ivString);
        print('Decrypted PDF Data: $decryptedPdfData');

        // Save the decrypted PDF data
        await savePdf(decryptedPdfData);
        print('PDF downloaded and saved successfully.');
      } else {
        print('Failed to download file.');
      }
    } catch (e) {
      print('Error downloading certificate: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> selectDate(BuildContext context, bool isFromDate) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
      if (isFromDate) {
        fromDate.value = formattedDate;
      } else {
        toDate.value = formattedDate;
      }
    }
  }
}
