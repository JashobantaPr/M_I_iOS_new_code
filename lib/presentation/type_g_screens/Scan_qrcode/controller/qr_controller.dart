import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../../core/utils/cache_service.dart';
import '../../Scan_Code_Enter_qrcode/service_enter_code/Create_entercode.dart';
import '../../qrmodels/Scancode.dart';

class QrcodescannerController extends GetxController {
  var qrKey = GlobalKey(debugLabel: 'QR');
  final CacheService _cacheService = CacheService();

  QRViewController? qrController;
  var isFlashOn = false.obs;
  var result = ''.obs;
  final ImagePicker _picker = ImagePicker();

  final RxBool isLoading = false.obs;

  @override
  void onClose() {
    qrController?.dispose();
    super.onClose();
  }

  void onQRViewCreated(QRViewController qrController) {
    this.qrController = qrController;
    qrController.scannedDataStream.listen((scanData) {
      result.value = scanData.code ?? 'No Data';
      if (result.value.isNotEmpty && result.value != 'No Data') {
        enterCode(result.value);
      }
    });
  }

  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No Permission')),
      );
    }
  }

  double getScanArea(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.8;
  }

  void toggleFlash() {
    if (qrController != null) {
      qrController!.toggleFlash();
      isFlashOn.value = !isFlashOn.value;
    }
  }

  void flipCamera() {
    if (qrController != null) {
      qrController!.flipCamera();
    }
  }

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      scanImage(image.path);
    }
  }

  Future<void> scanImage(String imagePath) async {
    try {
      // String? scanResult = await QrCodeToolsPlugin.decodeFrom(imagePath);
      // result.value = scanResult ?? 'No QR code found';
    } catch (e) {
      result.value = 'Failed to scan QR code';
    }
  }

  // Function to call when the button is pressed
  Future<void> enterCode(String scancode) async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    String? companyCode = await _cacheService.getCompanyCode();

    String convertedCode = convertScancode(scancode);

    try {
      isLoading.value = true;
      var bodyFields = {
        'company_id': companyId ?? '80',
        'user_id': userId ?? '61517',
        'scan_code': convertedCode ?? '300015',
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
        Get.snackbar(
          'Error',
          entercode?['msg'] ?? 'Something went wrong',
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

  String convertScancode(String scancode) {
    return scancode.toUpperCase();
  }
}
