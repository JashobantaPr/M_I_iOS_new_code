import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';

class MyAccountService {
  final CacheService _cacheService = CacheService();
  Future<bool> deleteuserToken() async {
    String? userId = await _cacheService.getUserId();
    String? userToken = await _cacheService.getUserToken();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=650aoalv2a28utv3j1nuql1v2pietut3'
    };
    var request = http.Request('POST', Uri.parse(Url.deleteusertoken));
    request.bodyFields = {'user_token': userToken!, 'user_id': userId!};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String json = await response.stream.bytesToString();
      final jsonresponse = jsonDecode(json);
      print('sdfhf $jsonresponse');
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

  Future<bool> fcmTokenDelete() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    String? fcmToken = await _cacheService.getFcmToken();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=qhg4n6cbk62ub6vfspk62i9fm5d2p3p9'
    };
    var request = http.Request('POST', Uri.parse(Url.deletefcmtoken));
    request.bodyFields = {
      'token': fcmToken!,
      'user_id': userId!,
      'type': 'delete',
      'company_id': companyId!
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String json = await response.stream.bytesToString();
      final jsonresponse = jsonDecode(json);
      print('sdhd $jsonresponse');
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

  Future<Map<String, String>?> primerydata() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=el886e35ag27cnp0d9ck56c7ln643kij'
    };
    var request = http.Request('POST', Uri.parse(Url.companyuserdet));
    request.bodyFields = {'user_id': userId!, 'company_id': companyId!};
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);

        if (jsonResponse is Map<String, dynamic> &&
            jsonResponse['profile_data'] != null &&
            jsonResponse['profile_data']['userdata'] != null &&
            jsonResponse['profile_data']['userdata'].isNotEmpty) {
          var userdata = jsonResponse['profile_data']['userdata'][0];
          return {
            'first_name': userdata['first_name'] as String,
            'last_name': userdata['last_name'] as String,
            'profile_pic': userdata['profile'].toString(),
          };
        } else {
          print('No profile_data or userdata found.');
          return null;
        }
      } else {
        print('HTTP error: ${response.statusCode} - ${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      print('Exception caught: $e');
      return null;
    }
  }
}
