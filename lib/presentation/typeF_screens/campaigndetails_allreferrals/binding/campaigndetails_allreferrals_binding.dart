import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeF_screens/campaigndetails_allreferrals/controller/campaigndetails_allreferrals_controller.dart';

class CampaignDetailsAllreferralsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CampaignDetailsAllReferralsController());
  }
}
