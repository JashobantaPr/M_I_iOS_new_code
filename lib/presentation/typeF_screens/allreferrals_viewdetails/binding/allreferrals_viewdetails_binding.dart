import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeF_screens/allreferrals_viewdetails/controller/allreferrals_viewdetails_controller.dart';

class AllReferralsViewDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AllReferralsViewDetailsController());
  }
  
}