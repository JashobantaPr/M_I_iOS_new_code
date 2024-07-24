import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/hubpropertiesvideo/controller/propertiesvideocontroller.dart';

class HubPropertiesVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HubPropertiesVideoController());
  }
}
