import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/TierScreen/getall_Tiers/controller/audit_trail_Controller.dart';

class AuditTrailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuditTrailController());
  }
}
