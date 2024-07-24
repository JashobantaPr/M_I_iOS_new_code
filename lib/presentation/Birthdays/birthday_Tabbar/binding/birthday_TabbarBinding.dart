import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/Birthdays/birthday_Tabbar/controller/birthday_tabbarController.dart';

class BirthdayTabBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BirthDayTabBarController());
  }
}
