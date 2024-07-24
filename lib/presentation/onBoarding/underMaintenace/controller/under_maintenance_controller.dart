import 'package:incentivesgit/presentation/onBoarding/underMaintenace/models/under_maintenance_model.dart';
import '../../../../core/app_export.dart';

/// A controller class for the Iphone13MiniTenScreen.
///
/// This class manages the state of the Iphone13MiniTenScreen, including the
/// current iphone13MiniTenModelObj
class UnderMaintenenceController extends GetxController {
  Rx<UnderMaintenenceModel> undermaintenancemodelObj = UnderMaintenenceModel().obs;

  var isInMaintenance = true.obs;

 Future<void> checkMaintenanceMode() async {
    bool maintenance = await _fetchMaintenanceStatus();
    isInMaintenance.value = maintenance;
  }

  Future<bool> _fetchMaintenanceStatus() async {
    await Future.delayed(const Duration(seconds: 2));
    return false;
  }
}
