import 'package:get/get.dart';

import '../controller/scan_qrcode_controller.dart';

class ScanQrCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScanQrcodeController());
  }
}
