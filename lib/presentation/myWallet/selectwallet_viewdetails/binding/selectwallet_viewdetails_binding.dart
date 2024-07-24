import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myWallet/selectwallet_viewdetails/controller/selectwallet_viewdetails_controller.dart';

class SelectWalletViewDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectWalletViewDetailsController());
  }
}
