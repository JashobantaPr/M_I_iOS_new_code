import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_leaderboard/controller/certficateLeader_controller.dart';

class CertificateLeaderBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CertificateLeaderBoardController());
  }
}
