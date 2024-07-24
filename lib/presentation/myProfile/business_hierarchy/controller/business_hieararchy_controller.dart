import 'package:get/get.dart';
import 'package:incentivesgit/presentation/myProfile/business_hierarchy/model/business_hieararchy_model.dart';
import 'package:incentivesgit/presentation/myProfile/business_hierarchy/service/business_hierarchy_service.dart';

class BusinessHierarchyController extends GetxController {
  var myHierarchy = <HierarchyItem>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    allHierarchy();
    super.onInit();
  }

  void allHierarchy() async {
    MyHierarchy? data = await BusinessHierarchy().myHierarchData();
    if (data != null) {
      myHierarchy.value = data.myHierarchy ?? [];
    }
  }
}
