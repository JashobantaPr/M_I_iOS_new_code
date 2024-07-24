import 'package:get/get.dart';
import 'package:incentivesgit/presentation/onBoarding/notification_screen/controller/notification_controller.dart';

/// A binding class for the Iphone13MiniTenScreen.
///
/// This class ensures that the Iphone13MiniTenController is created when the
/// Iphone13MiniTenScreen is first loaded.
class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController());
  }
}
