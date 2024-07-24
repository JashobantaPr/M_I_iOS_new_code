import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/hub%20-%203/controller/hub3_controller.dart';

class Hub3Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Hub3Controller());
  }
}
