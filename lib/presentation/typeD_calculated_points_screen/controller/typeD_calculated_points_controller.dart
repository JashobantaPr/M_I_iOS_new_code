import 'package:get/get.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeD_calculated_points_screen/model/typeD_calculated_points_view.dart';
import 'package:incentivesgit/presentation/typeD_calculated_points_screen/service/mycalculatedpontsservice.dart';

class CalculatedPointsController extends GetxController {
  var calculatedPoints = <TableColumn>[].obs;
  var calculatedPoints1 = <String, dynamic>{}.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchmyprogress();
    super.onInit();
  }

  void fetchmyprogress() async {
    try {
      isLoading(true);
      var response = await MyCalculatedPointsService().myprogresscard();
      if (response != null && response.msg != null) {
        print('asdhf ${response.msg!.tableColumns}');
        calculatedPoints.assignAll(response.msg!.tableColumns);
        calculatedPoints1.value = response.msg!.tableColumns1;
      }
    } catch (e) {
      print("Error fetching calculated points: $e");
    } finally {
      isLoading(false);
    }
  }
}
