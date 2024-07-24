import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myOrders/otp_screen/controller/otp_controller.dart';

import 'package:incentivesgit/presentation/myOrders/otp_screen/otp_screen.dart';

import '../../myorder/controller/myOrderController.dart';
import '../../voucher_view/controller/vouchar_view_controller.dart';
import '../controller/viewdetails_controller.dart';

class MyOrderViewDetailsbinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyorderViewDetailsController());
    Get.lazyPut(() => MyOrderController());
    Get.lazyPut(() => VoucharViewController());
    Get.lazyPut(() => MyOrderController());
    Get.lazyPut(() => OrderOtpController());
  }
}
