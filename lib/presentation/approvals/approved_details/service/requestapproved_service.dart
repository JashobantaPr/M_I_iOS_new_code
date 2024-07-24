import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/presentation/Approvals/approved_details/module/requestApproved_module.dart';


class RequestApprovedService {
  Future<UserResponse?> getRequestApproved() async {
    try {
      String? userId = await CacheService().getUserId();
      String? companyId = await CacheService().getCompanyId();

      var headers = {
        'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
        'X-API-KEY': 'grgbuzzz',
        'Content-Type': 'application/x-www-form-urlencoded',
        'Cookie':
            '7a2e968c0b376de46a933ec04704fe5ff5f48d42=8cel88kpgpegkairc3k9c4affp2ss7fd'
      };

      var bodyFields = {
        'company_id': '80',
        'own_id': '61493',
        'entity_id': '410',
        'c_code': 'COMP000080'
      };

      var uri = Uri.parse(
          'https://staging.myincentives.co.in/index.php/apis/approvals/get_user_detail/');
      
      var response = await http.post(uri, headers: headers, body: bodyFields);

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);

        if (jsonResponse == null) {
          print('Response body is null');
          return null; // Handle the case where the response body is null
        }

        if (jsonResponse is Map<String, dynamic>) {
          return UserResponse.fromJson(jsonResponse);
        } else {
          print('Unexpected JSON structure');
          return null; // Handle unexpected JSON structure
        }
      } else {
        print('Failed to fetch profiles: ${response.reasonPhrase}');
        return null; // Handle HTTP error
      }
    } catch (e) {
      print('Exception during API call: $e');
      return null; // Handle exceptions
    }
  }
}