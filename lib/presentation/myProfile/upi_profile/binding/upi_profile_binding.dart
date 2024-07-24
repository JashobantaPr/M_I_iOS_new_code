import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myProfile/upi_profile/controller/upi_profile_controller.dart';

class UpiProfileBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => UpiProfileController());
  }
}
