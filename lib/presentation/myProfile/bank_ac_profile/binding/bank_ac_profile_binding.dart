import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myProfile/bank_ac_profile/controller/bank_ac_profile_controller..dart';

class BankAccountProfileBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => BankAccountProfileController());
  }
}
