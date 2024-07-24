import 'package:get/get.dart';
import 'package:incentivesgit/presentation/Birthdays/Birthday_2/controller/recentbirthdaycontroller.dart';

class RecentBirthdayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecenetBirthdayController());
  }
}
