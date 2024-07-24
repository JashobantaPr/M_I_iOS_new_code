import 'package:get/get.dart';

import '../../../homebottombar/campaignscreen/model/tiermodel.dart';
import '../../ViewTierscreen/service/view_tier_Service.dart';

class AuditTrailController extends GetxController {
  RxBool isLoading = false.obs;
  var tierData = Rx<TierDataResponse?>(null);

  @override
  void onInit() {
    fetchDetails();
    super.onInit();
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
