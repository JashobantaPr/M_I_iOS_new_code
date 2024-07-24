import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/product_referrel/campaign_summary/controller/campaign_summary_controller.dart';

class CampaignSummaryBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => CampaignSummaryController());
  }
}
