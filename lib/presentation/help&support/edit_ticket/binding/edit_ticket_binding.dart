import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:incentivesgit/presentation/help&support/edit_ticket/controller/edit_ticket_controller.dart';

class EditTicketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditTicketController()
    );
  }
}
