import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/model/campaignmodel.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/service/campaignservice.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/campaigndetailstargetmeter/model/calculatedpointsmodel.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/campaigndetailstargetmeter/model/programdetailsmodel.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/campaigndetailstargetmeter/service/typeDservice.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/myperformancetargetmeter/model/myperformancetargetmetermodel.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/myperformancetargetmeter/service/myperformanceservice.dart';

class CampaignDetailsTargetMeterController extends GetxController {
  final progress = 0.5.obs;
  var points = Pointscount().obs;
  var calculatedpoints = Employee().obs;
  var terminologytext = ''.obs;
  var leaderBoardResponse = UserData(
    users: {},
    userIds: [],
    programDetails: [],
    programOwners: [],
    programCoOwners: [],
    //  allRank: {},
  ).obs;
  var isLoading = true.obs;
  var kpiList = <KPI>[].obs;

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

  void fetchcalculatedPoints(String programCode) async {
    try {
      var fetchedPoints = await TypeDService().calculatedpoints(programCode);
      if (fetchedPoints != null) {
        calculatedpoints.value = fetchedPoints;
      } else {
        print("Failed to fetch points");
      }
    } catch (e) {
      print("Failed to fetch points: $e");
    }
  }

  void fetchProgramDetails() async {
    try {
      var fetchedCampaigns = await TypeDService().programDetails();
      if (fetchedCampaigns != null) {
        leaderBoardResponse.value = fetchedCampaigns;
        String programCode =
            fetchedCampaigns.programDetails![0].programCode ?? '';
        fetchcalculatedPoints(programCode);
      }
    } catch (e) {
      print("Failed to fetch campaigns: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void terminlogytext() async {
    try {
      var terminology = await Campaignservices().programterminologytext();
      if (terminology != null) {
        terminologytext.value = terminology;
      }
    } catch (e) {
      print("Failed to fetch Text: $e");
    }
  }

  @override
  void onInit() {
    terminlogytext();
    fetchProgramDetails();
    fetchPoints();
    fetchMyPerformance();
    super.onInit();
  }

  int parsePoints(String? pointsStr) {
    if (pointsStr == null) {
      return 0;
    }
    return int.tryParse(pointsStr) ?? 0;
  }

  void fetchMyPerformance() async {
    isLoading(true);
    try {
      var fetchedKPIs = await MyPerformanceService().myPerformance();
      kpiList.assignAll(fetchedKPIs);
    } catch (e) {
      print('Failed to fetch campaigns: $e');
    } finally {
      isLoading(false);
    }
  }
}
