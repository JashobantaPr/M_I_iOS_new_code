import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/presentation/homebottombar/engagement/model/engagementmodel.dart';

class EngagementService {
  final CacheService _cacheService = CacheService();

  Future<List<EngagementModel>> engagement() async {
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie': '7a2e968c0b376de46a933ec04704fe5ff5f48d42=v31cc53ojpa02nk1dsa1pqd6ba0elj8d'
    };
    var request = http.Request(
        'POST',
        Uri.parse('https://staging.myincentives.co.in/index.php/apis//home/exp_menu'));
    request.bodyFields = {'company_id': companyId ?? '80'};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      var jsonData = json.decode(responseBody);

      if (jsonData is Map<String, dynamic>) {
        List<EngagementModel> engagementList = [];
        jsonData.forEach((key, value) {
          if (value is Map<String, dynamic>) {
            engagementList.add(EngagementModel.fromJson(value));
          }
        });
        return engagementList;
      } else {
        throw Exception("Unexpected JSON format");
      }
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
