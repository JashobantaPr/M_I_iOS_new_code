import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/product_referrel/refer_a_friend/controller/refer_a_friend_controller.dart';

class ReferAFriendBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ReferAFriendController());
  }
  
}