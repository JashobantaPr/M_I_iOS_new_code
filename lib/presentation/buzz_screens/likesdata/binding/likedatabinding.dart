import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/buzz_screens/likesdata/controller/likedatacontroller.dart';

class LikeDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LikedataController());
  }
}
