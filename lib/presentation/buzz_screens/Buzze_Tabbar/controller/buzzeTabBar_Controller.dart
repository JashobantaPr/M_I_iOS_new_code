import 'package:get_storage/get_storage.dart';
import 'package:incentivesgit/core/app_export.dart';

import '../../../../core/utils/cache_service.dart';

class BuzzesTabBarController extends GetxController {
  final CacheService _cacheService = CacheService();

  final RxBool isDrawerOpen = false.obs;
  final RxList getScopeData = [].obs;
  RxString selectedScopeName = RxString('');
  RxString selectedScopeid = RxString('Global');
  final RxBool isDefaultView = false.obs;
  final box = GetStorage();
  var title = "Buzzzes".obs;

  @override
  void onInit() {
    super.onInit();
    getuserscopes();
    getstoragedata();
    getArguments();
  }

  void getArguments() {
    final arguments = Get.arguments as Map<String, dynamic>;
    title.value = arguments['title'];
  }

  void getstoragedata() async {
    String? scopeid = await _cacheService.getScopeid();
    String? scopeName = await _cacheService.getScopeName();
    selectedScopeName.value = scopeName ?? '';
    selectedScopeid.value = scopeid ?? '';
  }

  void getuserscopes() async {
    final userScopeList = await _cacheService.getUserScopeList();
    getScopeData.assignAll(userScopeList!.entries.map((entry) {
      return {
        'id': entry.key,
        'city': entry.value,
      };
    }).toList());
  }

  void setSelectedCity(String city) {
    selectedScopeName.value = city;
    var cityObject =
        getScopeData.firstWhere((element) => element['city'] == city);
    selectedScopeid.value = cityObject['id'];
  }

  void setCityName(String cityName, String cityid) async {
    selectedScopeName.value = cityName;
    selectedScopeid.value = cityid;
    print('selectedScopeid${selectedScopeid.value}');
    await _cacheService.setCache(SCOPE_NAME, cityName);
    await _cacheService.setCache(SCOPE_ID, cityid);
  }

  void toggleDrawer() {
    isDrawerOpen.value = !isDrawerOpen.value;
  }
}
