import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_8/model/certificate_8_model.dart';

class Certificate8Controller extends GetxController {
  late CertificateResponse _certificateResponse;

  CertificateResponse get certificateResponse => _certificateResponse;

  @override
  void onInit() {
    super.onInit();
    // Initialize the certificate response here using whatever method you have
    // For example:
    _certificateResponse =
        fetchCertificateResponse(); // This should fetch your CertificateResponse
  }

  // Method to fetch the certificate response, you may need to adjust this based on your implementation
  CertificateResponse fetchCertificateResponse() {
    // Your code to fetch the certificate response
    return CertificateResponse(
      logoSignUrl: "https://example.com/logo.png",
      backImgUrl: "https://example.com/backImg.png",
      signNameImgUrl: "https://example.com/signNameImg.png",
      dateImgUrl: "https://example.com/dateImg.png",
      overlayImgUrl: "https://example.com/overlayImg.png",
      allCertificates: [], // Provide the list of certificates here
      certificateAwardStatus: true,
    );
  }
}
