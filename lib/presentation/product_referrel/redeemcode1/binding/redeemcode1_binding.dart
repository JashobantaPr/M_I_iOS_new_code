import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/product_referrel/redeemcode1/controller/redeemcode1_controller.dart';

class Redeemcode1Binding extends Bindings{

@override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => Redeemcode1Controller());
  }


}