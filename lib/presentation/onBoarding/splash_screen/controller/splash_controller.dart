import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/widgets/newversionupdateDialogue.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../../core/app_export.dart';
import '../../../../routes/app_routes.dart';
import '../models/splash_model.dart';

/// A controller class for the Iphone13MiniTenScreen.
///
/// This class manages the state of the Iphone13MiniTenScreen, including the
/// current iphone13MiniTenModelObj
class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;
  final CacheService _cacheService = CacheService();

  @override
  void onReady() {
    checkCache();
    super.onReady();
  }

  // void navigateToLogin() async {
  //   String? userId = await _cacheService.getUserId();
  //   print('userId: $userId');
  //   bool isLoggedIn = (userId != null && userId.isNotEmpty);
  //   print('isLoggedIn: $isLoggedIn');
  //   Future.delayed(const Duration(milliseconds: 3000), () {
  //     if (isLoggedIn) {
  //       Get.offNamed(AppRoutes.bottomtab);
  //     } else {
  //       _checkForUpdate();
  //     }
  //   });
  // }

  void navigateToLogin() async {
    _checkForUpdate();
  }

  void _checkForUpdate() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    if (packageInfo.version == "2.0.0") {
      Get.offAndToNamed(AppRoutes.loginScreen);
    } else {
      Get.off(const UpdateDialog());
    }
  }

  void navigateToWelcome() async {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offNamed(AppRoutes.loginScreen);
    });
  }

  void navigateToHome() async {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offNamed(AppRoutes.bottomtab);
    });
  }

  void checkCache() async {
    final profileStatus = await _cacheService.getCache(PROFILE_STATUS);
    final companyids = await _cacheService.getCache(COMP_ID);


    Future.delayed(const Duration(milliseconds: 3000), () {
      if (profileStatus == true) {
        // Profile status is true, navigate to Home screen
        navigateToHome();
      } else {
        // Profile status is not true, navigate to Login screen
        navigateToLogin();
      }
    });
  }
}
