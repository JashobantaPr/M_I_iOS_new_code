import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/campaign_calculatedpoints_programId/controller/earnedpoints.dart';

class CampaignCalculatedPointsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CampaignCalculatedPointsController1());
  }
}
