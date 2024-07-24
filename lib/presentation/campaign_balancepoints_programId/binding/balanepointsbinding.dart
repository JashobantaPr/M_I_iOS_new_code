import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/campaign_balancepoints_programId/controller/balancepoints.dart';

class CampaignBalancePointsBinding1 extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BalancePointsController());
  }
}
