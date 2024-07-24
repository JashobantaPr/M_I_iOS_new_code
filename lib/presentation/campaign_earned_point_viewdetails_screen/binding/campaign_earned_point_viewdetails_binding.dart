import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/campaign_earned_point_viewdetails_screen/controller/campaign_earned_point_viewdetails_controller.dart';

class ViewDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewDetailsController());
  }
}
