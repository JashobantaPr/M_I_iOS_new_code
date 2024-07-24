import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';

import '../controller/selectwallet_viewdetails_controller.dart';
import '../model/selectwallet_viewdetails_model.dart';

class Transactiondetail {
  final CacheService _cacheService = CacheService();
  Future<ViewDetailsModel?> transactiondata() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    final data = Get.find<SelectWalletViewDetailsController>();
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
            'https://staging.myincentives.co.in/index.php/apis//budget/get_wallet_details'));
    request.bodyFields = {
      'trans_id': data.data.transactionId,
      'budget_cat_code': data.data.bucketCode,
      'c_id': companyId!,
      'user_id': userId!
    };
    print('hello${request.body}');
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      final dataList = jsonResponse['transactions'];
      print('dataList$dataList');
      if (dataList.isNotEmpty) {
        final Map<String, dynamic> data = dataList as Map<String, dynamic>;
        return ViewDetailsModel.fromJson(data);
      } else {
        print('No data found.');
        return null;
      }
    } else {
      print(response.reasonPhrase);
    }
    return null;
  }
}
