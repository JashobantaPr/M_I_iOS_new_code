import 'package:incentivesgit/core/app_export.dart';

import '../controller/TierscreenController.dart';

class ViewTierBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TierController());
  
  }
}
