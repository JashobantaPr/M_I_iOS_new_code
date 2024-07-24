import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_8/controller/certificate_8_controller.dart';

class Certificate8Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Certificate8Controller());
  }
}
