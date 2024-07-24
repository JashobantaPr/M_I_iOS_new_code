import 'dart:convert';

import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/help&support/customer_support_2/model/addticketmodel.dart';
import 'package:incentivesgit/presentation/help&support/customer_support_2/model/customer_support_2_model.dart';

class CustomerSupport2Service {
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
    var request = http.Request('POST', Uri.parse('${Url.raiseuserticket}'));
    request.bodyFields = bodyFields;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      Get.dialog(const AddTicketModal(), barrierDismissible: false);

      String responseBody = await response.stream.bytesToString();
      print('customersupport2$responseBody');
      var jsonList = jsonDecode(responseBody);
      return jsonList;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
