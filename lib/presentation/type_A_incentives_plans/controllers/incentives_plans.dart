import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/type_A_view_details/model/typeAviewDetailsmodel.dart';
import 'package:incentivesgit/presentation/type_A_view_details/service/typeAviewdetailsservice.dart';

class IncentivesPlansControlller extends GetxController {
  var achievements = TargetUserDetail().obs;
  void fetchAcheivements() async {
    try {
      var fetchedAchievements =
          await ViewDetailsForAchievement().viewdetailsforachievement();
      print('fetchedAchievements$fetchedAchievements');
      if (fetchedAchievements != null) {
        achievements.value = fetchedAchievements;
      }
    } catch (e) {
      print("Failed to fetch points: $e");
    }
  }

  @override
  void onInit() {
    fetchAcheivements();
    super.onInit();
  }
}
