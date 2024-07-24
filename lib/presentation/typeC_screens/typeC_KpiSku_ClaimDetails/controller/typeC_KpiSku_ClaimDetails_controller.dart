import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_KpiSku_ClaimDetails/model/typeC_KpiSku_ClaimDetails_model.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_KpiSku_ClaimDetails/service/typeC_KpiSku_ClaimDetails_service.dart';


class TypeCKpiSkuClaimDetailsController extends GetxController {
  var claimData = Rxn<ResponseData>().obs; // Make claimData observable

  @override
  void onInit() {
    super.onInit();
    fetchClaimData();
  }

  void fetchClaimData() async {
    print('sowjanya');
    try {
      var claimDetails = await TypeCKpiSkuClaimDetailsService().getClaimDatabyID();
      if (claimDetails != null) {
        claimData.value.value = claimDetails; // Update the value
        print('Claim ID: ${claimData.value.value!.claimId}');
        print('aaaaaabcdf${claimData.value.value!.claimId}');
      } else {
        print('claimDetails is null');
      }
    } catch (e) {
      print('Error fetching claim: $e');
    }
  }
}