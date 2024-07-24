import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_7/controller/certificate_7_controller.dart';

class Certificate7Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Certificate7Controller());
  }
}
