import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/utils/cache_service.dart';
import '../model/myProfile.dart';

class MyProfileService {
  final CacheService _cacheService = CacheService();

  Future<List<myProfileModel>?> profileTabdata() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=el886e35ag27cnp0d9ck56c7ln643kij'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis//home/my_profile_sidebar'));
    request.bodyFields = {
      'user_id': userId!,
      'company_id': companyId!,
      'device_type': 'android'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final List<dynamic> jsonResponse = json.decode(responseBody);
      if (jsonResponse.isNotEmpty) {
        List<myProfileModel> profiles =
            jsonResponse.map((data) => myProfileModel.fromJson(data)).toList();
        return profiles;
      } else {
        print('No data found.');
        return null;
      }
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
