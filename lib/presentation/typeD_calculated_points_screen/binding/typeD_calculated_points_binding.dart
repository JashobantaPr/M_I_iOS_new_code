import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeD_calculated_points_screen/controller/typeD_calculated_points_controller.dart';


class CalculatedPointsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CalculatedPointsController());
  }
}
