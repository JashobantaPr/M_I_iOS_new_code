import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/utils/cache_service.dart';
import '../../../homebottombar/campaignscreen/model/tiermodel.dart';

class TierscreenService {
  final CacheService _cacheService = CacheService();

  Future<TierDataResponse?> tierviewdata() async {
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=krbpl85aeqoh3b5oktr99idqmfqe52c7'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis/Tier_management/get_user_tier_details'));
    request.bodyFields = {'company_id': '80', 'user_id': '61493'};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> json = jsonDecode(responseBody);
      return TierDataResponse.fromJson(json);
    } else {
      print(response.reasonPhrase);
    }
    return null;
  }
}
