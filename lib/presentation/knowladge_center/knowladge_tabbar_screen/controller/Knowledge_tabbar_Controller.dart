import 'package:get_storage/get_storage.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/data/onboarding_services.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_Tabbar/module/statemodule.dart';

class KnowledgeTabBarController extends GetxController {
  final RxBool isDrawerOpen = false.obs;
  RxList<cuntryPickerModel> getCountryData = <cuntryPickerModel>[].obs;
  Rx<cuntryPickerModel?> selectedCountry = Rx<cuntryPickerModel?>(null);
  RxString selectedCityName = RxString('');
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();

    getCountrysData();
    selectedCityName.value = box.read('selectedCityName') ?? '';
  }

  Future<void> getCountrysData() async {
    final response = await OnBoardingServices().getCountryDetails();
    if (response != null && response.isNotEmpty) {
      print('response: $response');
      getCountryData.value = response
          .map((country) => cuntryPickerModel.fromJson(country))
          .toList();
    }
  }

  void toggleDrawer() {
    isDrawerOpen.value = !isDrawerOpen.value;
  }

  void setSelectedCountry(cuntryPickerModel country) {
    selectedCountry.value = country;
  }

  void setCityName(String name) {
    selectedCityName.value = name;
    box.write('selectedCityName', name);
  }
}
