import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/Approvals/approved_details/controller/approved_detailsController.dart';

class ApprovedViewDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ApprovedViewDetailsController());
  }
}
