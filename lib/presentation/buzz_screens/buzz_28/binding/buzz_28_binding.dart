import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzz_28/controller/buzz_28_controller.dart';

class Buzz28Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => Buzz28Controller());
  }
  
}