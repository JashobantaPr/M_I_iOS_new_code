import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myProfile/my_tds_certificate/model/tds_data_model.dart';
import 'package:incentivesgit/presentation/myProfile/my_tds_certificate/service/tds_certificate_service.dart';

class MyTdsCertificateController extends GetxController {
  var tdsCertificates = <TDSCertificate>[].obs;
  void tdsData() async {
    List<TDSCertificate>? response =
        await TDSCertificateService().tdsCertificate();

    if (response != null) {
      tdsCertificates.value = response;
    } else {
      print('No TDS certificates available.');
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    tdsData();
    super.onInit();
  }
}
