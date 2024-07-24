import 'package:get/get.dart';

import '../../../homebottombar/account/service/my_account_service.dart';
import '../../../homebottombar/campaignscreen/model/tiermodel.dart';
import '../service/view_tier_Service.dart';

class TierController extends GetxController {
  RxBool isLoading = false.obs;
  var tierData = Rx<TierDataResponse?>(null);

  @override
  void onInit() {
    fetchDetails();
    fetchuserData();
    super.onInit();
  }

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

  void fetchDetails() async {
    isLoading.value = true;
    try {
      var fetchedtierdata = await TierscreenService().tierviewdata();
      if (fetchedtierdata != null) {
        tierData.value = fetchedtierdata;
        print('fetchedtierdatafetchedtierdata$fetchedtierdata');
      }
    } catch (e) {
      print("Failed to fetch tier data: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
