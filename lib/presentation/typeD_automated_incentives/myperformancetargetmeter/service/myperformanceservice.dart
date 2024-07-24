import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/myperformancetargetmeter/model/myperformancetargetmetermodel.dart';

class MyPerformanceService {
  final CacheService _cacheService = CacheService();
  Future<List<KPI>> myPerformance() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=ijes9i6msbak2hscfco25iu17mfp9e4c'
    };

    var request = http.Request('POST', Uri.parse(Url.kpidisplaytarget));
    request.bodyFields = {
      'user_ids': userId!,
      'company_id': companyId!,
      'program_id': Get.arguments.toString(),
      'c_code': 'COMP000080'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      final jsonResponse = json.decode(responseBody);
      if (jsonResponse['data'] != null &&
          jsonResponse['data'][userId] != null) {
        List<dynamic> data = jsonResponse['data'][userId];
        List<KPI> kpiList = data.map((item) => KPI.fromJson(item)).toList();
        return kpiList;
      } else {
        throw Exception('Invalid data structure: ${jsonResponse['data']}');
      }
    } else {
      throw Exception('Failed to fetch data: ${response.reasonPhrase}');
    }
  }
}
