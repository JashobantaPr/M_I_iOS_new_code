import 'package:get/get.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/controller/campaigncontroller.dart';

class CampaignBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => CampaingController());
  }
  
}