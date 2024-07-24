import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzz_33/controller/buzz_33_controller.dart';

class Buzz33Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => Buzz33Controller());
  }
  
}