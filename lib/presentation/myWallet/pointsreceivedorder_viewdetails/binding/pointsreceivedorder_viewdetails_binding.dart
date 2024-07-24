import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myWallet/pointsreceivedorder_viewdetails/controller/pointsreceivedorder_viewdetails_controller.dart';

class PointsReceivedOrderViewDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PointsReceivedOrderViewDetailsController());
  }
}
