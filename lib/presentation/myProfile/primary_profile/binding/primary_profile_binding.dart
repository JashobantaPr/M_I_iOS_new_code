import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myProfile/primary_profile/controller/primary_profile_controller.dart';

class PrimaryProfileBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => PrimaryProfileController());
  }
}
