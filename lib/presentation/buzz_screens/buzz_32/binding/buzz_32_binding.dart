import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzz_32/controller/buzz_32_controller.dart';

class Buzz32Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => Buzz32Controller());
  }
  
}