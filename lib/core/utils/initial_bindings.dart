import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/pref_utils.dart';

import '../../presentation/onBoarding/login_screen/controller/login_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.put(PrefUtils());
   
    // Connectivity connectivity = Connectivity();
    // Get.put(NetworkInfo(connectivity));
  }
}
