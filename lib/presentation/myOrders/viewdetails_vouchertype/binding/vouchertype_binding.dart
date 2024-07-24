import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myOrders/viewdetails_vouchertype/controller/vouchertype_controller.dart';

class MyOrderViewDetailsVoucherTypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyOrderViewDetailsVoucherTypeController());
  }
}
