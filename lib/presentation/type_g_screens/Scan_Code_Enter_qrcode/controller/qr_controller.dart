import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/cache_service.dart';
import '../../qrmodels/Scancode.dart';
import '../service_enter_code/Create_entercode.dart';

class QrcodescannerEnterController extends GetxController {
  final CacheService _cacheService = CacheService();
  final TextEditingController entercodecontroller = TextEditingController();

  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  // Function to call when the button is pressed
  Future<void> enterCode() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    String? companyCode = await _cacheService.getCompanyCode();

    try {
      isLoading.value = true;
      var bodyFields = {
        'company_id': companyId ?? '80',
        'user_id': userId ?? '61517',
        'scan_code': entercodecontroller.text ?? '300015',
        'campaign_id': ''
      };
      var entercode = await QrcodeEnterservices().enterscancode(bodyFields);
      if (entercode != null && entercode['status'] == true) {
        Get.dialog(
          Scancodescreen(
            onConfirm: () {
              Get.back();
            },
            textmessage: entercode['msg'],
          ),
        );
        Get.back();
        Get.back();
      } else {
        print('API call failed: ${entercode?['msg']}');
        Get.snackbar('Error', entercode?['msg'] ?? 'Something went wrong',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
      }
    } catch (e) {
      print('Error occurred: $e');
      Get.snackbar('Error', 'An unexpected error occurred.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }
}
