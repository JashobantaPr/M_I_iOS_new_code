import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/homebottombar/my_campainns/models/my_campains_model.dart';

class MycampaignServices {
  final CacheService _cacheService = CacheService();
  Future<List<MyCampaigns>?> myCampaigns() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=tb9aptmlbfs1npoal25grs07bus6s5uk'
    };
    var request = http.Request('POST', Uri.parse(Url.mycampaigns));
    request.bodyFields = {
      'company_id': companyId ?? '',
      'user_id': userId ?? '',
      'is_admin': 'no'
    };

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();

      final Map<String, dynamic> jsonResponse = json.decode(responseBody);

      final List<dynamic> campaignList =
          jsonResponse['prog_list'] as List<dynamic>;

      List<MyCampaigns> campaigns =
          campaignList.map((json) => MyCampaigns.fromJson(json)).toList();

      return campaigns;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
