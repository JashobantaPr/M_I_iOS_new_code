import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/myProfile/business_hierarchy/model/business_hieararchy_model.dart';

class BusinessHierarchy {
  final CacheService _cacheService = CacheService();
  Future<MyHierarchy?> myHierarchData() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=oggb6g49bq4rc2nkf65mc7jahjk5e186'
    };
    var request = http.Request('POST', Uri.parse(Url.myHierarchyApp));
    request.bodyFields = {'companyId': companyId!, 'userId': userId!};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String? json = await response.stream.bytesToString();
      final jsonResponse = jsonDecode(json);
      print('fbf $jsonResponse');
      if (jsonResponse['status'] == true) {
        print('dfhfhf ');
        return MyHierarchy.fromJson(jsonResponse);
      } else {
        print('Error: ${jsonResponse['error']}');
        return null;
      }
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
