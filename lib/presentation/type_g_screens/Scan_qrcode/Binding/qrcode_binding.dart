import 'package:get/get.dart';

import '../controller/qr_controller.dart';

class QrcodescannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QrcodescannerController());
  }
}
