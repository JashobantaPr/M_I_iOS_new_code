import 'package:incentivesgit/core/app_export.dart';

import '../../certificate_Tabbar/controller/buzzeTabBar_Controller.dart';
import '../controller/get_all_certificate_controller.dart';

class GetAllCertificateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetAllCertificateController());
    Get.lazyPut(() => CertificateTabBarController());
   
  }
}
