import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/presentation/Approvals/Approval_MyApproval/module/myapprovalmodule.dart';

class MyapprovalService {
  final CacheService _cacheService = CacheService();

  Future<ApiResponse> fetchMyApproval() async {
    try {
      String? companyId = await _cacheService.getCompanyId();
      String? userId = await _cacheService.getUserId();
      final scopeid = await _cacheService.getCache('SCOP_ID');

      var headers = {
        'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
        'X-API-KEY': 'grgbuzzz',
        'Content-Type': 'application/json',
        'Cookie':
            '7a2e968c0b376de46a933ec04704fe5ff5f48d42=inq43c88hjg8jk865pvbs35atgmge2cs'
      };
      var request = http.Request(
          'POST',
          Uri.parse(
              'https://staging.myincentives.co.in/index.php/apis//approvals/get_budget_approvals'));
      request.body = json.encode({
        "c_code": "COMP000080",
        "company_id": companyId,
        "device_type": "app",
        "length": "",
        "search": {"value": ""},
        "start": "0",
        "user_id": userId
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      print('requestbody123zz${request.body}');

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        print('Response body: $jsonResponse'); // Debug log
        return ApiResponse.fromJson(jsonResponse);
      } else {
        throw Exception(
            'Failed to load approval data: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error fetching approval data: $e');
    }
  }
}
