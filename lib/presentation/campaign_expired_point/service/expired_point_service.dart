import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/campaign_earned_points/model/trasnactionmodel.dart';

class ExpiredPointsService {
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
      'from_date': '01-01-$year',
      'to_date': '31-12-$year',
      'transaction_type': '12,13'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final jsonResponse = json.decode(responseBody);
      final List<dynamic> transactionsJson =
          jsonResponse['data'] as List<dynamic>;
      print('sdkhfgf $transactionsJson');

      final List<Transaction> transactions =
          transactionsJson.map((json) => Transaction.fromJson(json)).toList();
      return transactions;
    } else {
      throw Exception('Failed to load transactions: ${response.reasonPhrase}');
    }
  }

  Future<List<Transaction>> allTransactions() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=3v816ufkhvi2pp93flfdfpoe87ktt843'
    };
    var request = http.Request('POST', Uri.parse(Url.getprogramtransaction));
    request.bodyFields = {
      'company_id': companyId!,
      'user_id': userId!,
      'transaction_type': '12,13'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final jsonResponse = json.decode(responseBody);
      final List<dynamic> transactionsJson =
          jsonResponse['data'] as List<dynamic>;
      print('sdkhfgf $transactionsJson');

      final List<Transaction> transactions =
          transactionsJson.map((json) => Transaction.fromJson(json)).toList();
      return transactions;
    } else {
      throw Exception(
          'Failed to load all transactions: ${response.reasonPhrase}');
    }
  }
}
