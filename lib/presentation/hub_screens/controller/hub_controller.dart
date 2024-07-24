import 'package:flutter/material.dart';
import 'package:incentivesgit/presentation/hub_screens/model/hub_model.dart';
import 'package:incentivesgit/presentation/hub_screens/model/searchmodel.dart';
import 'package:incentivesgit/presentation/hub_screens/service/hubservice.dart';

import '../../../core/app_export.dart';

class HubController extends GetxController {

  TextEditingController searchController = TextEditingController();
  var isTrainingInfoExpanded = false.obs;
  var traininghub = <Section>[].obs;
  var isSearchVisible = false.obs;
  var expandedSectionIndex = (-1).obs;
  // To store search results
  var isSearching = false.obs; // To track if a search is active
  var searchResults = <SearchContent>[].obs;

  void toggleTrainingInfo() {
    isTrainingInfoExpanded.value = !isTrainingInfoExpanded.value;
  }

  void toggleSearch() {
    isSearchVisible.value = !isSearchVisible.value;
  }
    void toggleSearch1() {
    isSearchVisible.value = !isSearchVisible.value;
  }

  @override
  void onInit() {
    super.onInit();
    hubSectionList();
  }

  void hubSectionList() async {
    try {
      var fetchedSections = await HubService().getHubSection();
      if (fetchedSections != null) {
        traininghub.value = fetchedSections;
      }
    } catch (e) {
      print("Failed to fetch sections: $e");
    }
  }

  void search(String keyword) async {
    try {
      if (keyword.isNotEmpty) {
        var searchResults = await HubService().hubSearch(keyword);
        this.searchResults.value = searchResults;
        isSearching.value = true; // Set isSearching to true
      } else {
        // If keyword is empty, clear search results
        // searchResults.clear();
      }
    } catch (e) {
      print("Failed to perform search: $e");
    }
  }

  void clearSearch() {
    isSearching.value = false;
    searchResults.clear();
  }
}
