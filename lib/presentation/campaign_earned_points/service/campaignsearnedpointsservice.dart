import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/campaign_earned_points/model/trasnactionmodel.dart';

class CampaignEarnedPointsService {
  final CacheService _cacheService = CacheService();

  Future<List<String?>> campaignsdropdown() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=lb8hfho1dv41q13s0dd6t02jp7951bp4'
    };
    var request = http.Request('POST', Uri.parse(Url.getparticipantprograms));
    request.bodyFields = {'company_id': companyId!, 'user_id': userId!};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      final programsParticipant =
          jsonResponse['programs_participant'] as List<dynamic>;

      // Extract names and ensure unique values
      return programsParticipant
          .map((program) => program['name'] as String?)
          .toSet()
          .toList();
    } else {
      print(response.reasonPhrase);
      return [];
    }
  }

  Future<List<int?>> yearDropdown() async {
    String? userId = await _cacheService.getUserId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=1u7v66fg8uk520o0j8hjc23jbirhap7q'
    };
    var request = http.Request('POST', Uri.parse(Url.getfilteryear));
    request.bodyFields = {'user_id': userId!};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      final programsParticipant = jsonResponse['date_range'] as List<dynamic>;
      List<int?> years =
          programsParticipant.map<int?>((value) => value as int?).toList();

      return years;
    } else {
      print(response.reasonPhrase);
      return [];
    }
  }

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
      'transaction_type': '3'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final jsonResponse = json.decode(responseBody);
      final List<dynamic> transactionsJson =
          jsonResponse['data'] as List<dynamic>;

      return transactionsJson
          .map((json) => Transaction.fromJson(json))
          .toList();
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
      'transaction_type': '3'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final jsonResponse = json.decode(responseBody);
      final List<dynamic> transactionsJson =
          jsonResponse['data'] as List<dynamic>;
      final List<Transaction> transactions = transactionsJson
          .where((json) =>
              double.tryParse(json['points'].toString()) != null &&
              double.parse(json['points'].toString()) > 0)
          .map((json) => Transaction.fromJson(json))
          .toList();
      return transactions;
    } else {
      throw Exception(
          'Failed to load all transactions: ${response.reasonPhrase}');
    }
  }
}
