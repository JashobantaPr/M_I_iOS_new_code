import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/myperformancetargetmeter/controller/myperformancetargetmetercontroller.dart';

class MyPerformanceTargetMeterBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MyPerformanceTargetMeterController());
  }

}