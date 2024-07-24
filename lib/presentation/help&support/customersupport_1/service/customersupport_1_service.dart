import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/help&support/customersupport_1/models/ticketsummary_model.dart';

class HelpAndSupportService {
  final CacheService _cacheService = CacheService();

  Future<TicketSummary?> ticketSummary() async {
    String? userId = await _cacheService.getUserId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=br8rsl384ag7v4sv5dmokh8c7den6mv2'
    };
    var request = http.Request('POST', Uri.parse(Url.getticketsummary));
    request.bodyFields = {'user_id': userId!};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String? json = await response.stream.bytesToString();
      final jsonResponse = jsonDecode(json);
      return TicketSummary.fromJson(jsonResponse);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<String> listUserTickets() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=a3e29egvb0aiqf6mm6scqbuh66o1fvrs'
    };
    var request = http.Request('POST', Uri.parse(Url.listusertickets));
    request.bodyFields = {'user_id': userId!, 'company_id': companyId!};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String json = await response.stream.bytesToString();
      return json;
    } else {
      print(response.reasonPhrase);
      return '';
    }
  }
}
