import 'package:get/get.dart';
import 'package:incentivesgit/presentation/Approvals/campaign%20approval_1/controller/campaignapprovalcontroller.dart';

class CampaignApprovalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CampaignApprovalController());
  }
}
