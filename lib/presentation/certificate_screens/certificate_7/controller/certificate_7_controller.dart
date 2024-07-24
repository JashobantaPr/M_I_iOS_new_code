import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_7/model/certificate_7_model.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_7/service/certificateService.dart';

class Certificate7Controller extends GetxController {
  var certificateResponse = CertificateResponse(
    logoSignUrl: '',
    backImgUrl: '',
    signNameImgUrl: '',
    dateImgUrl: '',
    overlayImgUrl: '',
    allCertificates: [],
    certificateAwardStatus: false,
  ).obs;

  var selectedCertificate = Rxn<Certificate>();

  @override
  void onInit() {
    super.onInit();
    fetchCertificates();
  }

  void fetchCertificates() async {
    ChooseCertificateService service = ChooseCertificateService();
    var response = await service.fetchCertificate();
    if (response != null) {
      certificateResponse.value = response;
    }
  }

  void selectCertificate(Certificate certificate) {
    selectedCertificate.value = certificate;
  }
}
