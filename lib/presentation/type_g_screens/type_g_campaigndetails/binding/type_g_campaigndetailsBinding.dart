import 'package:get/get.dart';
import 'package:incentivesgit/presentation/type_g_screens/type_g_campaigndetails/controller/type_g_campaigndetailsController.dart';

class TypeGCampaignDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TypeGCampaignDetailsController());
  }
}
  