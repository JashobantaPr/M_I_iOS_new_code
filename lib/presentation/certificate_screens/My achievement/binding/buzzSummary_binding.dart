import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/certificate_screens/My%20achievement/controller/certificateSummary_Controller.dart';

class MyAchievementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyAchievementController());
  }
}
