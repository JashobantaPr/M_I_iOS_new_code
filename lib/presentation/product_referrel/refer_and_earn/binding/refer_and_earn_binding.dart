import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/product_referrel/refer_a_friend/binding/refer_a_friend_binding.dart';
import 'package:incentivesgit/presentation/product_referrel/refer_and_earn/controller/refer_and_earn_controller.dart';

class referAndEarnBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => referAndEarnController());
    Get.lazyPut(() => ReferAFriendBinding());
  }
}
