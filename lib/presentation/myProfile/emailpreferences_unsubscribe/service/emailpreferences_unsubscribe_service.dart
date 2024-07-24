import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';

class Unsubscribe {
  final CacheService _cacheService = CacheService();
  Future<String?> unSubscribe(String emailcompanyid, String emailuserid,
      String cmsuserid, String emailsenddate, String selectedValue) async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=clusmkikr8tjbd7bjqtp3nhq8v7jhkrk'
    };
    var request = http.Request('POST', Uri.parse(Url.inserdataofemailuser));
    request.bodyFields = {
      'userid': userId!,
      'c_id': companyId!,
      'email_company_id_pk': '{{$emailcompanyid}}',
      'subscription_status': 'unsubscribe',
      'email_user_id_pk': '{{$emailuserid}}',
      'cms_user_id': '{{$cmsuserid}}',
      'Unsubscribe_daysfor': selectedValue,
      'email_send_date': '{{$emailsenddate}}'
    };
    print('dhfh ${request.bodyFields}');
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print('dskhffhd ${response.statusCode}');

    if (response.statusCode == 200) {
      String? json = await response.stream.bytesToString();
      final jsonResponse = jsonDecode(json);
      print('dkfhf ${jsonResponse}');
      return jsonResponse['status'];
    } else {
      print(response.reasonPhrase);
      return '';
    }
  }
}
