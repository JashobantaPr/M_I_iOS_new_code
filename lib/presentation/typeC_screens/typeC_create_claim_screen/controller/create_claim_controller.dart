import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_create_claim_screen/model/sku_data_model.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_create_claim_screen/service/createclaimservice.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_createclaim_management/model/typeC_createclaim_management_model.dart';
import 'package:intl/intl.dart';

class CreateClaimController extends GetxController {
  final CacheService _cacheService = CacheService();
  TextEditingController invoicenumbercontroller = TextEditingController();
  TextEditingController invoiceclaimcontroller = TextEditingController();
  TextEditingController dateTextController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController singlefilecontroller = TextEditingController();
  TextEditingController multiplefilecontroller = TextEditingController();
  TextEditingController villagecontroller = TextEditingController();
  TextEditingController citynamecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();

  var errors = {}.obs;
  var postId = Get.arguments;
  var showAllData = false.obs;
  var addclaimdetails = ClaimData().obs;
  var approvalMessage = ''.obs;
  RxString selectedSKU = RxString('');
  var searchQuery = ''.obs;
  var skuList = <SkuData>[].obs;
  var filteredSkuList = <SkuData>[].obs;

  var countrynodes = <HierarchyNode>[].obs;
  var statesnodes = <HierarchyNode>[].obs;
  var citynodes = <HierarchyNode>[].obs;
  var storenodes = <HierarchyNode>[].obs;

  var isLoading = true.obs;

  var countrynodesValue = Rx<String?>(null);
  var statesnodesValue = Rx<String?>(null);
  var citynodesValue = Rx<String?>(null);
  var storenodesValue = Rx<String?>(null);

//product hierarcy
  var brandnodes = <ProductHierarchyLevelData>[].obs;
  var brandnodesValue = Rxn<String>();

  var productnodes = <ProductHierarchyLevelData>[].obs;
  var productnodesValue = Rxn<String>();

  var editionnodes = <ProductHierarchyLevelData>[].obs;
  var editionnodesValue = Rxn<String>();

  var skunodes = <ProductHierarchyLevelData>[].obs;
  var skunodesValue = Rxn<String>();
  var skuLabel = RxString('');
  var checkbox1 = false.obs;
  var checkbox2 = false.obs;
  var checkbox3 = false.obs;
  var checkbox4 = false.obs;
  var selectedDate = DateTime.now().obs;
  var radioButtonValue = 0.obs;

  void toggleShowAllData() {
    showAllData.value = !showAllData.value;
  }

  void filterSkuList(String searchTerm) {
    if (searchTerm.isEmpty) {
      filteredSkuList.value = skuList; // Reset to original if no search
    } else {
      filteredSkuList.value = skuList.where((sku) {
        return sku.code.toLowerCase().contains(searchTerm.toLowerCase());
      }).toList();
    }
  }

  bool validateForm() {
    errors.clear();
    if (invoicenumbercontroller.text.isEmpty) {
      errors['selectsku'] = 'This field is required';
    }
    if (invoicenumbercontroller.text.isEmpty) {
      errors['invoiceNumber'] = 'This field is required';
    }
    if (invoiceclaimcontroller.text.isEmpty) {
      errors['invoiceClaim'] = 'This field is required';
    }
    if (dateTextController.text.isEmpty) {
      errors['date'] = 'This field is required';
    }
    if (numberController.text.isEmpty) {
      errors['number'] = 'This field is required';
    }
    if (singlefilecontroller.text.isEmpty) {
      errors['singleFile'] = 'This field is required';
    }
    if (multiplefilecontroller.text.isEmpty) {
      errors['multipleFile'] = 'This field is required';
    }
    if (villagecontroller.text.isEmpty) {
      errors['village'] = 'This field is required';
    }
    if (citynamecontroller.text.isEmpty) {
      errors['cityName'] = 'This field is required';
    }
    if (descriptioncontroller.text.isEmpty) {
      errors['description'] = 'This field is required';
    }

    return errors.isEmpty;
  }

  void claimdetails() async {
    isLoading.value = true;
    var claimdetails =
        await AddclaimforApprovalSku().fetchAddClaimDetails(postId);
    if (claimdetails != null) {
      addclaimdetails.value = claimdetails;
      var countryNodes = claimdetails.hierarchyNodes
              ?.where((node) => node.levelRank == "1")
              .toList() ??
          [];
      var nodes = claimdetails.productHierarchyLevelData!
          .where((node) => node.levelRank == '1')
          .toList();

      if (nodes.isNotEmpty) {
        var dropdownValues = nodes
            .map((node) {
              var nodeId = node.hierarchyNodeId;
              var brandData = claimdetails.productHierarchyNodes![nodeId];
              if (brandData != null) {
                return node;
              }
              return null;
            })
            .whereType<ProductHierarchyLevelData>()
            .toList();

        brandnodes.value = dropdownValues;
      }

      countrynodes.value = countryNodes;
    }
    isLoading.value = false;
  }

  void countryselected(String? countryId) {
    statesnodes.value = addclaimdetails.value.hierarchyNodes
            ?.where((node) => node.parentNodeId == countryId)
            .toList() ??
        [];
    statesnodesValue.value = null;
    //  citynodes.value = [];
    citynodesValue.value = null;
    storenodesValue.value = null;
  }

  void stateselected(String? stateId) {
    citynodes.value = addclaimdetails.value.hierarchyNodes
            ?.where((node) => node.parentNodeId == stateId)
            .toList() ??
        [];
    citynodesValue.value = null;
  }

  void storeselected(String? storeId) {
    storenodes.value = addclaimdetails.value.hierarchyNodes
            ?.where((node) => node.parentNodeId == storeId)
            .toList() ??
        [];
    storenodesValue.value = null;
  }

  // Method to handle brand selection
  void brandselected(String? brandId) {
    productnodes.value = addclaimdetails.value.productHierarchyLevelData
            ?.where((node) => node.parentNode == brandId)
            .toList() ??
        [];
    productnodesValue.value = null;
    editionnodesValue.value = null;
    skunodesValue.value = null;
  }

  // Method to handle product selection
  void productselected(String? productId) {
    editionnodes.value = addclaimdetails.value.productHierarchyLevelData
            ?.where((node) => node.parentNode == productId)
            .toList() ??
        [];
    editionnodesValue.value = null;
    skunodesValue.value = null;
  }

  // Method to handle edition selection
  void editionselected(String? editionId) {
    skunodes.value = addclaimdetails.value.productHierarchyLevelData
            ?.where((node) => node.parentNode == editionId)
            .toList() ??
        [];

    skunodesValue.value = null;
  }

  void skuselected(String? skuId, String? label) {
    skunodesValue.value = skuId;
    skuLabel.value = label ?? '';
  }

  // Method to toggle checkbox values
  void toggleCheckbox(int checkboxIndex, bool value) {
    switch (checkboxIndex) {
      case 1:
        checkbox1.value = value;
        break;
      case 2:
        checkbox2.value = value;
        break;
      case 3:
        checkbox3.value = value;
        break;
      case 4:
        checkbox4.value = value;
        break;
    }
  }

  // Method to select a date
  void selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blueAccent.shade400,
            colorScheme: const ColorScheme.light(
              onPrimary: Colors.white,
              onSurface: Colors.black,
              secondary: Colors.black,
              onSecondary: Colors.white,
            ),
            dialogBackgroundColor: Colors.white,
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
              buttonColor: Colors.purple,
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      selectedDate.value = pickedDate;
      dateTextController.text = DateFormat('dd-MM-yyyy').format(pickedDate);
    }
  }

  // Method to handle radio button selection
  void handleRadioValueChanged(int value) {
    radioButtonValue.value = value;
  }

  // Method to check if a radio button is selected
  bool isRadioButtonSelected(int value) {
    return radioButtonValue.value == value;
  }

  // Method to reset radio button selection
  void resetRadioButtons() {
    radioButtonValue.value = 0;
  }

  Future<String?> submitApprovalRequest() async {
    String? companyCode = await _cacheService.getCompanyCode();
    isLoading.value = true;

    var bodyFields = <String, String>{
      'sku_code': selectedSKU.value,
      'company_code': companyCode!,
      'invoice_id': invoicenumbercontroller.text,
      'quantity': invoiceclaimcontroller.text,
      'program_id': postId,
      'invoice_image': singlefilecontroller.text,
      'fields_json': addclaimdetails.value.customFieldsJson ?? '',
      'claim_type': addclaimdetails.value.claimType ?? '',
      'approval_workflow_type': addclaimdetails.value.approvalType ?? '',
      // 'total_invoice_value': numberController.text,
      'highest_product_hierarchy_level_rank':
          addclaimdetails.value.highestProductHierarchyLevelRank ?? '',
    };

    // Call the service method
    var approvalStatus =
        await AddclaimforApprovalSku().approvalStatus(bodyFields);

    if (approvalStatus != null) {
      if (approvalStatus['status'] == true) {
        approvalMessage.value = approvalStatus['msg'] ?? 'Approval successful!';
        return approvalMessage.value;
      } else {
        approvalMessage.value = approvalStatus['error'] ?? 'Approval failed.';
        return approvalMessage.value;
      }
    } else {
      approvalMessage.value = 'Error: Null response received.';
    }
    isLoading.value = false;
    return '';
  }

  Future<void> fetchSkuData() async {
    isLoading.value = true;

    // Call the service method
    var codes = await AddclaimforApprovalSku().getskudata(postId);
    if (codes != null && codes.isNotEmpty) {
      skuList.value = codes;
      filteredSkuList.value = skuList;
    }

    isLoading.value = false;
  }

  void chooseFile() async {
    // Open file picker
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      // Update text in TextField with the selected file's name
      String? fileName = result.files.single.name;
      singlefilecontroller.text = fileName;
    } else {
      // User canceled the picker
      print('User canceled the file picking.');
    }
  }

  void choosemultipleFile() async {
    // Open file picker
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      // Update text in TextField with the selected file's name
      String? fileName = result.files.single.name;
      multiplefilecontroller.text = fileName;
    } else {
      // User canceled the picker
      print('User canceled the file picking.');
    }
  }

  void chooseFileCamera() async {
    // Open file picker
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // Update text in TextField with the selected file's name
      String? fileName = pickedFile.name;
      singlefilecontroller.text = fileName;
    } else {
      // User canceled the picker
      print('User canceled the file picking.');
    }
  }

  void choosemultipleFileCamera() async {
    // Open file picker
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // Update text in TextField with the selected file's name
      String? fileName = pickedFile.name;
      multiplefilecontroller.text = fileName;
    } else {
      // User canceled the picker
      print('User canceled the file picking.');
    }
  }

  void updateSelectedSKU(String sku) {
    selectedSKU.value = sku;
  }


  void clearError(String key) {
    if (errors.containsKey(key)) {
      errors.remove(key);
    }
  }

  @override
  void onInit() {
    super.onInit();
    claimdetails();
    fetchSkuData();
    invoicenumbercontroller.addListener(() => clearError('invoiceNumber'));
    invoiceclaimcontroller.addListener(() => clearError('invoiceClaim'));
    dateTextController.addListener(() => clearError('date'));
    numberController.addListener(() => clearError('number'));
    singlefilecontroller.addListener(() => clearError('singleFile'));
    multiplefilecontroller.addListener(() => clearError('multipleFile'));
    villagecontroller.addListener(() => clearError('village'));
    citynamecontroller.addListener(() => clearError('cityName'));
    descriptioncontroller.addListener(() => clearError('description'));
  }

  @override
  void dispose() {
    invoicenumbercontroller.dispose();
    invoiceclaimcontroller.dispose();
    dateTextController.dispose();
    numberController.dispose();
    singlefilecontroller.dispose();
    multiplefilecontroller.dispose();
    villagecontroller.dispose();
    citynamecontroller.dispose();
    descriptioncontroller.dispose();
    super.dispose();
  }
}
