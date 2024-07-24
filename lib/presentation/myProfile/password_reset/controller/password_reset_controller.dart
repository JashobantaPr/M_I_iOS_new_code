import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incentivesgit/presentation/myProfile/password_reset/service/password_reset_service.dart';
import 'package:incentivesgit/routes/app_routes.dart';

class PasswordResetController extends GetxController {
  final currentPassword = false.obs;
  final newPasswordVisible = false.obs;
  final retypenewPassword = false.obs;

  TextEditingController oldPasswordcontroller = TextEditingController();
  TextEditingController newPasswordcontroller = TextEditingController();
  TextEditingController confirmPasswordcontroller = TextEditingController();

  void togglePasswordVisibility() {
    currentPassword.toggle();
  }

  void toggleNewPasswordVisibility() {
    newPasswordVisible.toggle();
  }

  void toggleReTypeNewPasswordVisibility() {
    retypenewPassword.toggle();
  }

  Future<void> changePassword() async {
    String oldpass = oldPasswordcontroller.text;
    String newpass = newPasswordcontroller.text;
    String confirmpass = confirmPasswordcontroller.text;
    bool? data = await ResetPasswordService()
        .passwordReset(oldpass, newpass, confirmpass);
    if (data == true) {
      // Navigate to login screen
      Get.offNamedUntil(AppRoutes.loginScreen, (route) => false);
    } else {
      Get.snackbar('Error', 'Failed to change password');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    oldPasswordcontroller.clear();
    newPasswordcontroller.clear();
    confirmPasswordcontroller.clear();
    super.dispose();
  }
}
