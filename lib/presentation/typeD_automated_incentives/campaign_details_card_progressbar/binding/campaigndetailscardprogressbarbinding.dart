import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/campaign_details_card_progressbar/controller/campaigndetailscardscreenprogressbarcontroller.dart';

class CampaignDetailsCardProgressBarBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => CampaignDetailsCardProgressbarController());
  }
  
}