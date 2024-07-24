import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incentivesgit/presentation/rewards/supercheque/model/supercheque_model.dart';
import 'package:incentivesgit/presentation/rewards/supercheque/service/supercheque_service.dart';

class SuperchequeController extends GetxController {
  TextEditingController superchequecontroller = TextEditingController();
  var responsemsg = SuperChequeStatus(status: '', data: '', msg: '').obs;
  var errormsg = ''.obs;

  void superCheque() async {
    SuperChequeStatus? message =
        await SuperChequeService().superCheque(superchequecontroller.text);

    if (message != null) {
      responsemsg.value = message;
      if (message.status != 'success') {
        errormsg.value = message.msg;
      }
    } else {
      responsemsg.value = SuperChequeStatus(status: '', data: '', msg: '');
      errormsg.value = 'Unknown error occurred';
    }
  }

  void clearError() {
    errormsg.value = '';
  }

  @override
  void onInit() {
    super.onInit();
    superchequecontroller.addListener(clearError);
  }

  @override
  void onClose() {
    superchequecontroller.dispose();
    super.onClose();
  }
}
