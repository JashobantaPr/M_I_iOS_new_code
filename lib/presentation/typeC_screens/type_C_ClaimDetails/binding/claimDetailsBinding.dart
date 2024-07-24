import 'package:get/get.dart';
import 'package:incentivesgit/presentation/typeC_screens/Type_C_rejectclaim/controller/rejectclaimcontroller.dart';
import 'package:incentivesgit/presentation/typeC_screens/type_C_ClaimDetails/controller/claimDetailsController.dart';

class TypeCClaimDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClaimController());
    Get.lazyPut(() => RejectClaimController());
  }
}
