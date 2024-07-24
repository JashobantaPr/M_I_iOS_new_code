import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/rewards/supercheque/controller/supercheque_controller.dart';

class SuperChequeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SuperchequeController());
  }
}
