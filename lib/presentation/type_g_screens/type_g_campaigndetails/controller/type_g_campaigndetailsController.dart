import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/controller/campaigncontroller.dart';
import 'package:incentivesgit/presentation/typeC_screens/Type_c_totalinvoiceregression2/model/Type_c_totalinvoiceModel.dart';
import 'package:incentivesgit/presentation/typeC_screens/Type_c_totalinvoiceregression2/model/pointsModel.dart';
import 'package:incentivesgit/presentation/typeC_screens/Type_c_totalinvoiceregression2/service/Type_C_TotalInvoiceService.dart';
import 'package:incentivesgit/presentation/typeC_screens/claim_approval_based_awarding_of_points_claim_management/service/add_clime_service.dart';

class TypeGCampaignDetailsController extends GetxController {
  var currentIndex = 0.obs;
  var claimType = ''.obs;
  final isVisible = false.obs;
  var points = Pointscount().obs;
  var terminologytext = ''.obs;
  final controllpoints = Get.find<CampaingController>();

  var leaderBoardResponse = Data(
    users: {},
    userIds: [],
    programDetails: [],
    programOwners: [],
    programCoOwners: [],
    allRank: {},
  ).obs;

  @override
  void onInit() {
    super.onInit();
    fetchLeaderBoard();
    fetchPoints();
    claimtype();
  }

  void fetchPoints() async {
    try {
      var fetchedPoints = await TypeCTotalInvoicewservices().totalpointss();
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
      var response = await TypeCTotalInvoicewservices().fetchLeaderBoardData();
      if (response != null) {
        leaderBoardResponse.value = response;
      } else {
        print('No data available');
      }
    } catch (e) {
      print('Error fetching leaderboard data: $e');
    }
  }

  void claimtype() async {
    var claimdetails = await AddclaimforApproval().fetchClaimType();
    print('claimtypevalue $claimdetails');
    if (claimdetails != null) {
      claimType.value = claimdetails;
    }
  }
}
