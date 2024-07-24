import 'package:flutter/material.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeC_screens/Type_C_rejectclaim/service/rejectservice.dart';
import 'package:incentivesgit/widgets/customalert.dart';

class RejectClaimController extends GetxController {
  final RejectClaimService _rejectClaimService = RejectClaimService();

  Future<void> rejectClaim(String? climid) async {
    bool success = await _rejectClaimService.rejectClaim(climid);
    if (success) {
      Get.back(); // Close the dialog
      Get.toNamed('/typectotalinvoiceregression'); // Navigate to the new screen
      showDialog(
        context: Get.context!,
        builder: (BuildContext context) {
          return const SuccessDialogScreen();
        },
      );
    } else {
      Get.snackbar('Error', 'Failed to discard the claim request.');
    }
  }
}
