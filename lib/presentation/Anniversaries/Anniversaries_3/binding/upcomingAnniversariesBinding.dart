import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/Anniversaries/Anniversaries_3/controller/upcomingAnniversariescontroller.dart';

class UpcomingAnniversariesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpcomingAnniversariesController());
  }
}
