import 'package:get/get.dart';

import '../controller/new_user_controller.dart';


/// A binding class for the Iphone13MiniTenScreen.
///
/// This class ensures that the Iphone13MiniTenController is created when the
/// Iphone13MiniTenScreen is first loaded.
class NewUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NewUserController());
  }
}
