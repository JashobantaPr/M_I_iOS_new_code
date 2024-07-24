import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/campaign_redeemed_point/controller/campaign_redeemed_point_controller.dart';

class CampaignRedeemedPointsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CampaignRedeemedPointsController());
  }
}
