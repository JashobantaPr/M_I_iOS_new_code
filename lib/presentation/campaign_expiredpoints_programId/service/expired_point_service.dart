import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';

import '../../campaign_earnedpoints_programId/model/trasnactionmodel.dart';

class ExpiredPointService {
  final CacheService _cacheService = CacheService();
  Future<List<Transaction>> transactiondata(int year) async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=3li9i5ep2vf8eafbbf3b9nvci2uj76bk'
    };
    var request = http.Request('POST', Uri.parse(Url.getprogramtransaction));
    request.bodyFields = {
      'company_id': companyId!,
      'user_id': userId!,
      'program_id': Get.arguments[1]['programId'],
      'to_date': '31-12-$year',
      'transaction_type': '12,13',
      'from_date': '01-01-$year'
    };
    print('lkskkks${request.bodyFields}');
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final jsonResponse = json.decode(responseBody);
      final List<dynamic> transactionsJson =
          jsonResponse['data'] as List<dynamic>;

      print('transactionsJson  $transactionsJson');

      return transactionsJson
          .map((json) => Transaction.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load transactions: ${response.reasonPhrase}');
    }
  }

  Future<List<Transaction>> transactiondataAll() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=3li9i5ep2vf8eafbbf3b9nvci2uj76bk'
    };
    var request = http.Request('POST', Uri.parse(Url.getprogramtransaction));
    request.bodyFields = {
      'company_id': companyId!,
      'user_id': userId!,
      'program_id': Get.arguments[1]['programId'],
      'transaction_type': '12,13',
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final jsonResponse = json.decode(responseBody);
      final List<dynamic> transactionsJson =
          jsonResponse['data'] as List<dynamic>;

      final data =
          transactionsJson.map((json) => Transaction.fromJson(json)).toList();
      return data;
    } else {
      throw Exception('Failed to load transactions: ${response.reasonPhrase}');
    }
  }
}
