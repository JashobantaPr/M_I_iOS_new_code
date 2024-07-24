import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/hub%20-%201/controller/hub1_controller.dart';

class Hub2Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => Hub1Controller());
  }
  
}