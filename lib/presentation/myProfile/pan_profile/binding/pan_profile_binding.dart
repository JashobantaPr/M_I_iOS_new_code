import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myProfile/pan_profile/controller/pan_profile_controller.dart';

class PanProfileBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => PanProfileController());
  }
}
