import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'dart:convert';

import 'package:incentivesgit/presentation/type_B_leaderboard/model/leaderboardtypeb_model.dart';

class TypeBLeaderBoard {
  final CacheService _cacheService = CacheService();

  Future<LeaderData> fetchLeaderBoardData() async {
    String? companyId = await _cacheService.getCompanyId();
    String? userId = await _cacheService.getUserId();
    final companyCode = await _cacheService.getCache(COMP_CODE);
    final scopeId = await _cacheService.getCache(SCOP_ID);
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=830hh1i1543qe4t2esv612cvlpnpjvg9'
    };
    var request = http.Request('POST', Uri.parse('${Url.getleaderboardtypeb}'));
    request.bodyFields = {
      'company_id': companyId!,
      'program_id': Get.arguments,
      'own_id': userId!,
      // 'c_code': 'COMP000080',
      'c_code': companyCode,

      'param': '""'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      final jsonResponse = json.decode(responseBody);
      print('jsonResponse11111$jsonResponse');
      return LeaderData.fromJson(jsonResponse['data']);
    } else {
      throw Exception(
          'Failed to load leaderboard data: ${response.reasonPhrase}');
    }
  }
}
