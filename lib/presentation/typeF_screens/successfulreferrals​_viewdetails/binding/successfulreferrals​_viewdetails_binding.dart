import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeF_screens/successfulreferrals%E2%80%8B_viewdetails/controller/successfulreferrals%E2%80%8B_viewdetails_controller.dart';

class SuccessfulReferralsViewDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SuccessfulReferralsViewDetailsController());
  }
}
