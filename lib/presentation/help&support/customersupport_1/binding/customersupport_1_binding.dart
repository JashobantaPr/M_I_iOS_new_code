import 'package:get/get.dart';
import 'package:incentivesgit/presentation/help&support/customersupport_1/controller/customersupport_1_controller.dart';

import '../../customer_support_2/controller/customer_support_2_controller.dart';

class CustomerSupport1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CustomerSupport1Controller());
    Get.lazyPut(() => HelpandSupportCustomerSupport2Controller());
  }
}
