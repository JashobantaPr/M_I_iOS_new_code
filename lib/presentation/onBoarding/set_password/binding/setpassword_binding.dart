import 'package:incentivesgit/core/app_export.dart';

import '../controller/set_password_controller.dart';

class SetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SetPasswordController());
  }
}
