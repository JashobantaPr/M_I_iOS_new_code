import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_Tabbar/controller/buzzeTabBar_Controller.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_leaderboard/controller/certficateLeader_controller.dart';
import 'package:incentivesgit/presentation/certificate_screens/get_all_certificate_screen/controller/get_all_certificate_controller.dart';

class CertificateTabBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CertificateTabBarController());
    Get.lazyPut(() => GetAllCertificateController());
    Get.lazyPut(() => CertificateLeaderBoardController());
  }
}
