// import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_createclaim_management/model/slabmodel.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_createclaim_management/model/typeC_createclaim_management_model.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_createclaim_management/service/addformclaimservice.dart';
import 'package:intl/intl.dart';

class CreateClaimManagementController extends GetxController {
  final CacheService _cacheService = CacheService();
  TextEditingController invoicenumbercontroller = TextEditingController();
  TextEditingController invoicevaluecontroller = TextEditingController();
  TextEditingController dateTextController = TextEditingController();
  TextEditingController singlefilecontroller = TextEditingController();
  TextEditingController multiplefilecontroller = TextEditingController();
  TextEditingController villagecontroller = TextEditingController();
  TextEditingController citynamecontroller = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();

  var addclaimdetails = ClaimData().obs;
  var approvalMessage = ''.obs;
  var slabPoint = Rxn<SlabPoint>();
  var isChecked = false.obs;
  var postId = Get.arguments;

  //country hierarcy

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

  var errors = {}.obs;

  bool validateForm() {
    errors.clear();
    if (invoicenumbercontroller.text.isEmpty) {
      errors['invoiceNumber'] = 'This field is required';
    }
    if (invoicevaluecontroller.text.isEmpty) {
      errors['invoicevalue'] = 'This field is required';
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
    if (countrynodesValue.value == null) {
      errors['state'] = 'This field is required';
    }
    if (countrynodesValue.value == null) {
      errors['city'] = 'This field is required';
    }
    if (countrynodesValue.value == null) {
      errors['brand'] = 'This field is required';
    }
    if (countrynodesValue.value == null) {
      errors['product'] = 'This field is required';
    }
    if (countrynodesValue.value == null) {
      errors['edition'] = 'This field is required';
    }
    if (countrynodesValue.value == null) {
      errors['skunodes'] = 'This field is required';
    }

    return errors.isEmpty;
  }

  void claimdetails() async {
    isLoading.value = true;
    var claimdetails = await AddclaimforApproval().fetchAddClaimDetails(postId);
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

  // Observable variables for checkboxes
  var checkbox1 = false.obs;
  var checkbox2 = false.obs;
  var checkbox3 = false.obs;
  var checkbox4 = false.obs;

  // Observable variable for selected date
  var selectedDate = DateTime.now().obs;

  // Observable variable for radio button value
  var radioButtonValue = 0.obs;

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
              buttonColor: Colors.black,
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
    isLoading.value = true;
    String? companyCode = await _cacheService.getCompanyCode();

    // Gather all necessary data
    var bodyFields = <String, String>{
      'sku_code': skuLabel.value,
      'company_code': companyCode!,
      'invoice_id': invoicenumbercontroller.text,
      'quantity': invoicevaluecontroller.text,
      'program_id': postId,
      'invoice_image': singlefilecontroller.text,
      'fields_json': addclaimdetails.value.customFieldsJson ?? '',
      'claim_type': addclaimdetails.value.claimType ?? '',
      'approval_workflow_type': addclaimdetails.value.approvalType ?? '',
      'total_invoice_value': invoicevaluecontroller.text,
      'highest_product_hierarchy_level_rank':
          addclaimdetails.value.highestProductHierarchyLevelRank ?? '',
    };

    // Call the service method
    var approvalStatus = await AddclaimforApproval().approvalStatus(bodyFields);

    if (approvalStatus != null) {
      if (approvalStatus['status'] == true) {
        approvalMessage.value = approvalStatus['msg'] ?? 'Approval successful!';
        return approvalMessage.value;
      } else {
        print('jhdh ${approvalStatus['error']}');
        approvalMessage.value = approvalStatus['error'] ?? 'Approval failed.';
        return approvalMessage.value;
      }
    } else {
      approvalMessage.value = 'Error: Null response received.';
    }
    isLoading.value = false;
    return null;
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

  void _onTextChanged() async {
    if (invoicevaluecontroller.text.isNotEmpty) {
      final data = await AddclaimforApproval()
          .slabData(invoicevaluecontroller.text, postId);
      slabPoint.value = data;
    } else {
      slabPoint.value = null;
    }
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
    invoicevaluecontroller.addListener(_onTextChanged);
    invoicenumbercontroller.addListener(() => clearError('invoiceNumber'));
    invoicevaluecontroller.addListener(() => clearError('invoicevalue'));
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
    invoicenumbercontroller.clear();
    invoicevaluecontroller.clear();
    dateTextController.clear();
    singlefilecontroller.clear();
    multiplefilecontroller.clear();
    villagecontroller.clear();
    citynamecontroller.clear();
    numberController.clear();
    descriptioncontroller.clear();

    super.dispose();
  }
}
