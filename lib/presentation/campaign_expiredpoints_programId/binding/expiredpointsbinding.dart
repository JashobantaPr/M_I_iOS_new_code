import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/campaign_expiredpoints_programId/controller/expiredpoints.dart';

class CampaignExpiredPointsBinding1 extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CampaignExpiredPointsController1());
  }
}
