import 'package:get/get.dart';
import 'package:incentivesgit/presentation/homebottombar/engagement/model/engagementmodel.dart';
import 'package:incentivesgit/presentation/homebottombar/engagement/service/engagementservice.dart';

class EngagementController extends GetxController {
  var engagementList = <EngagementModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchEngagementList();
  }

  void fetchEngagementList() async {
    try {
      var response = await EngagementService().engagement();
      engagementList.assignAll(response);
    } catch (e) {
      print("Failed to fetch engagement list: $e");
    }
  }
}
