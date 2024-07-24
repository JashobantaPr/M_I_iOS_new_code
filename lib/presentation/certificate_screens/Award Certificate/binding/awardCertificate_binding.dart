import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzz_9/controller/buzz_9_controller.dart';
import 'package:incentivesgit/presentation/certificate_screens/Award%20Certificate/controller/awardCertificate_controller.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_7/controller/certificate_7_controller.dart';

class AwardCertificateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AwardCertificateController());
    Get.lazyPut(() => Certificate7Controller());
  }
}
