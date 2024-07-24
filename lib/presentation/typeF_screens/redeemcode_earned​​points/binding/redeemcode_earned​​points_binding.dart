import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeF_screens/redeemcode_earned%E2%80%8B%E2%80%8Bpoints/controller/redeemcode_earned%E2%80%8B%E2%80%8Bpoints_controller.dart';

class RedeemCodeEarnedPointsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RedeemCodeEarnedPointsController());
  }
  
}