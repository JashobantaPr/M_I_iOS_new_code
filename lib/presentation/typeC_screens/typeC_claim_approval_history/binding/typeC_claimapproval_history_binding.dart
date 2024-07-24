import 'package:get/get_core/src/get_main.dart';
import 'package:incentivesgit/core/app_export.dart';

import '../controller/typeC_claimapproval_history_controller.dart';


class ClaimApprovalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClaimApprovalController());
  }
}
