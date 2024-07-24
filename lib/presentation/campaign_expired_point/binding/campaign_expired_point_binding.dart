import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/campaign_expired_point/controller/campaign_expired_point_controller.dart';

class CampaignExpiredPointsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CampaignExpiredPointsController());
  }
  
}