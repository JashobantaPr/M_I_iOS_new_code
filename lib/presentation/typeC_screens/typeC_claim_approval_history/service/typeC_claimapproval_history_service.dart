import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_claim_approval_history/model/typeC_claimapproval_history_model.dart';

import '../../../../data/api_secvices/api_url.dart';

class TypeCClaimApprovalHistory {
  Future<List<Campaign>?> getClaimApproval() async {
    final CacheService _cacheService = CacheService();
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=lvb2nqk8uffji6buvo6gehrb6mgnehnv'
    };

    var request = http.Request('POST', Uri.parse((Url.claimApproval)));
    request.bodyFields = {
      'claim_id': Get.arguments,
      'company_id': companyId!,
      // 'request_type': '"app"'
    };
    request.headers.addAll(headers);

    print('zxxxxz${request.bodyFields}');

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      print('responseBody12345${responseBody}');
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      print('jsonResponse123${jsonResponse}');
      // Check if the 'response' key exists in the JSON
      if (jsonResponse.containsKey('response')) {
        final data = jsonResponse['response'];
        print('data1223${data}');
        // Ensure that 'campaigndata' is not null
        if (data['campaigndata'] != null) {
          List<dynamic> dataList = data['campaigndata'];
          List<Campaign> claims =
              dataList.map((data) => Campaign.fromJson(data)).toList();
          print('claims1233${claims}');
          return claims;
        } else {
          print('No campaign data found.');
          return null;
        }
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
