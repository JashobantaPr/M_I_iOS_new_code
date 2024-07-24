import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/myprogressbar/controller/myprogressbarcontroller.dart';

class MyProgressBarBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => MyProgressbarController());
  }
  
}