import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/help&support/customersupport_1/binding/customersupport_1_binding.dart';
import 'package:incentivesgit/presentation/help&support/landingPage/controller/landingPage_controller.dart';

class HelpandSupportLandingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HelpandSupportLandingPageController());
    Get.lazyPut(() => CustomerSupport1Binding());
  }
}
