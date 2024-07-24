import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'dart:io';

import 'package:incentivesgit/presentation/help&support/edit_ticket/model/edit_ticket_model.dart';
import 'package:incentivesgit/presentation/help&support/edit_ticket/model/getticketmodel.dart';
import 'package:incentivesgit/presentation/help&support/edit_ticket/service/edit_ticket_service.dart';

class EditTicketController extends GetxController {
  List<TicketCategory> ticketCategories = <TicketCategory>[].obs;
  final TextEditingController mobilenumber = TextEditingController();
  final TextEditingController subjectline = TextEditingController();
  final TextEditingController messagecontroller = TextEditingController();
  final TextEditingController singlefilecontroller = TextEditingController();
  var selectedFile = Rxn<File>();
  var selectedCategory = Rxn<String>();
  final CacheService _cacheService = CacheService();
  var isLoading = true.obs;
  Rx<TicketDetailsResponse?> ticketDetailsResponse =
      Rx<TicketDetailsResponse?>(null);

  final ticketId = RxString('');

  @override
  void onInit() {
    super.onInit();
    fetchCustomerSupport2List();
    fetchTicketDetails();
    getArguments();
  }

  void getArguments() {
    final arguments = Get.arguments as Map<String, dynamic>;
    if (arguments != null) {
      ticketId.value = arguments['ticketId'];
      print('ticketId: ${ticketId.value}');
    } else {
      print('No arguments found');
    }
  }

  void fetchTicketDetails() async {
    print('sowjanya');
    try {
      print('Fetching ticket details...');
      var response = await EditTicketService().ticketdetails(ticketId);
      print('esrdtfyguhi$response');
      if (response != null) {
        ticketDetailsResponse.value = response;
        mobilenumber.text =
            ticketDetailsResponse.value?.ticketDetails?.phone ?? '';
        subjectline.text =
            ticketDetailsResponse.value?.ticketDetails?.subject ?? '';
        messagecontroller.text =
            ticketDetailsResponse.value?.ticketDetails?.description ?? '';
        selectedCategory.value =
            ticketDetailsResponse.value?.ticketDetails?.category;

        print('Ticket details fetched successfully');
      } else {
        print('Failed to fetch ticket details');
      }
    } catch (e) {
      print("Failed to fetch ticket details: $e");
    }
  }

  void fetchCustomerSupport2List() async {
    try {
      ticketCategories
          .assignAll(await EditTicketService().getTicketCategories());
    } catch (e) {
      print("Failed to fetch help user manual list: $e");
    }
  }

  void chooseFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      String? fileName = result.files.single.name;
      singlefilecontroller.text = fileName;
      selectedFile.value = File(result.files.single.path!);
    } else {
      print('User canceled the file picking.');
    }
  }

  void chooseFileCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      String? fileName = pickedFile.name;
      singlefilecontroller.text = fileName;
      selectedFile.value = File(pickedFile.path);
    } else {
      print('User canceled the file picking.');
    }
  }

  void uploadFile() async {
    if (selectedFile.value == null) {
      print('No file selected.');
      return;
    }
  }

  Future<void> addticket() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    String? companyCode = await _cacheService.getCompanyCode();

    try {
      isLoading.value = true;

      var bodyFields = {
        'company_id': '80',
        'user_id': '61493',
        'ticket_id': '19150',
        'subject': 'test2',
        'ticket_description': 'this is updated test ',
        'category': 'Technical Issue',
        'email': 'viru2.k@grgindia.in',
        'mobile_number': '0000000090',
        'file': '{{file}}'
      };

      print('bodyFieldsbodyFields$bodyFields');

      var fetches = await EditTicketService().addticket(bodyFields);
    } catch (e) {
      print('No Buzzes  $e');
    } finally {
      isLoading.value = false;
    }
  }
}
