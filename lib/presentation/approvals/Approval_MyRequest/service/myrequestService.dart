import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/presentation/Approvals/Approval_MyRequest/module/myrequestModule.dart';

class MyrequestService {
  final String baseUrl = 'https://staging.myincentives.co.in/index.php/apis/approvals/get_budget_requests';
  final String authorizationToken = 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0';
  final String apiKey = 'grgbuzzz';
  final String cookie = '7a2e968c0b376de46a933ec04704fe5ff5f48d42=inq43c88hjg8jk865pvbs35atgmge2cs';

  Future<BudgetResponse> fetchMyRequest() async {
    try {
      var headers = {
        'Authorization': authorizationToken,
        'X-API-KEY': apiKey,
        'Content-Type': 'application/json',
        'Cookie': cookie,
      };

      var requestBody = {
        "c_code": "COMP000080",
        "company_id": "80",
        "device_type": "app",
        "length": "1",
        "search": {"value": ""},
        "start": "0",
        "user_id": "61493"
      };

      var response = await http.post(Uri.parse(baseUrl), headers: headers, body: json.encode(requestBody));

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print('Response body12Z: $jsonResponse'); // Debug log
        return BudgetResponse.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to load approval data: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error fetching approval data: $e');
    }
  }
}
