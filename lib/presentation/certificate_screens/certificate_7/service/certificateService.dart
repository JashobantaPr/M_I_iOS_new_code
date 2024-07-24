import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_7/model/certificate_7_model.dart';

class ChooseCertificateService {
  final CacheService _cacheService = CacheService();

  Future<CertificateResponse?> fetchCertificate() async {
    String? companyId = await _cacheService.getCompanyId();
    String? userId = await _cacheService.getUserId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=m0em73r4ek58ck6ss2o47lb493a5rmhv'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis//certificates/allCertificates'));
    request.bodyFields = {
      'company_id': companyId!,
      'user_id': "61492",
      'access_control': '{{access_control_json}}',
      'company_code': 'COMP000080'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseString = await response.stream.bytesToString();
      print('responseString${responseString}');
      return CertificateResponse.fromJson(json.decode(responseString));
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
