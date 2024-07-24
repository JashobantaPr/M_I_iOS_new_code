import 'package:incentivesgit/core/app_export.dart';

import '../../get_all_certificate_screen/controller/get_all_certificate_controller.dart';

class ViewProfileController extends GetxController {
  final userData = Get.find<GetAllCertificateController>();
  RxBool isLoading = false.obs;
  final arg = Get.arguments;
  @override
  void onInit() {
    super.onInit();
  }
}
