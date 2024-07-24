import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/rewards/supercheque/model/supercheque_model.dart';
import 'package:incentivesgit/presentation/rewards/supercheque/service/supercheque_service.dart';

class QRCodeDataController extends GetxController {
  var qrCode = Get.arguments;

  var responsemsg = SuperChequeStatus(status: '', data: '', msg: '').obs;

  void superCheque() async {
    SuperChequeStatus? message = await SuperChequeService().superCheque(qrCode);

    if (message != null) {
      responsemsg.value = message;
    } else {
      responsemsg.value = SuperChequeStatus(status: '', data: '', msg: '');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    print('kdjfg ${qrCode}');
    super.onInit();
  }
}
