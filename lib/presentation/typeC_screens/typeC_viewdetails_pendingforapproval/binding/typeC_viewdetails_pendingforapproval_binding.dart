import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_viewdetails_pendingforapproval/controller/typeC_viewdetails_pendingforapproval_cotroller.dart';

class TypeCViewDetailsPendingforapprovalBinding
    extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () =>TypeCViewDetailsPendingforapprovalController());
  }
}
