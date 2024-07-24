import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/type_A_directawardingofpoints/service/typeA_service.dart';

import '../../type_A_directawardingofpoints/controller/directawardingofpoint_controller.dart';
import '../../type_A_directawardingofpoints/model/leaderBoardModel.dart';

class LeaderBoardController extends GetxController {
  var leaderBoardResponse = Data(
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
      var response = await TypeAservices().fetchLeaderBoardData();
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
