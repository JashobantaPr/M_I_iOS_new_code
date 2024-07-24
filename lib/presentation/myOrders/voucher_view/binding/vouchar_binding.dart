import 'package:incentivesgit/core/app_export.dart';

import '../../myorder/controller/myOrderController.dart';
import '../controller/vouchar_view_controller.dart';

class voucharBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => VoucharViewController());
    Get.lazyPut(() => MyOrderController());
  }
}
