import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/myWallet/myWallet_landing/service/myWallet_landing_service.dart';

import '../model/myWallet_landing_model.dart';
import '../model/viewMyTransition.dart';
import '../model/viewMyWallet.dart';

class MyWalletController extends GetxController {
  RxList<TypeLists> getWalleteData = <TypeLists>[].obs;
  RxList<viewmywallet> viewMyWalletdata = <viewmywallet>[].obs;
  RxList<ViewAllTransition> viewAllTrancitionData = <ViewAllTransition>[].obs;
  var searchQuery = ''.obs;
  PageController pageController = PageController();
  var currentIndex = 0.obs;
  var earnedPoints = ''.obs;
  String? redeemedPoints;
  var experiedPoints = ''.obs;
  var balancePoints = ''.obs;

  final isLoading = false.obs;
  void onPageChanged(int index) {
    currentIndex.value = index;
  }

  var items = <String>[].obs;
  RxBool isDropdownVisible = false.obs;

  Rx<String?> selectedValue = Rx<String?>(null);

  setLoading(bool value) {
    isLoading.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    getWalletData();
    viewMyWallet();
    viewAllTransition();
  }

  void toggleDropdownVisibility() {
    isDropdownVisible.value = !isDropdownVisible.value;
  }

  Future<void> getWalletData() async {
    setLoading(true);

    final response = await myWalletServices().getWalletDetails();

    if (response != null) {
      print('response: $response');

      getWalletModel walletModel = getWalletModel.fromJson(response);

      if (walletModel.typeLists != null) {
        getWalleteData.value = walletModel.typeLists!;

        // Update the dropdown items
        items.value = getWalleteData
            .map((e) => '${e.typeName} (Bal:${e.walletPoints})')
            .toList();
      }

      print('getWalleteData: ${getWalleteData.length}');
      print('items: ${items.value}');
    }

    setLoading(false);
  }

  Future<void> viewMyWallet() async {
    setLoading(true);

    final response = await myWalletServices().viewMyWallet();
    if (response != null) {
      print('Response: $response');
      viewmywallet walletModel = viewmywallet.fromJson(response);
      if (walletModel.data != null) {
        viewMyWalletdata.value = [walletModel];

        balancePoints.value =
            walletModel.data!.totalMywalletBalance!.sum.toString();

        print('viewMyWalletdata: ${viewMyWalletdata.length}');
        print('Company ID: ${walletModel.data!.comid}');

        // Print other data fields as needed
      }
    }
    setLoading(false);
  }

  Future<void> viewAllTransition() async {
    setLoading(true);

    final response = await myWalletServices().viewAllTransitionService();

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

    setLoading(false);
  }
}
