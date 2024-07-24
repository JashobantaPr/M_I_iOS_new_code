import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/model/campaignmodel.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/campaigndetailstargetmeter/service/typeDservice.dart';

class TypeCCampaignDetailsController extends GetxController {
  var currentIndex = 0.obs;
  final isVisible = false.obs;
  var points = Pointscount().obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  void _buildInfoToggle() {
    isVisible.toggle();
  }

  int parsePoints(String? pointsStr) {
    if (pointsStr == null) {
      return 0;
    }
    return int.tryParse(pointsStr) ?? 0;
  }

  void fetchPoints() async {
    try {
      var fetchedPoints = await TypeDService().totalpoints();
      if (fetchedPoints != null) {
        points.value = fetchedPoints;
      } else {
        print("Failed to fetch points");
      }
    } catch (e) {
      print("Failed to fetch points: $e");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchPoints();
    super.onInit();
  }
}
