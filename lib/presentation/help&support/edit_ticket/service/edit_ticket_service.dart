import 'dart:convert';

import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/help&support/edit_ticket/model/edit_ticket_model.dart';
import 'package:incentivesgit/presentation/help&support/edit_ticket/model/editticketmodel.dart';
import 'package:incentivesgit/presentation/help&support/edit_ticket/model/getticketmodel.dart';

class EditTicketService {
  final CacheService _cacheService = CacheService();

  Future<List<TicketCategory>> getTicketCategories() async {
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/json',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=851d3d9ntndjiol2e8qshkc1c3bb2pqh'
    };
    var request = http.Request('GET', Uri.parse('${Url.getcategories}'));
    request.bodyFields = {};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      print('customersupport2$responseBody');
      List<dynamic> jsonList = jsonDecode(responseBody)['categoies'];
      return TicketCategory.listFromJson(jsonList);
    } else {
      print(response.reasonPhrase);
      return [];
    }
  }

  Future<void> addticket(Map<String, String> bodyFields) async {
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=k1atp7givporgac9225jchdfl1oohlq0'
    };
    var request = http.Request('POST', Uri.parse('${Url.updateticket}'));
    request.bodyFields = bodyFields;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      Get.dialog(const EditTicketModal(), barrierDismissible: false);
      String responseBody = await response.stream.bytesToString();
      print('customersupport2$responseBody');
      var jsonList = jsonDecode(responseBody);
      return jsonList;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<TicketDetailsResponse?> ticketdetails(ticketId) async {
    String? companyId = await _cacheService.getCompanyId();
    String? userId = await _cacheService.getUserId();

    print('ticketIdticketIdvticketId$ticketId');

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=ao2v8r3s0gigjjhjokdo3ko2mrj7m2p0'
    };
    var request = http.Request('POST', Uri.parse('${Url.getticketdetails}'));
    request.bodyFields = {'user_id': userId!, 'ticket_id': ticketId.toString()};
    request.headers.addAll(headers);

    http.StreamedResponse response;

    try {
      response = await request.send();
    } catch (e) {
      print('Failed to send request: $e');
      return null;
    }

    if (response.statusCode == 200) {
      try {
        String responseBody = await response.stream.bytesToString();
        print('customersupport$responseBody');
        return ticketDetailsResponseFromJson(responseBody);
      } catch (e) {
        print('Failed to parse response: $e');
        return null;
      }
    } else {
      print('Request failed with status: ${response.statusCode}');
      print('Reason: ${response.reasonPhrase}');
      return null;
    }
  }
}
