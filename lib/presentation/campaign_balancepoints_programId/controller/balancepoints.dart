import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/campaign_balancepoints_programId/module/balance_point_module.dart';
import 'package:incentivesgit/presentation/campaign_balancepoints_programId/service/balance_point_service.dart';
import 'package:incentivesgit/presentation/campaign_earned_points/service/campaignsearnedpointsservice.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/service/campaignservice.dart';

class BalancePointsController extends GetxController {
  final balancepoints = Get.arguments;
  var searchQuery = ''.obs;
  var terminologytext = ''.obs;
  var isLoading = true.obs;

  // Example data for dropdowns
  var campaigns = <String?>[].obs;
  var year = <String>[].obs;
  var campaignsValue = Rx<String?>('All');
  var transactions = <UserPointsModel>[].obs;

  // Value holders for dropdowns
  var yearValue = 'All'.obs;

  void yeardropdown() async {
    isLoading.value = true;
    try {
      var yearValues = await CampaignEarnedPointsService().yearDropdown();
      if (yearValues.isNotEmpty) {
        year.value = ['All', ...yearValues.map((year) => year.toString())];
        yearValue.value = 'All'; // Initialize yearValue with 'All'
      }
    } catch (e) {
      print("Failed to fetch year: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void transactionhistory(String? selectedYear) async {
    isLoading.value = true;
    try {
      List<UserPointsModel> result;

      if (selectedYear != null && selectedYear != 'All') {
        result = await BalancePointProgramIDService()
            .transactiondata(int.parse(selectedYear));
      } else {
        result = await BalancePointProgramIDService().allTransactions();
      }

      transactions.assignAll(result);
    } catch (e) {
      print("Failed to fetch transactions: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void terminlogytext() async {
    try {
      var terminology = await Campaignservices().programterminologytext();
      if (terminology != null) {
        terminologytext.value = terminology;
      }
    } catch (e) {
      print("Failed to fetch campaigns: $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    terminlogytext();
    yeardropdown();
    print('kdhfbfh ${Get.arguments}');

    // Initially fetch all transactions
    transactionhistory(yearValue.value);

    // Add listeners to observables to react to changes
    ever(yearValue, (String? selectedYear) {
      transactionhistory(selectedYear);
    });

    // Initialize transaction history with the first available year value
    transactionhistory(yearValue.value);
  }

  List<UserPointsModel> get filteredTransactions {
    if (searchQuery.value.isEmpty) {
      return transactions;
    } else {
      final query = searchQuery.value.toLowerCase();
      return transactions.where((transaction) {
        final transactionName = transaction.programName.toLowerCase();
        // Add more attributes to search as needed
        return transactionName.contains(query);
      }).toList();
    }
  }
}
