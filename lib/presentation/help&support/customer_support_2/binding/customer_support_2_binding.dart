import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:incentivesgit/presentation/help&support/customer_support_2/controller/customer_support_2_controller.dart';

class HelpandSupportCustomerSupport2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HelpandSupportCustomerSupport2Controller()
    );
  }
}
