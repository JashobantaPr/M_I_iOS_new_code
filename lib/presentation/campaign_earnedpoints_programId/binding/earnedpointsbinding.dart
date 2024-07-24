import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/campaign_earnedpoints_programId/controller/earnedpoints.dart';

class CampaignEarnedPointsBinding1 extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CampaignEarnedPointsController1());
  }
}
