import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/myperformancecard/controller/myperformancecardcontroller.dart';

class MyPerformanceCardBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MyPerformanceCardController());
  }
  
}