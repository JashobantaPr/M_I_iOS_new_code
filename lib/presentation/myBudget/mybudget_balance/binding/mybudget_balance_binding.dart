import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myBudget/mybudget_balance/controller/mybudget_balance_controller.dart';

class MyBudgetBalanceBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => MyBudgetBalanceController());
  }
  
}