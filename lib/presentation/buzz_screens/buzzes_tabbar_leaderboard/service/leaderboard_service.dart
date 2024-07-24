import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzzes_tabbar_leaderboard/model/leaderboaerd_model.dart';

class BuzzLeaderService {
  final CacheService _cacheService = CacheService();

  Future<ApiResponse?> fetchLeaderBoardData() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=vv37dm4a1tb7meubkni02llg8b9ml2lt'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis/engagements/buzzz_leaderboard'));
    request.bodyFields = {
      'company_id': companyId!,
      'scope_id': '167',
      'user_id': userId!,
      'financial_year_from': '01-04-2024',
      'financial_year_to': '31-03-2025'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      print('leaderboardbuzz$responseBody');
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      return ApiResponse.fromJson(jsonResponse);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
