import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_create_claim_screen/model/sku_data_model.dart';
import 'package:incentivesgit/presentation/typeC_screens/typeC_createclaim_management/model/typeC_createclaim_management_model.dart';

class AddclaimforApprovalSku {
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
        return null;
      }
    } catch (e) {
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
      request.bodyFields = bodyFields;
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final Map<String, dynamic> jsonResponse = json.decode(responseBody);

        return jsonResponse;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<SkuData>?> getskudata(String programId) async {
    String? companyId = await _cacheService.getCompanyId();

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=fuv3c4pvusfas5ct2238uafphtfpacgq'
    };

    var request =
        http.Request('POST', Uri.parse(Url.getSkuDetailsSingleSelectapp));
    request.bodyFields = {
      'post':
          '{"draw":1,"start":0,"length":10,"search":{"value":"","regex":false},"program_id":$programId}',
      'company_id': companyId!,
      'program_id': programId
    };

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);

      if (jsonResponse['status'] == 'success') {
        final List<dynamic> data = jsonResponse['data'];
        // Map the data to a list of SkuData objects
        return data.map((item) => SkuData.fromJson(item)).toList();
      }
    }
    return null; // Change to null to match the expected type
  }
}
