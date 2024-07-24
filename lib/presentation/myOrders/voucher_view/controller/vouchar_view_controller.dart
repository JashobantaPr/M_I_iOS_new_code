import 'package:incentivesgit/core/app_export.dart';

import '../../myorder/controller/myOrderController.dart';

class VoucharViewController extends GetxController {
  final myordercontroller = Get.find<MyOrderController>();

  @override
  void onInit() {
    super.onInit();
    myordercontroller.viewVoucher();
  }
}
