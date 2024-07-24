import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';

class HubSectionFilesService {
  final CacheService _cacheService = CacheService();
  Future<Map<String, dynamic>?> getHubSectionFiles() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    try {
      var headers = {
        'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
        'X-API-KEY': 'grgbuzzz',
        'Content-Type': 'application/json',
        'Cookie':
            '7a2e968c0b376de46a933ec04704fe5ff5f48d42=j3rhg32jg41hbf0ouun4e29l771lr0hk'
      };
      var request = http.Request('POST', Uri.parse(Url.hubsectionfiles));
      request.body = json.encode({
        "company_code": "COMP000080",
        "company_id": companyId,
        "dep_id": "1877",
        "des_id": "440",
        "product_code": "P00003",
        "scope_id": "167",
        "sub_section_id": Get.arguments
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        print('responseBodyyzx${responseBody}');
        return jsonDecode(responseBody);
      } else {
        throw Exception('Failed to load section files');
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  Future<Map<String, dynamic>?> getHubFilterSectionFile(
      String selectedYear) async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    final companyCode = await _cacheService.getCache(COMP_CODE);
    final scopeId = await _cacheService.getCache(SCOP_ID);
    try {
      var headers = {
        'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
        'X-API-KEY': 'grgbuzzz',
        'Content-Type': 'application/json',
        'Cookie':
            '7a2e968c0b376de46a933ec04704fe5ff5f48d42=7q3lhjgjdqobhvb2g9qgv1iu7aahg6bj'
      };
      var request = http.Request(
        'POST',
        Uri.parse(Url.hubsectionfilter),
      );
      request.body = json.encode({
        "company_code": companyCode,
        "company_id": companyId,
        "dep_id": "1877",
        "des_id": "440",
        "is_android": "true",
        "scope_id": scopeId,
        "section_id": Get.arguments,
        "year": selectedYear,
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        print('responseBodyyx12345${responseBody}');
        return jsonDecode(responseBody);
      } else {
        throw Exception('Failed to load section files');
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
