import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/rewards/product/controller/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ProductController());
  }
}
