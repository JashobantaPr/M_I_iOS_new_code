import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:incentivesgit/presentation/help&support/customer_support_5/controller/customer_support_5_controller.dart';

class HelpandSupportCustomerSupport5Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HelpandSupportCustomerSupport5Controller()
    );
  }
}
