import 'package:incentivesgit/core/app_export.dart';

import '../controller/gallery_controller.dart';




class GalleryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GalleryController());
   
  }
}
