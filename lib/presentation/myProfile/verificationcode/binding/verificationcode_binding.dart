import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myProfile/verificationcode/controller/verificationcode_controller.dart';

class VerificationCodeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => VerificationCodeController());
  }
}
