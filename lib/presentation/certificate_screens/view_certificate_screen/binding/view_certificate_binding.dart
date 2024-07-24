import 'package:incentivesgit/core/app_export.dart';

import '../controller/view_certificate_controller.dart';



class ViewCertificateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewCertificateController());
  }
}
