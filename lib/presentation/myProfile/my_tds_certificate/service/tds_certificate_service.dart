import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/myProfile/my_tds_certificate/model/tds_data_model.dart';

class TDSCertificateService {
  final CacheService _cacheService = CacheService();

  Future<List<TDSCertificate>?> tdsCertificate() async {
    String? companyCode = await _cacheService.getCompanyCode();
    String? userId = await _cacheService.getUserId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=2gpd1hvspunovl2ru4nihpsfod352tot'
    };

    var request = http.Request('POST', Uri.parse(Url.tdscertificatelist));
    request.bodyFields = {'user_id': userId!, 'company_code': companyCode!};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String json = await response.stream.bytesToString();
      final jsonResponse = jsonDecode(json);

      if (jsonResponse['status'] == true) {
        if (jsonResponse['data'] != null && jsonResponse['data'].isNotEmpty) {
          List<TDSCertificate> tdsDataList = (jsonResponse['data'] as List)
              .map((item) => TDSCertificate.fromJson(item))
              .toList();

          return tdsDataList;
        } else {
          print('No data available.');
          return [];
        }
      } else {
        print('Operation failed: ${jsonResponse['msg']}');
        return null;
      }
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
