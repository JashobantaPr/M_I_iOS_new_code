import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:incentivesgit/presentation/help&support/customer_support_4/controller/customer_support_4_controller.dart';

class HelpandSupportCustomerSupport4Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HelpandSupportCustomerSupport4Controller
    );
  }
}
