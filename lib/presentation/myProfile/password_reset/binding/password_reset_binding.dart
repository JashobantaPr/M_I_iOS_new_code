import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myProfile/password_reset/controller/password_reset_controller.dart';

class PasswordResetBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PasswordResetController());
  }
  
}