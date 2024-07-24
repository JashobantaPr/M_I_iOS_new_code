import 'dart:convert';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_leaderboard/model/certificateleader_Model.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_Tabbar/controller/buzzeTabBar_Controller.dart';

class CertificateLeaderService {
  final CacheService _cacheService = CacheService();

  Future<ApiResponse> fetchCertificateLeaderBoard(String scopeID) async {
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
    var request = http.Request('POST', Uri.parse(Url.certificateLeader));
    request.bodyFields = {
      'company_id': companyId ?? '',
      'scope_id': scopeID,
      'user_id': userId ?? ''
    };
    print('requestbodyFieldsz${request.bodyFields}');
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      final jsonResponse = json.decode(responseBody);
      return ApiResponse.fromJson(jsonResponse);
    } else {
      throw Exception(
          'Failed to load leaderboard data: ${response.reasonPhrase}');
    }
  }
}
