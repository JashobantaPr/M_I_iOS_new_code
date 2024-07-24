import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myProfile/email_preference/model/email_preferences_model.dart';
import 'package:incentivesgit/presentation/myProfile/email_preference/service/email_preserence_service.dart';

class EmailPreferenceController extends GetxController {
  var userProfile = EmailPreference().obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    allEmails();
    super.onInit();
  }

  void allEmails() async {
    isLoading.value = true;
    try {
      EmailPreference? emailData = await EmailPreferenceService().emailData();
      if (emailData != null) {
        isLoading.value = false;
        userProfile.value = emailData;
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
