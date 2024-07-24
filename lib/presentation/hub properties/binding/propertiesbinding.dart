import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/hub%20properties/controller/propertiescontroller.dart';

class HubPropertiesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HubPropertiesController());
  }
}
