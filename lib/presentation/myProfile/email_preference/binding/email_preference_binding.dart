import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myProfile/email_preference/controller/email_preference_controller.dart';

class EmailPreferenceBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => EmailPreferenceController());
  }
}
