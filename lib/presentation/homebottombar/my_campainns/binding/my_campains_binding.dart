import 'package:get/get.dart';

import '../controller/my_campains_controller.dart';


/// A binding class for the Iphone13MiniTenScreen.
///
/// This class ensures that the Iphone13MiniTenController is created when the
/// Iphone13MiniTenScreen is first loaded.
class MyCampainsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyCampainsController());
  }
}
