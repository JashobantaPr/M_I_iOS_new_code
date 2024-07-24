import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/campaign_earned_points/controller/earnedpoints.dart';

class CampaignEarnedPointsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CampaignEarnedePointsController());
  }
  
}