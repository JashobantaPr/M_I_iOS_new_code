import 'dart:convert';

import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:http/http.dart' as http;
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/hub_screens/model/hub_model.dart';
import 'package:incentivesgit/presentation/hub_screens/model/searchmodel.dart';

class HubService {
  final CacheService _cacheService = CacheService();

  Future<List<Section>> getHubSection() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    final companyCode = await _cacheService.getCache(COMP_CODE);
    final scopeId = await _cacheService.getCache(SCOP_ID);

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=j7ov0s345jum4bcenv89d073dea4rres'
    };
    var request = http.Request('POST', Uri.parse(Url.hubsectionlist));
    request.bodyFields = {
      'company_id': companyId ?? '',
      'company_code': companyCode,
      'scope_id': scopeId,
      'dep_id': '1877',
      'des_id': '440',
      'activity': '"false"'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);

      final sections = (jsonResponse['section'] as List)
          .map((section) => Section.fromJson(section))
          .toList();

      return sections;
    } else {
      throw Exception('Failed to load sections');
    }
  }

  Future<List<SearchContent>> hubSearch(String keyword) async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/json',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=kjuune6boo8s33iavn7hc2rnhlsarhrk'
    };
    var request = http.Request('POST', Uri.parse(Url.hubSearch));
    request.body = json.encode({
      "company_code": "COMP000080",
      "company_id": companyId,
      "dep_id": "1877",
      "des_id": "440",
      "is_android": "true",
      "scope_id": "167",
      "section_id": "94",
      "keyword": keyword // Use dynamic keyword here
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);

      final List<SearchContent> searchContents =
          (jsonResponse['searchcontent'] as List)
              .map((content) => SearchContent.fromJson(content))
              .toList();

      return searchContents;
    } else {
      throw Exception('Failed to perform search');
    }
  }
}
