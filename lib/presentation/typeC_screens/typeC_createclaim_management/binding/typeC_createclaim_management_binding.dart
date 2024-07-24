import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_createclaim_management/controller/typeC_createclaim_management_controller.dart';


class CreateClaimManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateClaimManagementController());
  }
}
