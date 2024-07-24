import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/service/campaignservice.dart';
import 'package:incentivesgit/presentation/homebottombar/my_campainns/models/my_campains_model.dart';
import 'package:incentivesgit/presentation/homebottombar/my_campainns/service/mycampaignservice.dart';

class MyCampainsController extends GetxController {
  var mycampaigns = <MyCampaigns>[].obs;
  var terminologytext = ''.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchMyCampaigns();
    terminlogytext();
    super.onInit();
  }

  void fetchMyCampaigns() async {
    try {
      isLoading.value = true;
      var fetchedmyCampaigns = await MycampaignServices().myCampaigns();
      if (fetchedmyCampaigns != null) {
        mycampaigns.value = fetchedmyCampaigns;
      }
    } catch (e) {
      print("Failed to fetch Mycampaigns: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void terminlogytext() async {
    try {
      var terminology = await Campaignservices().programterminologytext();
      print('terminology$terminology');
      if (terminology != null) {
        terminologytext.value = terminology;
      }
    } catch (e) {
      print("Failed to fetch campaigns: $e");
    }
  }
}
