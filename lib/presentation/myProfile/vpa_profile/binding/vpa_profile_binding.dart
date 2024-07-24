import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myProfile/vpa_profile/controller/vpa_profile_controller.dart';

class VpaProfileBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => VpaProfileController());
  }
}
