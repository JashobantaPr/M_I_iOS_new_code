import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/campaign_calculatedpoints_programId/model/trasnactionmodel.dart';
import 'package:incentivesgit/presentation/campaign_calculatedpoints_programId/service/campaignsearnedpointsservice.dart';

class CampaignCalculatedPointsController1 extends GetxController {
  var searchQuery = ''.obs;
  // Example data for dropdowns

  var campaigns = <String?>[].obs;
  var year = <int?>[].obs;
  var transactions = <Transaction>[].obs;

  // Value holders for dropdowns
  var campaignsValue = Rx<String?>(null);
  var yearValue = Rx<int?>(null);

  void yeardropdown() async {
    try {
      var yearValues = await CampaignCalculatedPointsService().yearDropdown();
      if (yearValues.isNotEmpty) {
        year.value = yearValues;
        yearValue.value = yearValues.first;
      }
    } catch (e) {
      print("Failed to fetch year: $e");
    }
  }

  void transactionhistory(int selectedYear) async {
    var result =
        await CampaignCalculatedPointsService().transactiondata(selectedYear);
    if (result.isNotEmpty) {
      transactions.assignAll(result);
    }
  }

  @override
  void onInit() {
    super.onInit();
    yeardropdown();

    // Add listeners to observables to react to changes
    ever(yearValue, (int? selectedYear) {
      if (selectedYear != null) {
        transactionhistory(selectedYear);
      }
    });

    // Initialize transaction history with the first available year value
    if (yearValue.value != null) {
      transactionhistory(yearValue.value!);
    }
  }

  List<Transaction> get filteredTransactions {
    if (searchQuery.value.isEmpty) {
      return transactions;
    } else {
      return transactions.where((transaction) {
        final transactionName = transaction.programName!.toLowerCase();
        return transactionName.contains(searchQuery.value.toLowerCase());
      }).toList();
    }
  }
}
