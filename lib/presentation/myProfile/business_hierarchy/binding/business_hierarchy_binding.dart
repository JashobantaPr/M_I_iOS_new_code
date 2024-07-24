import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myProfile/business_hierarchy/controller/business_hieararchy_controller.dart';

class BusinessHierarchyBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BusinessHierarchyController());
  }
  
}