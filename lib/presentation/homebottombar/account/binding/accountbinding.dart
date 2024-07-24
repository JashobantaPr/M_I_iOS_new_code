import 'package:get/get.dart';
import 'package:incentivesgit/presentation/homebottombar/account/controller/accountcontroller.dart';

class AccountBiniding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() =>AccountController() );
  }
  
}