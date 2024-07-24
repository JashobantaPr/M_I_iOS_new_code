import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbar {
  void openSnackbar(String type, String message) {
    Get.snackbar(type, message,
        snackPosition: SnackPosition.TOP,
        forwardAnimationCurve: Curves.elasticInOut,
        reverseAnimationCurve: Curves.easeOut,
        colorText: Colors.black,
        backgroundColor: Colors.white.withOpacity(0.8),
        messageText: Text(
          message,
          style:const TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.black
          ),
        ));
  }
}
