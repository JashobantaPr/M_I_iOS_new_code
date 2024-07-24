import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeF_screens/earnedpoints_viewdetails/controller/earnedpoints_viewdetails_controller.dart';

class EarnedPointsViewDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EarnedPointsViewDetailsController());
  }
}
