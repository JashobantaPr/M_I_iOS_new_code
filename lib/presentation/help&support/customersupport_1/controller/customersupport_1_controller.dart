import 'dart:convert';

import 'package:get/get.dart';
import 'package:incentivesgit/presentation/help&support/customersupport_1/models/list_user_ticket_model.dart';
import 'package:incentivesgit/presentation/help&support/customersupport_1/models/ticketsummary_model.dart';
import 'package:incentivesgit/presentation/help&support/customersupport_1/service/customersupport_1_service.dart';

import '../../../../core/app_export.dart';

class CustomerSupport1Controller extends GetxController {
  var ticketSummary = TicketSummary().obs;

  var tickets = <UserTicket>[].obs;

  @override
  void onInit() {
    fetchTicketSummary();
    fetchticketsList();
    super.onInit();
  }

  void fetchticketsList() async {
    var data = await HelpAndSupportService().listUserTickets();
    if (data != null) {
      var jsonResponse = jsonDecode(data);
      tickets.value = (jsonResponse['data'] as List)
          .map((ticket) => UserTicket.fromJson(ticket))
          .toList();
    }
  }

  void fetchTicketSummary() async {
    TicketSummary? data = await HelpAndSupportService().ticketSummary();
    if (data != null) {
      ticketSummary.value = data;
      // Example usage
      print('Closed tickets: ${ticketSummary.value.closed}');
    } else {
      print('Failed to fetch ticket summary.');
    }
  }

  int parsePoints(String? pointsStr) {
    if (pointsStr == null) {
      return 0;
    }
    // Ensure to parse the string as an int
    return int.tryParse(pointsStr) ?? 0;
  }
}
