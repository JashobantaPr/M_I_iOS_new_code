import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/type_B_leaderboard/model/leaderboardtypeb_model.dart';
import 'package:incentivesgit/presentation/type_B_leaderboard/service/leaderboardtypeb_service.dart';

class Quizzes10Controller extends GetxController {
  var leaderBoardResponse = LeaderData(
    users: {},
    userIds: [],
    programDetails: [],
    programOwners: [],
    programCoOwners: [],
    allRank: {},
  ).obs;

  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchLeaderBoard();
  }

  void fetchLeaderBoard() async {
    try {
      var response = await TypeBLeaderBoard().fetchLeaderBoardData();
      if (response != null) {
        // Print details of programDetails to verify
        response?.programDetails?.forEach((detail) {
          print('Program Name: ${detail.name}');
          print('Program ID: ${detail.programId}');
          // Add more details as needed
        });

        // Update the observable with the fetched response
        leaderBoardResponse.value = response;
      } else {
        print('No data available');
      }
    } catch (e) {
      print('Error fetching leaderboard data: $e');
    }
  }


  List<String>? get filteredUserIds {
    if (searchQuery.value.isEmpty) {
      return leaderBoardResponse.value.userIds;
    } else {
      return leaderBoardResponse.value.userIds!.where((userId) {
        final user = leaderBoardResponse.value.users![userId];
        final fullName = '${user?.firstName} ${user?.lastName}'.toLowerCase();
        return fullName.contains(searchQuery.value.toLowerCase());
      }).toList();
    }
  }
}
