import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_createclaim_management/model/slabmodel.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_createclaim_management/model/typeC_createclaim_management_model.dart';

class AddclaimforApproval {
  final CacheService _cacheService = CacheService();

  Future<ClaimData?> fetchAddClaimDetails(String postId) async {
    try {
      String? userId = await _cacheService.getUserId();
      String? companyId = await _cacheService.getCompanyId();

      var headers = {
        'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
        'X-API-KEY': 'grgbuzzz',
        'Content-Type': 'application/x-www-form-urlencoded',
        'Cookie':
            '7a2e968c0b376de46a933ec04704fe5ff5f48d42=9hvc79dc1ejbo9aet10sfj4rcja8mcfp'
      };

      var request = http.Request('POST', Uri.parse(Url.addclaimformfields));
      request.bodyFields = {
        'company_id': companyId!,
        'user_id': userId!,
        'program_id': postId
      };

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final Map<String, dynamic> jsonResponse = json.decode(responseBody);
        return ClaimData.fromJson(jsonResponse);
      } else {
        print(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      print('Error fetching claim details: $e');
      return null;
    }
  }

  Future<Map<String, dynamic>?> approvalStatus(
      Map<String, String> bodyFields) async {
    try {
      var headers = {
        'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
        'X-API-KEY': 'grgbuzzz',
        'Content-Type': 'application/x-www-form-urlencoded',
        'Cookie':
            '7a2e968c0b376de46a933ec04704fe5ff5f48d42=p1us813r11ogn2se9eh50as94s4k0m5a',
      };

      var request = http.Request('POST', Uri.parse(Url.saveUserClaim));
      print('requestdf $request');
      request.bodyFields = bodyFields;
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      print('jadf ${response.statusCode}');

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final Map<String, dynamic> jsonResponse = json.decode(responseBody);
        print('jsonResponse: $jsonResponse');

        return jsonResponse;
      } else {
        print('Response Error: ${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      print('Error fetching approval status: $e');
      return null;
    }
  }

  Future<SlabPoint?> slabData(String value, String postId) async {
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=k8oplkd6a2o0gsscg1e722b384si94mr'
    };
    var request = http.Request('POST', Uri.parse(Url.getslabvalue));
    request.bodyFields = {'program_id': postId, 'total_invoice_value': value};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String json = await response.stream.bytesToString();
      final jsonResponse = jsonDecode(json);
      print('sdkhfb $jsonResponse');
      if (jsonResponse['status'] == true && jsonResponse['points'] != null) {
        return SlabPoint.fromJson(jsonResponse['points'][0]);
      }
    } else {
      print(response.reasonPhrase);
      return null;
    }
    return null;
  }
}
