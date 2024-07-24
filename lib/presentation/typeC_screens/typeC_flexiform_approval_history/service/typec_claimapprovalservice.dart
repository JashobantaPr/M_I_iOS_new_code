import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_flexiform_approval_history/model/typeC_flexiform_approval_history_model.dart';

class TypeCClaimApproval {
  final CacheService _cacheService = CacheService();
  
  Future<ResponseData?> getClaimApproval() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie': '7a2e968c0b376de46a933ec04704fe5ff5f48d42=lvb2nqk8uffji6buvo6gehrb6mgnehnv'
    };

    var request = http.Request('POST', Uri.parse(Url.claimApproval));
    request.bodyFields = {
      'claim_id': Get.arguments,
      'company_id': companyId!,
    };
    request.headers.addAll(headers);

    print('zxxxxz${request.bodyFields}');

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      print('responseBody12345${responseBody}');
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      print('jsonResponse123${jsonResponse}');
      if (jsonResponse.containsKey('response')) {
        final data = ResponseData.fromJson(jsonResponse['response']);
        return data;
      } else {
        print('No response key found in JSON.');
        return null;
      }
    } else {
      print('Failed to fetch claims: ${response.reasonPhrase}');
      return null;
    }
  }
}
