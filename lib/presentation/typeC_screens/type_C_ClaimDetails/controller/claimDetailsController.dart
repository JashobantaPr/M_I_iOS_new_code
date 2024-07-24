import 'dart:ffi';

import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeC_screens/Type_C_rejectclaim/controller/rejectclaimcontroller.dart';
import 'package:incentivesgit/presentation/typeC_screens/type_C_ClaimDetails/model/claimdetailsmodel.dart';
import 'package:incentivesgit/presentation/typeC_screens/type_C_ClaimDetails/service/claimdetailsService.dart';

class ClaimController extends GetxController {
  var claimData = Rxn<ResponseData>().obs;
  final controllpoints = Get.find<RejectClaimController>();
  var claimed = '0'.obs;
  var claimId = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    fetchClaimData(claimId);
    print('claimId $claimId');
  }

  void fetchClaimData(String claimId) async {
    try {
      var claimDetails =
          await TypeCClaimDetailsService().getClaimDatabyID(claimId);

      if (claimDetails != null) {
        claimData.value.value = claimDetails;
        claimed.value = claimData.value.value!.claimId.toString();
        print('CLAIMDATA${claimed.value}');
      } else {
        print('claimDetails is null');
      }
    } catch (e) {
      print('Error fetching claim: $e');
    }
  }
}
