import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/Approvals/incenitves%20approval/controller/incetive_controller.dart';

class IncentiveApprovalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IncentiveApprovalController());
  }
}
