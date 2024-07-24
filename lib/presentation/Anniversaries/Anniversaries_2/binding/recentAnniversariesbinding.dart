import 'package:get/get.dart';
import 'package:incentivesgit/presentation/Anniversaries/Anniversaries_2/controller/recentAnniversariescontroller.dart';

class RecentBirthdayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecenetAnniversariesController());
  }
}
