import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/rewards/banktransfer/controller/bank_transfer_controller.dart';

class BankTransferBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => BankTransferController());
  }
}
