import 'package:get/get.dart';
import 'package:incentivesgit/presentation/typeC_screens/TypeC_KpiSku_Regression_awardingpoints_claim_management/service/TypeC_KpiSku_Regression_awardingpoints_claim_management_service.dart';
import 'package:incentivesgit/presentation/typeC_screens/claim_approval_based_awarding_of_points_claim_management/model/allclaims.dart';
import 'package:incentivesgit/presentation/typeC_screens/claim_approval_based_awarding_of_points_claim_management/model/claimmanagementModel.dart';


class TypeCViewDetailsPendingforapprovalController
    extends GetxController {
 

 
var claimType = ''.obs;
  var points = ClaimData1(
    pending: 0,
    approved: 0,
    rejected: 0,
    submitted: 0,
    discarded: 0,
  ).obs;

  var allClaims = <Claim>[].obs;
  var showAddClaimButton = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchClaimSummary();
    fetchAllClaim();
    claimtype();
  }

  void fetchClaimSummary() async {
    try {
      var fetchedPoints =
          await TypeCKpiSkuAwardingPointsClaimManagementService()
              .getclaimsummary();
      if (fetchedPoints != null) {
        // points.value = fetchedPoints;
      } else {
        print('No data found.');
      }
    } catch (e) {
      print("Failed to fetch points: $e");
    }
  }

  void fetchAllClaim() async {
    try {
      var fetchedClaims =
          await TypeCKpiSkuAwardingPointsClaimManagementService().getAllClaim();
      if (fetchedClaims != null) {
        allClaims.value = fetchedClaims;
      } else {
        allClaims.clear();
      }
    } catch (e) {
      print("Failed to fetch claim: $e");
    }
  }

  void showAddClaimButtons() {
    showAddClaimButton.value = true;
  }

  void hideAddClaimButton() {
    showAddClaimButton.value = false;
  }

  void claimtype() async {
    // var claimdetails = await AddclaimforApproval().fetchClaimType();
    // print('claimtypevalue $claimdetails');
    // if (claimdetails != null) {
    //   claimType.value = claimdetails;
    // }
  }

}
