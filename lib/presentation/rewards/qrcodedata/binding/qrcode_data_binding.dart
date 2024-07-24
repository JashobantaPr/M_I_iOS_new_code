import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/rewards/qrcodedata/controller/qrcode_data_controller.dart';

class QRCodeDataBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => QRCodeDataController());
  }
}
