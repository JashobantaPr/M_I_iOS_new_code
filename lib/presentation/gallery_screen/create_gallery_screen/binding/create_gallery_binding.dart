import 'package:incentivesgit/core/app_export.dart';

import '../controller/create_gallery_controller.dart';


class CreateGalleryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateGalleryController());
  }
}
