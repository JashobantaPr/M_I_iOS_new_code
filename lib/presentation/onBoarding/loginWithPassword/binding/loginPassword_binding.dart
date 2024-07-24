import 'package:get/get.dart';

import '../controller/loginPassword_controller.dart';

class LoginPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PasswordLoginController());
  }
}
