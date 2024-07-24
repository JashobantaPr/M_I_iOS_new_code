import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:incentivesgit/presentation/rewards/rewards_superchequescredit/controller/rewards_superchequescredit_controller.dart';

class RewardsSuperchequesCreditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RewardsSuperchequesCreditController
    );
  }
}
