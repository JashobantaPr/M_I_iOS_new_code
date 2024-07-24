import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/help&support/customer_support_5/model/customer_support_5_model.dart';
import 'package:incentivesgit/presentation/help&support/customer_support_5/service/customer_support_5_service.dart';
import 'package:incentivesgit/presentation/homebottombar/account/service/my_account_service.dart';

class HelpandSupportCustomerSupport5Controller extends GetxController {
  Rx<TicketDetailsResponse?> ticketDetailsResponse =
      Rx<TicketDetailsResponse?>(null);
  final ticketId = RxString('');
  var firstName = ''.obs;
  var lastName = ''.obs;
  var profilePic = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTicketDetails();
    getArguments();
    fetchuserData();
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
    try {
      print('Fetching ticket details...');
      var response = await CustomerSupport5Service().ticketdetails(ticketId);
      print('esrdtfyguhi$response');
      if (response != null) {
        ticketDetailsResponse.value = response;
        print('Ticket details fetched successfully');
      } else {
        print('Failed to fetch ticket details');
      }
    } catch (e) {
      print("Failed to fetch ticket details: $e");
    }
  }

  void fetchuserData() async {
    try {
      final fetchedData = await MyAccountService().primerydata();
      if (fetchedData != null) {
        firstName.value = fetchedData['first_name'] ?? '';
        lastName.value = fetchedData['last_name'] ?? '';
        profilePic.value = fetchedData['profile_pic'] ?? '';
      } else {
        print('No data fetched or data is null');
      }
    } catch (e) {
      print("Failed to fetch ProfiletabData: $e");
    }
  }
}
