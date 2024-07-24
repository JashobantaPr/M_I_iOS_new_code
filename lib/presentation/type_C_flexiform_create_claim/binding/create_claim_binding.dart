import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/type_C_flexiform_create_claim/controller/create_claim_controller.dart';

class TypeCCreateClaimFlexiformBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateClaimFlexiFormController());
  }
}
