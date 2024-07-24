import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'dart:convert';
import '../model/scheduledupgrade_model.dart';

class ScheduledUpgradeService {
  final CacheService _cacheService = CacheService();

  Future<ScheduledUpgrade?> scheduled() async {
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=kukgept1g48u7o11sicqfb9vklmm6hmb'
    };
    var request = http.Request('POST', Uri.parse('${Url.helpmanual}'));
    request.bodyFields = {'file': 'Buzzz Manual_18.09.1.0.pdf'};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      var decodedJson = json.decode(responseBody);
      print("Scheduleupgraderesponse$decodedJson");

      return ScheduledUpgrade.fromJson(decodedJson);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
