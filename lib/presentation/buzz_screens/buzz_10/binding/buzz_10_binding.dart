import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzz_10/controller/buzz_10_controller.dart';
import 'package:incentivesgit/presentation/campaign_balance_point/controller/campaign_balance_point_controller.dart';

class Buzz10Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => Buzz10Controller());
  }
  
}