import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:incentivesgit/core/app_export.dart';

import '../../../knowladge_center/knowladge_tabbar_screen/module/statemodule.dart';


class GalleryController extends GetxController {
  TextEditingController commentcontroller = TextEditingController();
  final RxBool isDrawerOpen = false.obs;
  RxList<cuntryPickerModel> getCountryData = <cuntryPickerModel>[].obs;
  Rx<cuntryPickerModel?> selectedCountry = Rx<cuntryPickerModel?>(null);
  RxString selectedCityName = RxString('');
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }
}
