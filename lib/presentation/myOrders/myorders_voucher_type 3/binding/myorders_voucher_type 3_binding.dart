import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myOrders/myorders_voucher_type%203/controller/myorders_voucher_type%203_controller.dart';

class MyOrdersVoucherType3Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MyOrdersVoucherType3Controller());
  }
  
}