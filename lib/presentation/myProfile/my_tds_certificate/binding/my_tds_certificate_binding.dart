import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myProfile/my_tds_certificate/controller/my_tds_certificate_controller.dart';

class MyTdsCertificateBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => MyTdsCertificateController());
  }
}
