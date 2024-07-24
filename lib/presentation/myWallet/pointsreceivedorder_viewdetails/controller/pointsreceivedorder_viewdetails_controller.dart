import 'package:get/get_core/src/get_main.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/campaign_earned_point_viewdetails_screen/model/campaign_earnedpoint_viewdetails_model.dart';
import 'package:incentivesgit/presentation/campaign_earned_point_viewdetails_screen/service/transactiondetailsservice.dart';


class PointsReceivedOrderViewDetailsController extends GetxController {
  final transactionId = Get.arguments;

  var details = ViewDetailsModel().obs;

  void fetchDetails() async {
  try {
    var fetchedPoints = await Transactiondetails().transactiondata();
    print('fetchedPoints$fetchedPoints');
    if (fetchedPoints != null) {
      details.value = fetchedPoints;
    }
  } catch (e) {
    print("Failed to fetch points: $e");
  }
}


  @override
  void onInit() {
    fetchDetails();
    super.onInit();
  }
}
