import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/rewards/cash_payout/controller/cash_payout_controller.dart';

class CashPayoutBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CashPayoutController());
  }
}
