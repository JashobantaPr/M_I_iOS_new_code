import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/type_A_view_details/controller/view_details_controller.dart';

class ViewDetailsForAchivementsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewDetailsForAchivementsController());
  }
}
