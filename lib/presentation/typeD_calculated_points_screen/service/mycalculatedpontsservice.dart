import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/typeD_calculated_points_screen/model/typeD_calculated_points_view.dart';

class MyCalculatedPointsService {
  final CacheService _cacheService = CacheService();

  Future<ProgramResponse?> myprogresscard() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    final programId = Get.arguments[1]?['programId'].toString();
    final programCode = Get.arguments[2]?['programCode'].toString();
    if (programId == null) {
      throw Exception('Program ID is null or not found.');
    }

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=t70dk5fevp9v7k1oo3t9uq0hkj43nms8'
    };
    var request = http.Request('POST', Uri.parse(Url.getcalculatedpayout));
    request.bodyFields = {
      'company_id': companyId!,
      'table_schema_name':
          'sys_${companyId}_${programCode}_incentives_calculations',
      'user_id': userId!,
      'c_code': 'COMP000080',
      'program_id': programId,
    };

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    print('Response status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      final jsonResponse = json.decode(responseBody);
      print('Request body: ${jsonResponse}');
      return ProgramResponse.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to fetch data: ${response.reasonPhrase}');
    }
  }
}
