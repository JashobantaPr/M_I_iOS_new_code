import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myBudget/mybudget_viewdetails/controller/mybudget_viewdetails_controller.dart';

class MyBudgetViewDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MyBudgetViewDetailsController());
  }
  
}