import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/campaigndetailstargetmeter/controller/campaigndetailstargetmetercontroller.dart';

class CampaignDetailsTargetMeterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CampaignDetailsTargetMeterController());
  }
  
}