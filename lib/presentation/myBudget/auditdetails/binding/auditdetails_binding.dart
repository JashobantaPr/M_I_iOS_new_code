import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myBudget/auditdetails/controller/auditdetails_controller.dart';

class AuditDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuditDetailsController());
  }
}
