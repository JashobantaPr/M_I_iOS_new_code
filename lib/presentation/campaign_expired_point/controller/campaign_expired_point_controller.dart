import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/campaign_earned_points/model/trasnactionmodel.dart';
import 'package:incentivesgit/presentation/campaign_earned_points/service/campaignsearnedpointsservice.dart';
import 'package:incentivesgit/presentation/campaign_expired_point/service/expired_point_service.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/service/campaignservice.dart';

class CampaignExpiredPointsController extends GetxController {
  final expiredpoints = Get.arguments;
  var searchQuery = ''.obs;
  var terminologytext = ''.obs;
  var isLoading = true.obs;

  // Example data for dropdowns
  var campaigns = <String?>[].obs;
  var year = <int?>[].obs;
  var transactions = <Transaction>[].obs;

  // Value holders for dropdowns
  var campaignsValue = Rx<String?>('All');
  var yearValue = Rx<int?>(null);

  void campaigndropdown() async {
    try {
      var dropdownValues =
          await CampaignEarnedPointsService().campaignsdropdown();
      if (dropdownValues.isNotEmpty) {
        campaigns.value = ['All', ...dropdownValues];
        campaignsValue.value = 'All';
      }
    } catch (e) {
      print("Failed to fetch campaigns: $e");
    }
  }

  void yeardropdown() async {
    try {
      var yearValues = await CampaignEarnedPointsService().yearDropdown();
      if (yearValues.isNotEmpty) {
        year.value = [null, ...yearValues]; // null represents "All"
        yearValue.value = null;
      }
    } catch (e) {
      print("Failed to fetch year: $e");
    }
  }

  void transactionhistory(int? selectedYear, String? selectedCampaign) async {
    isLoading.value = true;
    try {
      List<Transaction> result;

      if (selectedYear != null) {
        result = await ExpiredPointsService().transactiondata(selectedYear);
      } else {
        result = await ExpiredPointsService().allTransactions();
      }

      if (result.isNotEmpty) {
        if (selectedCampaign != null && selectedCampaign != 'All') {
          transactions.assignAll(
            result
                .where((transaction) =>
                    transaction.programName == selectedCampaign)
                .toList(),
          );
        } else {
          transactions.assignAll(result);
        }
      }
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
    campaigndropdown();
    yeardropdown();

    // Add listeners to observables to react to changes
    ever(yearValue, (int? selectedYear) {
      transactionhistory(selectedYear, campaignsValue.value);
    });

    ever(campaignsValue, (String? selectedCampaign) {
      transactionhistory(yearValue.value, selectedCampaign);
    });

    // Initialize transaction history with the first available year and campaign values
    transactionhistory(yearValue.value, campaignsValue.value);
  }

  List<Transaction> get filteredTransactions {
    if (searchQuery.value.isEmpty) {
      return transactions;
    } else {
      final query = searchQuery.value.toLowerCase();
      return transactions.where((transaction) {
        final transactionName = transaction.programName?.toLowerCase() ?? '';
        final transactionId =
            transaction.transactionCode?.toString().toLowerCase() ?? '';
        // Add more attributes to search as needed
        return transactionName.contains(query) || transactionId.contains(query);
      }).toList();
    }
  }
}
