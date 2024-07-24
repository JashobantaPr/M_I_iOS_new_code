import 'package:incentivesgit/core/app_export.dart';

import '../../../../routes/app_routes.dart';
import '../../myorder/controller/myOrderController.dart';
import '../../otp_screen/model/company_profile_model.dart';
import '../../otp_screen/model/otp_model.dart';
import '../../service/myorder_services.dart';
import '../model/view_details.dart';

class MyorderViewDetailsController extends GetxController {
  final myordercontroller = Get.find<MyOrderController>();
  RxList<ViewDetails>? viewDetails = <ViewDetails>[].obs;
  Rx<CompanyProfileModel>? companyProfileList = CompanyProfileModel().obs;
  final otpMode = Rx<String?>(null);
  Rx<OtpCodeModel>? otpcode = OtpCodeModel().obs;
  final orderOtpCode = Rx<int?>(null);

  void onChange(int? value){
    orderOtpCode.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    getViewDetails();
  }

  getViewDetails() async {
    try {
      List<ViewDetails>? result =
          await MyorderService().viewDetails(myordercontroller.orderId.value);
      if (result != null) {
        viewDetails!.value = result;
      }
    } catch (e) {
      print("e");
    }
  }

  viewButtonotp() async {
    await getCompanyProfile();
    if (otpMode.value == "1") {
      await orderOtp();
    } else {
      Get.toNamed(AppRoutes.voucharDetails);
    }
  }

  getCompanyProfile() async {
    try {
      CompanyProfileModel? list = await MyorderService().companyProfile();
      if (list != null) {
        companyProfileList?.value = list;
        otpMode.value =
            companyProfileList?.value.companyProfile?.first.otpMode ?? "";
      }
    } catch (e) {
      print(e);
    }
  }
  //otp

  orderOtp() async {
    OtpCodeModel? result = await MyorderService().orderOtp();
    if (result != null) {
      Get.toNamed(AppRoutes.orderOtpScreen);
      otpcode?.value = result;
      orderOtpCode.value = otpcode?.value.otp ?? 0;
    }
  }
}
