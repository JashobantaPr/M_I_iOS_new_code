import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/rewards/giftcard_viewdetails/controller/view_details_controller.dart';

class GiftCardViewDetailsBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => GiftCardViewDetailsController());
  }
}
