import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/controller/campaigncontroller.dart';
import 'package:incentivesgit/presentation/typeC_screens/Type_c_totalinvoiceregression2/model/pointsModel.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_KpiSku_regression/model/typeC_KpiSku_regression_model.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_KpiSku_regression/service/typeC_KpiSku_regression_service.dart';

class TypeCKpiSkuRegressionController extends GetxController {
  var currentIndex = 0.obs;
  final isVisible = false.obs;
  var points = Pointscount().obs;
  var terminologytext = ''.obs;
  final controllpoints = Get.find<CampaingController>();

  var leaderBoardResponse = LeaderData(
    users: {},
    userIds: [],
    programDetails: [],
    programOwners: [],
    programCoOwners: [],
    //allRank: [],
  ).obs;

  @override
  void onInit() {
    super.onInit();
    fetchLeaderBoard();
    fetchPoints();
  }

  void fetchPoints() async {
    try {
      var fetchedPoints = await TypeCKpiSkuRegressionServices().totalpointss();
      if (fetchedPoints != null) {
        points.value = fetchedPoints;
      }
    } catch (e) {
      print("Failed to fetch points: $e");
    }
  }

  int parsePoints(String? pointsStr) {
    if (pointsStr == null) {
      return 0;
    }
    return int.tryParse(pointsStr) ?? 0;
  }

  void fetchLeaderBoard() async {
    try {
      var response =
          await TypeCKpiSkuRegressionServices().fetchLeaderBoardData();
      if (response != null) {
        leaderBoardResponse.value = response;
      } else {
        print('No data available');
      }
    } catch (e) {
      print('Error fetching leaderboard data: $e');
    }
  }
}
