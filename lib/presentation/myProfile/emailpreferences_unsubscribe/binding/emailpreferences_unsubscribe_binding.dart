import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myProfile/emailpreferences_unsubscribe/controller/emailpreferences_unsubscribe_controller.dart';


class EmailPreferencesUnsubscribeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EmailPreferencesUnsubscribeController());
  }
}
