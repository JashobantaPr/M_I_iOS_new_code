import 'package:get/get.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzzes_tabbar_leaderboard/model/leaderboaerd_model.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzzes_tabbar_leaderboard/service/leaderboard_service.dart';

class BuzzesTabbarLeaderBoardController extends GetxController {
  var leaderBoardResponse = ApiResponse(
      byMe: '', forMe: '', allRank: {}, userIds: '', rank: '', users: {}).obs;

  @override
  void onInit() {
    super.onInit();
    fetchLeaderBoard();
  }

  void fetchLeaderBoard() async {
    print('leaderboardbuzzvvvvvv');

    try {
      var response = await BuzzLeaderService().fetchLeaderBoardData();
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
