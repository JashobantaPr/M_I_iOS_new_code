import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incentivesgit/presentation/hub%20-%201/model/hub1_model.dart';
import 'package:incentivesgit/presentation/hub%20-%201/service/hub1Service.dart';

class Hub1Controller extends GetxController {

  
  List<String> years = ['2021', '2024'];

  RxString selectedYear = '2024'.obs; // Set default selected year
  var isSearchVisible = false.obs; //
  var pdfFiles = <File>[].obs;
  var mp4Files = <File>[].obs;
  var originalPdfFiles = <File>[].obs; // To store original PDF files
  var originalMp4Files = <File>[].obs; // To store original MP4 files
  var isSearching = false.obs;
  var searchResults = <File>[].obs;
  var sectionName = ''.obs; // To store section name
  TextEditingController searchController = TextEditingController();

  

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
    filterSectionFile();
  }

  void hubSectionList() async {
    try {
      final fetchedFiles = await HubSectionFilesService().getHubSectionFiles();
      if (fetchedFiles != null) {
        // Set the section name
        sectionName.value = fetchedFiles['section_detail']['section_name'];
        
        final pdfSection = fetchedFiles['section_files'].firstWhere(
          (section) => section['file_type'] == 'Pdf',
          orElse: () => null,
        );
        final mp4Section = fetchedFiles['section_files'].firstWhere(
          (section) => section['file_type'] == 'Mp4',
          orElse: () => null,
        );

        if (pdfSection != null) {
          originalPdfFiles.assignAll((pdfSection['files'] as List)
              .map<File>((file) => File.fromJson(file))
              .toList());
          pdfFiles.assignAll(originalPdfFiles);
        }

        if (mp4Section != null) {
          originalMp4Files.assignAll((mp4Section['files'] as List)
              .map<File>((file) => File.fromJson(file))
              .toList());
          mp4Files.assignAll(originalMp4Files);
        }
      }
    } catch (e) {
      print("Failed to fetch section files: $e");
    }
  }

  void filterSectionFile() async {
    try {
      final fetchedFiles = await HubSectionFilesService()
          .getHubFilterSectionFile(selectedYear.value);

      if (fetchedFiles != null) {
        final pdfSection = fetchedFiles['section_files'].firstWhere(
          (section) => section['file_type'] == 'Pdf',
          orElse: () => null,
        );
        final mp4Section = fetchedFiles['section_files'].firstWhere(
          (section) => section['file_type'] == 'Mp4',
          orElse: () => null,
        );

        originalPdfFiles.clear();
        originalMp4Files.clear();

        if (pdfSection != null) {
          originalPdfFiles.assignAll((pdfSection['files'] as List)
              .map<File>((file) => File.fromJson(file))
              .toList());
          pdfFiles.assignAll(originalPdfFiles);
        }

        if (mp4Section != null) {
          originalMp4Files.assignAll((mp4Section['files'] as List)
              .map<File>((file) => File.fromJson(file))
              .toList());
          mp4Files.assignAll(originalMp4Files);
        }
      }
    } catch (e) {
      print("Failed to fetch filtered section files: $e");
    }
  }

  void updateSelectedYear(String year) {
    selectedYear.value = year;
    filterSectionFile();
  }

  void filterFilesByName(String query) {
    // Filter PDF files by name
    var filteredPdfFiles = originalPdfFiles.where((file) =>
        file.documentName.toLowerCase().contains(query.toLowerCase()));

    // Filter MP4 files by name
    var filteredMp4Files = originalMp4Files.where((file) =>
        file.documentName.toLowerCase().contains(query.toLowerCase()));

    // Update the lists with filtered files
    pdfFiles.assignAll(filteredPdfFiles.toList());
    mp4Files.assignAll(filteredMp4Files.toList());
  }

  void clearSearch() {
    isSearching.value = false;
    searchController.clear();
    pdfFiles.assignAll(originalPdfFiles);
    mp4Files.assignAll(originalMp4Files);
  }
}
