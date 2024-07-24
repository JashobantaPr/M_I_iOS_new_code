import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/buzz_screens/Buzz_summary/controller/buzzSummary_Controller.dart';

class BuzzeSummaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BuzzeSummaryController());
  }
}
