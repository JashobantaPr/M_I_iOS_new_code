import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/rewards/bank_transfer_flexi2/controller/bank_transfer_flexi2_controller.dart';

class BankTransferFlexi2Binding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => BankTransferFlexi2Controller());
  }
}
