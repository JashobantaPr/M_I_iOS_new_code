import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';

import '../controller/mybudget_viewdetails_controller.dart';
import '../model/mybudget_viewdetails_model.dart';

class Transactiondetail {
  final CacheService _cacheService = CacheService();

  Future<List<ViewDetailsModel>?> transactiondata() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    final data = Get.find<MyBudgetViewDetailsController>();

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=0k70on4816p7fuuducu463cc78fivqj5'
    };

    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis//budget/view_my_budget_details'));
    request.bodyFields = {
      'transactionId': data.data.transactionId,
      'company_id': companyId!,
      'user_id': userId!
    };
    request.headers.addAll(headers);
    print('Request body: ${request.body}');

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      final List<dynamic> dataList = jsonResponse['data'];
      print('Data list: $dataList');

      if (dataList.isNotEmpty) {
        List<ViewDetailsModel> transactions =
            dataList.map((data) => ViewDetailsModel.fromJson(data)).toList();
        return transactions;
      } else {
        print('No data found.');
        return null;
      }
    } else {
      print('Failed to fetch data: ${response.reasonPhrase}');
    }
    return null;
  }
}
