import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/product_referrel/succesful_referrels/controller/succesful_referrels_controller.dart';

class SuccesfullreferrelBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SuccesfulReferrelsController());
  }
}
