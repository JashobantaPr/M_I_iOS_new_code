import 'package:incentivesgit/core/app_export.dart';

import '../controller/view_profile_controller.dart';

class ViewProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewProfileController());
  }
}
