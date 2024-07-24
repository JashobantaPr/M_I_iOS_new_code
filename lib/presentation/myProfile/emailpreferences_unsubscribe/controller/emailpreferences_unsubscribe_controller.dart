import 'package:get/get.dart';
import 'package:incentivesgit/presentation/myProfile/emailpreferences_unsubscribe/service/emailpreferences_unsubscribe_service.dart';
import 'package:incentivesgit/routes/app_routes.dart';

class EmailPreferencesUnsubscribeController extends GetxController {
  String _selectedValue = '';
  String emailcompanyid = Get.arguments['emailCompanyIdPk'];
  String emailuserid = Get.arguments['emailUserIdPk'];
  String cmsuserid = Get.arguments['cmsUserId'];
  String emailsenddate = Get.arguments['emailSendDate'];

  String get selectedValue => _selectedValue;

  void updateSelectedValue(String newValue) {
    _selectedValue = newValue;
    update();
  }

  void unSubscribe() async {
    String? response = await Unsubscribe().unSubscribe(
        emailcompanyid, emailuserid, cmsuserid, emailsenddate, _selectedValue);
    if (response != null) {
      Get.offNamedUntil(AppRoutes.emailpreference, (route) => false);
    }
  }
}
