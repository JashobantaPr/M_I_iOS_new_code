import 'package:get/get.dart';
import 'package:incentivesgit/presentation/typeC_screens/Type_C_rejectclaim/controller/rejectclaimcontroller.dart';

class RejectClaimBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RejectClaimController());
  }
}
