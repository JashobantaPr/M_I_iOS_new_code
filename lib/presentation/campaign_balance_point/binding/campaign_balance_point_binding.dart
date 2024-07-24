import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/campaign_balance_point/controller/campaign_balance_point_controller.dart';

class CampaignBalancePointsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CampaignBalancePointsController());
  }
  
}