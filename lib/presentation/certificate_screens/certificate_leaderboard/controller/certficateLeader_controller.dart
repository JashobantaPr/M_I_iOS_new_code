import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_Tabbar/controller/buzzeTabBar_Controller.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_leaderboard/model/certificateleader_Model.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_leaderboard/service/certificateLeader_Service.dart';

class CertificateLeaderBoardController extends GetxController {
  final CertificateTabBarController scopeController =
      Get.find<CertificateTabBarController>();
  var certificateResponse = ApiResponse(
    userdata: {},
    taggedUserdata: {},
    status: false,
    certificatesList: [],
  ).obs;

  @override
  void onInit() {
    super.onInit();
    fetchCertificateLeaderBoard();
    print('trendingworking');
  }

  void fetchCertificateLeaderBoard() async {
    String? scopeID = scopeController.selectedScopeid.value;

    print('scopeidzx$scopeID');
    try {
      var response =
          await CertificateLeaderService().fetchCertificateLeaderBoard(scopeID);
      if (response != null) {
        certificateResponse.value = response;
      } else {
        print('No data available');
        // Handle null response here, e.g., show an error message to the user
      }
    } catch (e) {
      print('Error fetching leaderboard data: $e');
      // Handle error here, e.g., show an error message to the user
    }
  }
}
