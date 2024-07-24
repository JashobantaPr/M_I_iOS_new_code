import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/buzz_screens/Buzz_summary/service/buzzSummary_service.dart';

class BuzzeSummaryController extends GetxController {
  var leaderforme = ''.obs;
  var leaderbyme = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchLeaderBoard();
  }

  void fetchLeaderBoard() async {
    print('leaderboardbuzzvvvvvv');

    try {
      var response = await BuzzSummaryService().fetchLeaderBoardData();
      if (response != null) {
        leaderforme.value = response['by_me'];
        leaderbyme.value=response['for_me'];
      } else {
        print('No data available');
      }
    } catch (e) {
      print('Error fetching leaderboard data: $e');
    }
  }
}
