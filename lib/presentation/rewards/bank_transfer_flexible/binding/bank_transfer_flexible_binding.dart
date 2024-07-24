import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/rewards/bank_transfer_flexible/controller/bank_transfer_flexible_controller.dart';

class BankTransferFlexiBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => BankTransferFlexiController());
  }
}
