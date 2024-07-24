import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/certificate_screens/My%20achievement/service/buzzSummary_service.dart';

class MyAchievementController extends GetxController {
  final count = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchLeaderBoardData();
  }

  void fetchLeaderBoardData() async {
    try {
      final leaderData = await BuzzSummaryService().fetchLeaderBoardData();
      count.value = leaderData!.count;
    } catch (e) {
      print('Error fetching leaderboard data: $e');
      // Handle error if needed
    }
  }
}
