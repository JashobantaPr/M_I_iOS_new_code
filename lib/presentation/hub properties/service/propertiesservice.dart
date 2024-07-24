import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/hub%20properties/module/propertiesmodule.dart';

class HubPropetiesService {
  final CacheService _cacheService = CacheService();
  Future<Document?> hubproperties() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=eutoeflo699qg8i1lvqvoilbs60ho377'
    };
    var request = http.Request('POST', Uri.parse(Url.hubfileproperty));
    request.bodyFields = {
      'company_id': companyId ?? '',
      'sec_id': '94',
      'file_id': Get.arguments
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      final claimDataJson = jsonResponse['file'] as Map<String, dynamic>;
      return Document.fromJson(claimDataJson);
    } else {
      print('Failed to fetch points: ${response.reasonPhrase}');
      return null;
    }
  }
}
