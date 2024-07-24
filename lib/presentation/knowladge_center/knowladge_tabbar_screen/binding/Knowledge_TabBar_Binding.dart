import 'package:incentivesgit/core/app_export.dart';

import '../../../certificate_screens/certificate_Tabbar/controller/buzzeTabBar_Controller.dart';
import '../controller/Knowledge_tabbar_Controller.dart';

class KnowledgeTabbarScreensBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => KnowledgeTabBarController());
   Get.lazyPut(()=>CertificateTabBarController());
  }
}
