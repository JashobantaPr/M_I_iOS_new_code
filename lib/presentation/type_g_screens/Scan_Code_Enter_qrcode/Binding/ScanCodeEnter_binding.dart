import 'package:get/get.dart';

import '../controller/qr_controller.dart';

class QrcodescannerEnterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QrcodescannerEnterController());
  }
}
