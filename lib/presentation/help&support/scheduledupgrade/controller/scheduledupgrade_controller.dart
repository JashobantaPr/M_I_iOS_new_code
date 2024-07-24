import 'package:incentivesgit/core/app_export.dart';
import '../service/scheduledupgrade_service.dart';
import '../model/scheduledupgrade_model.dart';

class HelpandSupportScheduledUpgradeController extends GetxController {
  Rx<ScheduledUpgrade?> scheduledUpgrade = Rx<ScheduledUpgrade?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchScheduledUpgrade();
  }

  void fetchScheduledUpgrade() async {
    try {
      var response = await ScheduledUpgradeService().scheduled();
      if (response != null) {
        scheduledUpgrade.value = response;
      }
    } catch (e) {
      print("Failed to fetch scheduled upgrade: $e");
    }
  }
}
