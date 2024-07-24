import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/help&support/helpmanual_4/model/helpmanual_4_model.dart';
import 'package:incentivesgit/presentation/help&support/helpmanual_4/service/helpmanual_4_service.dart';

class HelpandSupportHelpManual4Controller extends GetxController {
  var helpManualResponse = Rx<ApiResponse?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchHelpUserManualList();

    getArguments();
  }

  var topicname = ''.obs;

  void getArguments() {
    final arguments = Get.arguments as Map<String, dynamic>;
    topicname.value = arguments['topictext'];
  }

  void fetchHelpUserManualList() async {
    try {
      var response = await HelpUserMAnualListService().usermodule();
      if (response != null) {
        helpManualResponse.value = response;
        print('helpManualResponse.value: ${helpManualResponse.value}');
      }
    } catch (e) {
      print("Failed to fetch helpusermanual list: $e");
    }
  }
}
