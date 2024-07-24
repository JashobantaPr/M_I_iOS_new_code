import 'package:get/get.dart';
import 'package:incentivesgit/presentation/type_A_view_details/controller/view_details_controller.dart';

import '../controller/campain_details_controller.dart';

/// A binding class for the Iphone13MiniTenScreen.
///
/// This class ensures that the Iphone13MiniTenController is created when the
/// Iphone13MiniTenScreen is first loaded.
class CampainDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CampainDetailsController());
        Get.lazyPut(() => ViewDetailsForAchivementsController());

  }
}
