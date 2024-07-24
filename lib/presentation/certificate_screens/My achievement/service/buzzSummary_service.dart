import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'dart:convert';

import 'package:incentivesgit/presentation/certificate_screens/My%20achievement/model/certificate_model.dart';

class BuzzSummaryService {
  final CacheService _cacheService = CacheService();

  Future<LeaderData> fetchLeaderBoardData() async {
    String? companyId = await _cacheService.getCompanyId();
    String? userId = await _cacheService.getUserId();
    final scopeid = await _cacheService.getCache(SCOP_ID);
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=cr18c90nfb6ilkbr4p57tv6pke2lhrac'
    };
    var request = http.Request('POST', Uri.parse(Url.myAchievement));
    request.bodyFields = {
      'company_id': companyId!,
      'scope_id': scopeid,
      'user_id': userId!,
      'financial_year_from': '01-04-2024',
      'financial_year_to': '31-03-2025'
    };
    request.headers.addAll(headers);
    print('scopeidzz$scopeid');

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      final jsonResponse = json.decode(responseBody);

      // Assuming the JSON structure is something like {'count': 'value'}
      // Make sure to adjust this according to the actual JSON structure
      String count = jsonResponse['count'];

      print('Count: $count');

      return LeaderData(count: count);
    } else {
      throw Exception(
          'Failed to load leaderboard data: ${response.reasonPhrase}');
    }
  }
}
