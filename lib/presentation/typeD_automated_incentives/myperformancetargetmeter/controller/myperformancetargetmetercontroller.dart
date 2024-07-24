import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/myperformancetargetmeter/model/myperformancetargetmetermodel.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/myperformancetargetmeter/service/myperformanceservice.dart';

class MyPerformanceTargetMeterController extends GetxController {
  var isLoading = false.obs;
  var kpiList = <KPI>[].obs;
  @override
  void onInit() {
    fetchMyPerformance();
    super.onInit();
  }

  void fetchMyPerformance() async {
    isLoading(true);
    try {
      var fetchedKPIs = await MyPerformanceService().myPerformance();
      kpiList.assignAll(fetchedKPIs);
    } catch (e) {
      print('Failed to fetch campaigns: $e');
    } finally {
      isLoading(false);
    }
  }
}
