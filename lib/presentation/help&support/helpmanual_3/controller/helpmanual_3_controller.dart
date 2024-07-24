import 'package:incentivesgit/core/app_export.dart';
import '../../helpmanual_1/model/helpmanual_1_model.dart';
import '../../helpmanual_1/service/helpmanual_1_service.dart';

class HelpandSupportHelpManual3Controller extends GetxController {
 
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


 
}
