import 'package:incentivesgit/core/app_export.dart';

import '../model/helpmanual_1_model.dart';
import '../service/helpmanual_1_service.dart';

class HelpandSupportHelpManual1Controller extends GetxController {
  var helpusermanualList = <HelpUserManualResponse>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchhelpusermanualList();
  }

  void fetchhelpusermanualList() async {
    try {
      var response = await HelpUserMAnualListService().usermodule();
      helpusermanualList.assignAll(response);
    } catch (e) {
      print("Failed to fetch helpusermanual list: $e");
    }
  }

  // List<String>? get filteredUserIds {
  //   if (searchQuery.value.isEmpty) {
  //     return leaderBoardResponse.value.userIds;
  //   } else {
  //     return leaderBoardResponse.value.userIds!.where((userId) {
  //       final user = leaderBoardResponse.value.users![userId];
  //       final fullName = '${user?.firstName} ${user?.lastName}'.toLowerCase();
  //       return fullName.contains(searchQuery.value.toLowerCase());
  //     }).toList();
  //   }
  // }
}
