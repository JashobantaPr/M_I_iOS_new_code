import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/rewards/rewards-landing/controller/reward-landing_controller.dart';

class RewardsBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => RewardsController());
  }
}
