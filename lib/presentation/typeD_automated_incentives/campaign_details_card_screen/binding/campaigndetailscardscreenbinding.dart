import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/campaign_details_card_screen/controller/campaigndetailscardscreencontroller.dart';

class CampaignDetailsCardBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => CampaignDetailsCardController());
  }
  
}