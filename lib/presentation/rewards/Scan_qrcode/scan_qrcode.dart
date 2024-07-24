import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'controller/scan_qrcode_controller.dart';

class ScanQrCodeScreen extends GetWidget<ScanQrcodeController> {
  const ScanQrCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Scan Code',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0XFFE21D39),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: QRView(
              key: controller.qrKey,
              onQRViewCreated: controller.onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: const Color(0XFFFFFFFF),
                borderRadius: 1,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: controller.getScanArea(context),
              ),
              onPermissionSet: (ctrl, p) =>
                  controller.onPermissionSet(context, ctrl, p),
            ),
          ),
        ],
      ),
    );
  }
}
