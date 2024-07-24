import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzz_9/controller/buzz_9_controller.dart';

class Buzz9Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => Buzz9Controller());
  }
  
}