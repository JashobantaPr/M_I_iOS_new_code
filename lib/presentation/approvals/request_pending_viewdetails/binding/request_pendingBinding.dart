import 'package:get/get.dart';
import 'package:incentivesgit/presentation/Approvals/request_pending_viewdetails/controller/request_pendingController.dart';
import 'package:incentivesgit/presentation/typeC_screens/Type_C_rejectclaim/controller/rejectclaimcontroller.dart';

class RequestPendingViewDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RequestPendingViewDetailsController());
    Get.lazyPut(() => RejectClaimController());
  }
}
