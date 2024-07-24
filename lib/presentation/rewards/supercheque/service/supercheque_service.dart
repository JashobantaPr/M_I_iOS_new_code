import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/rewards/supercheque/model/supercheque_model.dart';

class SuperChequeService {
  final CacheService _cacheService = CacheService();
  Future<SuperChequeStatus?> superCheque(String superchequecode) async {
    String? comapanyId = await _cacheService.getCompanyId();
    String? userId = await _cacheService.getUserId();
    final emailId = await _cacheService.getCache(EMAIL_ID);
    final firstname = await _cacheService.getCache(FIRST_NAME);
    final lastname = await _cacheService.getCache(LAST_NAME);

    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=563g5770hi3a2jh0o69n26rckboc5ri1'
    };
    var request = http.Request('POST', Uri.parse(Url.redeemsupercheque));
    request.bodyFields = {
      'supercheque_code': superchequecode,
      'company_id': comapanyId!,
      'session_user_id': userId!,
      'first_name': firstname,
      'last_name': lastname,
      'email': emailId
    };
    print('asd ${request.bodyFields}');
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String json = await response.stream.bytesToString();
      final jsonResponse = jsonDecode(json);
      SuperChequeStatus apiResponse = SuperChequeStatus.fromJson(jsonResponse);
      return apiResponse;
    } else {
      throw Exception('Failed to load data');
    }
  }

  
}
