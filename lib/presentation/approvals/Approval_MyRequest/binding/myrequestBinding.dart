import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/Approvals/Approval_MyRequest/controller/myrequestController.dart';

class MyRequestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyRequestController());
  }
}
