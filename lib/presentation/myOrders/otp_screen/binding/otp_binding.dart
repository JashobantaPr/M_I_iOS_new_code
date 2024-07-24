import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myOrders/otp_screen/controller/otp_controller.dart';
import 'package:incentivesgit/presentation/myOrders/viewDetails/controller/viewdetails_controller.dart';

import '../../myorder/controller/myOrderController.dart';
import '../../voucher_view/controller/vouchar_view_controller.dart';

class OtpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyOrderController());
    Get.lazyPut(() => MyorderViewDetailsController());
    Get.lazyPut(() => VoucharViewController());
    Get.lazyPut(() => OrderOtpController());

    // TODO: implement dependencies
  }
}
