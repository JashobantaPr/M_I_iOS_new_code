import 'package:get/get.dart';
import 'package:incentivesgit/presentation/typeC_screens/claim_approval_based_awarding_of_points_claim_management/model/allclaims.dart';
import 'package:incentivesgit/presentation/typeC_screens/claim_approval_based_awarding_of_points_claim_management/model/claimmanagementModel.dart';
import 'package:incentivesgit/presentation/typeC_screens/claim_approval_based_awarding_of_points_claim_management/service/claimmanagementService.dart';
import '../service/add_clime_service.dart';

class ClaimApprovalBasedAwardingofPointsClaimManagementController
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
          await typectotaltabclaimmanagementService().getclaimsummary();
      if (fetchedPoints != null) {
        points.value = fetchedPoints;
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
          await typectotaltabclaimmanagementService().getAllClaim();
      if (fetchedClaims != null) {
        allClaims.value = fetchedClaims;
      } else {
        allClaims.clear();
      }
    } catch (e) {
      print("Failed to fetch claim: $e");
    }
  }

  void claimtype() async {
    var claimdetails = await AddclaimforApproval().fetchClaimType();
    print('claimtypevalue $claimdetails');
    if (claimdetails != null) {
      claimType.value = claimdetails;
    }
  }

  void showAddClaimButtons() {
    showAddClaimButton.value = true;
  }

  void hideAddClaimButton() {
    showAddClaimButton.value = false;
  }
}
