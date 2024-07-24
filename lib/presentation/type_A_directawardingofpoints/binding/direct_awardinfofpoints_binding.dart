import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/controller/campaigncontroller.dart';
import 'package:incentivesgit/presentation/type_A_directawardingofpoints/controller/directawardingofpoint_controller.dart';
import 'package:incentivesgit/presentation/type_A_view_details/controller/view_details_controller.dart';

class DirectAwardingOfPointsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DirectAwardingOfPointsController());
    // Get.lazyPut(() => CampaingController());
    Get.lazyPut(() => ViewDetailsForAchivementsController());
  }
}
