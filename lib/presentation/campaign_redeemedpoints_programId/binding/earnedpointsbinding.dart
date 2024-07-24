import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/campaign_redeemedpoints_programId/controller/earnedpoints.dart';

class CampaignRedeemedPointsBinding1 extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CampaignRedemeedePointsController1());
  }
}
