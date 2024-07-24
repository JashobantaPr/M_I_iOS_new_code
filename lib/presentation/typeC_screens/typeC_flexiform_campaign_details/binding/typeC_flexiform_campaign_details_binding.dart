import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_flexiform_campaign_details/controller/typeC_flexiform_campaign_details_controller.dart';


class TypeCCampaignDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TypeCCampaignDetailsController());
  }
}
