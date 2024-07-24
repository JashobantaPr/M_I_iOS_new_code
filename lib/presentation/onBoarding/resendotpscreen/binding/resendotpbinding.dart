import 'package:get/get.dart';
import 'package:incentivesgit/presentation/onBoarding/resendotpscreen/controller/resendotpcontroller.dart';

/// A binding class for the Iphone13MiniTenScreen.
///
/// This class ensures that the Iphone13MiniTenController is created when the
/// Iphone13MiniTenScreen is first loaded.
class ResendOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResendOtpController());
  }
}
