import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/type_A_incentives_plans/controllers/incentives_plans.dart';

class IncentivePlansBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IncentivesPlansControlller());
  }
}
