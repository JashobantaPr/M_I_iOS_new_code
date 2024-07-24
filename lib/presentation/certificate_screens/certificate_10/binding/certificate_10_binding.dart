import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_10/controller/certificate_10_controller.dart';

class Certificate10Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Certificate10Controller());
  }
}
