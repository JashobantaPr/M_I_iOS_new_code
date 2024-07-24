import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'dart:convert';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/type_A_directawardingofpoints/model/leaderBoardModel.dart';
import 'package:incentivesgit/presentation/type_A_directawardingofpoints/model/points_model.dart';

class TypeAservices {
  final CacheService _cacheService = CacheService();
  Future<Data> fetchLeaderBoardData() async {
    String? companyId = await _cacheService.getCompanyId();
    String? userId = await _cacheService.getUserId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=830hh1i1543qe4t2esv612cvlpnpjvg9'
    };
    var request = http.Request('POST', Uri.parse(Url.leaderBoard));
    request.bodyFields = {
      'company_id': companyId!,
      'program_id': Get.arguments,
      'user_id': userId!
      // 'own_id': '61302',
      // 'c_code': 'COMP000080'
    };
    request.headers.addAll(headers);
    print('ffgfgfgfg${request.bodyFields}');

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      final jsonResponse = json.decode(responseBody);
      print('jsonResponse11111$jsonResponse');
      return Data.fromJson(jsonResponse['data']);
    } else {
      throw Exception(
          'Failed to load leaderboard data: ${response.reasonPhrase}');
    }
  }

  Future<Pointscounts?> totalpointss() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    print('dataaa$userId');
    print('dataaa$companyId');
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=9i5tmcr4rkatgv5ge2sv1eu3dpgf3voe'
    };
    var request = http.Request('POST', Uri.parse(Url.pointddashboard));
    request.bodyFields = {
      'company_id': companyId!,
      'user_id': userId!,
      'program_id': Get.arguments
    };
    print('request.bodyFields${request.bodyFields}');
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      final dataList = jsonResponse['data'] as List<dynamic>;
      if (dataList.isNotEmpty) {
        final Map<String, dynamic> data =
            dataList.first as Map<String, dynamic>;
        return Pointscounts.fromJson(data);
      } else {
        print('No data found.');
        return null;
      }
    } else {
      print('Failed to fetch points: ${response.reasonPhrase}');
      return null;
    }
  }
}
