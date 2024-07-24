import 'dart:convert';

import 'package:incentivesgit/core/app_export.dart';

import '../model/view_all_trancition.dart';
import '../model/view_balance.dart';
import '../services/my_budget_services.dart';

class MyBudgetBalanceController extends GetxController {
  var searchQuery = ''.obs;
  RxBool isLoading = false.obs;

  RxList<mybalancemodel> viewMyBalanceData = <mybalancemodel>[].obs;
  RxList<ViewAllTransition> viewAllTrancitionData = <ViewAllTransition>[].obs;

  @override
  void onInit() {
    super.onInit();
    viewBudgetBalance();
    viewAllTransition();
  }

  Future<void> viewBudgetBalance() async {
    isLoading(true);

    final response = await myBudgetServices().viewBudgetBalance();
    if (response != null) {
      print('Response: $response');
      mybalancemodel balanceModel = mybalancemodel.fromJson(response);
      if (balanceModel.data != null) {
        viewMyBalanceData.value = [balanceModel];
        print('viewMyWalletdata: ${viewMyBalanceData.length}');
        print('Company ID: ${balanceModel.data!.comid}');

        // Print other data fields as needed
      }
    }
    isLoading(false);
  }

  Future<void> viewAllTransition() async {
    isLoading(true);

    final response = await myBudgetServices().viewAllTransitionService();

    if (response != null) {
      print('response: $response');
      Map<String, dynamic> jsonResponse = json.decode(response);
      if (jsonResponse.containsKey('list')) {
        List<dynamic> transactionsList = jsonResponse['list'];
        viewAllTrancitionData.clear();
        for (var transaction in transactionsList) {
          viewAllTrancitionData.add(ViewAllTransition.fromJson(transaction));
          print('viewAllTrancitionData${viewAllTrancitionData.value}');
        }
      }
    }

    isLoading(false);
  }
}
