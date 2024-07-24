import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/myperformancetargetmeter/model/myperformancetargetmetermodel.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/myperformancetargetmeter/service/myperformanceservice.dart';

class MyProgressbarController extends GetxController {
  var kpiList = <KPI>[].obs;
  var isLoading = true.obs;
  

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

  @override
  void onInit() {
    // TODO: implement onInit
    fetchMyPerformance();
    super.onInit();
  }
}
