import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/product_referrel/redeemcode/controller/redeemcode_controller.dart';

class RedeemcodeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => RedeemCodeController());
  }
}
