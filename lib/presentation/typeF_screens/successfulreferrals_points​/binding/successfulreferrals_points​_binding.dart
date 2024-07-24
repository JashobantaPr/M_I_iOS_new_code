import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeF_screens/successfulreferrals_points%E2%80%8B/controller/successfulreferrals_points%E2%80%8B_controller.dart';

class SuccessfulReferralsPointsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SuccessfulReferralsPointsController());
  }
}
