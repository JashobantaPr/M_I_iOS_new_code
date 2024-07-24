import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/campaigndetailstargetmeter3tails/controller/campaigndetailstargetmeter3tailscontroller.dart';

class CampaignDetailsTargetMeter3trialsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CampaignDetailsTargetMeter3trialsController());
  }
  
}