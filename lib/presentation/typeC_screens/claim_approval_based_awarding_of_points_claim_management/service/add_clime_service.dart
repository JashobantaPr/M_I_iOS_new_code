import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';

class AddclaimforApproval {
  final CacheService _cacheService = CacheService();

  Future<String?> fetchClaimType() async {
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
        'program_id': Get.arguments
      };

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final Map<String, dynamic> jsonResponse = json.decode(responseBody);

        return jsonResponse['data']['claim_type'];
      } else {
        print(response.reasonPhrase);
        return null;
      }
    } catch (e) {
      print('Error fetching claim details: $e');
      return null;
    }
  }
}
