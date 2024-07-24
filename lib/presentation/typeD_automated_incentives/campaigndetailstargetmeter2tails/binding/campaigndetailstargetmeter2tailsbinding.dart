import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/campaigndetailstargetmeter2tails/controller/campaigndetailstargetmeter2tailscontroller.dart';

class CampaignDetailsTargetMeter2taillsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CampaignDetailsTargetMeter2tailsController());
  }
  
}