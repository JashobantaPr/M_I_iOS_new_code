import 'dart:convert';

import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:http/http.dart' as http;
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_KpiSku_ClaimDetails/model/typeC_KpiSku_ClaimDetails_model.dart';

class TypeCKpiSkuClaimDetailsService {
  final CacheService _cacheService = CacheService();

  Future<ResponseData?> getClaimDatabyID() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
        final companyCode = await _cacheService.getCache(COMP_CODE);

    print('dataaa$userId');
    print('dataaa$companyId');

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=6c8cncn6p051mq3979okip17acfh4jeo'
    };
    var request = http.Request('POST', Uri.parse('${Url.claimDetails}'));
    request.bodyFields = {
      // 'claim_id': Get.arguments,
      'claim_id': Get.arguments,
      'company_id': companyId!,
      // 'company_code': 'COMP000080'
      'company_code': companyCode
    };
    request.headers.addAll(headers);
    print('requestsow${request.bodyFields}');

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      final claimDataJson = jsonResponse['response'] as Map<String, dynamic>;
      return ResponseData.fromJson(claimDataJson);
    } else {
      print('Failed to fetch points: ${response.reasonPhrase}');
      return null;
    }
  }
}
