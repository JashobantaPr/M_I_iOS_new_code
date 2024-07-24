import 'package:get/get.dart';
import 'package:incentivesgit/presentation/News/post/controller/post_controller.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostController());
  }
}
