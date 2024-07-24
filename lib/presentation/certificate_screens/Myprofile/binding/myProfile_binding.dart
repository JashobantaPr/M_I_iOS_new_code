import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/certificate_screens/Myprofile/controller/myprofile_controller.dart';

class MyProfileeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MyProfileController());
  }
  
}