
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/presentation/Approvals/incenitves%20approval/module/incentive_approvals_module.dart';
class IncentiveApprovalsService {
  Future<ApiResponse?> getIncentiveApprovals() async {
    try {
      var headers = {
        'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
        'X-API-KEY': 'grgbuzzz',
        'Content-Type': 'application/x-www-form-urlencoded',
        'Cookie': '7a2e968c0b376de46a933ec04704fe5ff5f48d42=1ss9nkd9ssp4ol02gfm3ted8ferbkrjd'
      };

      var request = http.Request('POST', Uri.parse('https://staging.myincentives.co.in/index.php/apis/approvals/get_automated_incentives_detail'));
      request.bodyFields = {
        'company_id': '80',
        'own_id': '61493',
        'entity_id': '108',
        'c_code': 'COMP000080'
      };
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseString = await response.stream.bytesToString();
        var jsonResponse = json.decode(responseString);

        if (jsonResponse == null) {
          print('Response body is null');
          return null;
        }

        if (jsonResponse['status'] == "success") {
          return ApiResponse.fromJson(jsonResponse);
        } else {
          print('Failed to fetch product details: ${jsonResponse['error']}');
          return null;
        }
      } else {
        print('Failed to fetch product details: ${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      print('Exception during API call: $e');
      return null;
    }
  }
}
