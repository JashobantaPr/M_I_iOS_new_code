import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/product_referrel/campaign_summary/controller/campaign_summary_controller.dart';
import 'package:incentivesgit/presentation/product_referrel/product_referrel_tabbar/controller/product_referrel_tabbar_controller.dart';
import 'package:incentivesgit/presentation/product_referrel/redeemcode/controller/redeemcode_controller.dart';
import 'package:incentivesgit/presentation/product_referrel/refer_and_earn/controller/refer_and_earn_controller.dart';

class ProductReferrelTabbarBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ProductReferrelTabbarController());
    Get.lazyPut(() => CampaignSummaryController());
    Get.lazyPut(() => referAndEarnController());
    Get.lazyPut(() => RedeemCodeController());
  }
}
