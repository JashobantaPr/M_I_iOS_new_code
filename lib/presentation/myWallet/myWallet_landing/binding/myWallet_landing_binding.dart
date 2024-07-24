import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myWallet/myWallet_landing/controller/myWallet_landing_controller.dart';

class MyWalletBinding extends Bindings{
  @override
  void dependencies() {
Get.lazyPut(() => MyWalletController());
  }
  
}