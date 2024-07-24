import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';

class ResetPasswordService {
  final CacheService _cacheService = CacheService();

  Future<bool?> passwordReset(
      String oldpassword, String newpassword, String confirmpassword) async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    String? companyCode = await _cacheService.getCompanyCode();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=59t4glaglhifkh79grvl9mb0381v4us0'
    };
    var request = http.Request('POST', Uri.parse(Url.profileupdate));
    request.bodyFields = {
      'user_id': userId!,
      'c_id': companyId!,
      'code': companyCode!,
      'postdata':
          '{"currentPwd":"$oldpassword","newPwd":"$newpassword","retypePwd":"$confirmpassword"}'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String json = await response.stream.bytesToString();
      final jsonResponse = jsonDecode(json);
      if (jsonResponse['status'] == true) {
        await _cacheService.removeAll();
        return true;
      } else {
        print('Error: ${jsonResponse['mssg']}');
        return false;
      }
    } else {
      print('Error: ${response.reasonPhrase}');
      return false;
    }
  }
}
