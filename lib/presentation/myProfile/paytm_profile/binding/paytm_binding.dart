import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myProfile/paytm_profile/controller/paytm_profile_controller.dart';

class PaytmProfileBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => PaytmProfileController());
  }
}
