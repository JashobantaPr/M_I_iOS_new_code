import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incentivesgit/routes/app_routes.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:image_picker/image_picker.dart';

class ScanQrcodeController extends GetxController {
  var qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrController;
  var isFlashOn = false.obs;
  var result = ''.obs;
  final ImagePicker _picker = ImagePicker();

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
        navigateToNextScreen(result.value);
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

  void navigateToNextScreen(String qrCode) {
    Get.toNamed(AppRoutes.qrcodedata, arguments: qrCode);
  }
}
