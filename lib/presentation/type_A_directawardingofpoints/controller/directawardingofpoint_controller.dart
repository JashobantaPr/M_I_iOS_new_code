import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/campaign_earned_point_viewdetails_screen/controller/campaign_earned_point_viewdetails_controller.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/controller/campaigncontroller.dart';
import 'package:incentivesgit/presentation/type_A_directawardingofpoints/model/leaderBoardModel.dart';
import 'package:incentivesgit/presentation/type_A_directawardingofpoints/model/points_model.dart';
import 'package:incentivesgit/presentation/type_A_directawardingofpoints/service/typeA_service.dart';
import 'package:incentivesgit/presentation/type_A_view_details/controller/view_details_controller.dart';

import '../../homebottombar/campaignscreen/service/campaignservice.dart';

class DirectAwardingOfPointsController extends GetxController {
  final controllpoints = Get.find<CampaingController>();
  final controll = Get.find<ViewDetailsForAchivementsController>();
  var terminologytext = ''.obs;
  var points = Pointscounts().obs;

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
  }

  void fetchPoints() async {
    try {
      var fetchedPoints = await TypeAservices().totalpointss();
      if (fetchedPoints != null) {
        points.value = fetchedPoints;
      }
      print('dfdffgsdg${points.value.earnedpoints}');
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

  // int parsePoints(String? pointsStr) {
  //   if (pointsStr == null) {
  //     return 0;
  //   }
  //   return int.tryParse(pointsStr) ?? 0;
  // }

  void terminlogytext() async {
    try {
      var terminology = await Campaignservices().programterminologytext();
      if (terminology != null) {
        terminologytext.value = terminology;
      }
    } catch (e) {
      print("Failed to fetch campaigns: $e");
    }
  }
}
