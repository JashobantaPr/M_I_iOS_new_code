import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/onBoarding/login_screen/controller/login_controller.dart';

import '../../new_user_screen/controller/new_user_controller.dart';
import '../controller/loginOtp_controller.dart';

class LoginOtpBinding extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut(() => LoginController());
    Get.lazyPut(() => LoginOtpController());
    Get.lazyPut(() => NewUserController());
  }
}
