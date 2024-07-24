import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myProfile/bank_ac_profile/controller/bank_ac_profile_controller..dart';
import 'package:incentivesgit/presentation/myProfile/myprofile/controller/myprofilecontroller.dart';
import 'package:incentivesgit/presentation/myProfile/pan_profile/controller/pan_profile_controller.dart';
import 'package:incentivesgit/presentation/myProfile/paytm_profile/controller/paytm_profile_controller.dart';
import 'package:incentivesgit/presentation/myProfile/primary_profile/controller/primary_profile_controller.dart';
import 'package:incentivesgit/presentation/myProfile/upi_profile/controller/upi_profile_controller.dart';
import 'package:incentivesgit/presentation/myProfile/vpa_profile/controller/vpa_profile_controller.dart';

class MyProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyProfileController());
    Get.lazyPut(() => PanProfileController());
    Get.lazyPut(() => PrimaryProfileController());
    Get.lazyPut(() => VpaProfileController());
    Get.lazyPut(() => BankAccountProfileController());
    Get.lazyPut(() => PaytmProfileController());
    Get.lazyPut(() => UpiProfileController());
  }
}
