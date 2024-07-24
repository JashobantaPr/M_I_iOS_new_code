import 'package:get/get.dart';
import 'package:incentivesgit/presentation/homebottombar/account/service/my_account_service.dart';

class AccountController extends GetxController {
  var firstName = ''.obs;
  var lastName = ''.obs;
  var profilePic = ''.obs;

  void fetchuserData() async {
    try {
      final fetchedData = await MyAccountService().primerydata();
      if (fetchedData != null) {
        firstName.value = fetchedData['first_name'] ?? '';
        lastName.value = fetchedData['last_name'] ?? '';
        profilePic.value = fetchedData['profile_pic'] ?? '';
      } else {
        print('No data fetched or data is null');
      }
    } catch (e) {
      print("Failed to fetch ProfiletabData: $e");
    }
  }

  Future<bool> deletetoken() async {
    bool? tokendeleted = await MyAccountService().deleteuserToken();
    if (tokendeleted) {
      print('User token deleted successfully');
      return true;
    } else {
      print('Token Not Delete');
      return false;
    }
  }

  Future<bool> deletefcmtoken() async {
    bool? fcmtokendeleted = await MyAccountService().fcmTokenDelete();
    if (fcmtokendeleted) {
      print('FCM token deleted successfully');
      return true;
    } else {
      print('Token Not Delete');
      return false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchuserData();
    super.onInit();
  }
}
