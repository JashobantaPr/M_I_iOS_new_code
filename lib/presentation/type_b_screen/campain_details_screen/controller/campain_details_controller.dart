import 'package:incentivesgit/presentation/homebottombar/campaignscreen/model/campaignmodel.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/service/campaignservice.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/campaigndetailstargetmeter/service/typeDservice.dart';

import '../../../../core/app_export.dart';
import '../models/leaderboard_model.dart';
import '../service/campain_details_service.dart';

class CampainDetailsController extends GetxController {
  var terminologytext = ''.obs;
  var points = Pointscount().obs;

  var leaderBoardResponse = LeaderData(
    users: {},
    userIds: [],
    programDetails: [],
    programOwners: [],
    programCoOwners: [],
    allRank: {},
    programReportOwners: [],
  ).obs;

  @override
  void onInit() {
    super.onInit();
    fetchPoints();
    fetchLeaderBoard();
    terminlogytext();
  }

  int parsePoints(String? pointsStr) {
    if (pointsStr == null) {
      return 0;
    }
    return int.tryParse(pointsStr) ?? 0;
  }

  void fetchLeaderBoard() async {
    try {
      var response = await TypeBCampaignService().fetchLeaderBoardData();
      if (response != null) {
        // Print details of programDetails to verify
        response.programDetails?.forEach((detail) {
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

  void terminlogytext() async {
    try {
      var terminology = await Campaignservices().programterminologytext();
      print('terminologydfdd$terminology');
      if (terminology != null) {
        terminologytext.value = terminology;
      }
    } catch (e) {
      print("Failed to fetch campaigns: $e");
    }
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
}
