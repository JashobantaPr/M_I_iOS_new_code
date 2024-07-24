import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'dart:convert';

import 'package:incentivesgit/presentation/type_b_screen/campain_details_screen/models/campaigndetails_model.dart';

import '../models/leaderboard_model.dart';

class TypeBCampaignService {
  final CacheService _cacheService = CacheService();

  Future<TypeBCampaignDetails?> typebcampaignpoints() async {
    String? companyId = await _cacheService.getCompanyId();
    String? userId = await _cacheService.getUserId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=okrrf1obqe9362232scvf4k3rfr8ajng'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            '${Url.getpointdashboardtypeb}'));
    request.bodyFields = {
      'company_id': companyId!,
      'user_id': userId!,
      'program_id': Get.arguments
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      var jsonData = json.decode(responseBody);
      return TypeBCampaignDetails.fromJson(jsonData);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<LeaderData> fetchLeaderBoardData() async {
    String? companyId = await _cacheService.getCompanyId();
    String? userId = await _cacheService.getUserId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=830hh1i1543qe4t2esv612cvlpnpjvg9'
    };
    var request = http.Request('POST', Uri.parse(Url.leaderBoardtypeb));
    request.bodyFields = {
      'company_id': companyId!,
      'program_id': Get.arguments,
      'user_id': userId!
      // 'own_id': '61302',
      // 'c_code': 'COMP000080'
    };
    request.headers.addAll(headers);
    print('ffgfgfgfg${request.bodyFields}');

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseBody = await response.stream.bytesToString();
      final jsonResponse = json.decode(responseBody);
      print('jsonResponse11111$jsonResponse');
      return LeaderData.fromJson(jsonResponse['data']);
    } else {
      throw Exception(
          'Failed to load leaderboard data: ${response.reasonPhrase}');
    }
  }

  Future<String?> programterminologytext() async {
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/json',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=p5p9neeekgtplgp4c82vvum0d562s5um'
    };
    var request = http.Request('GET', Uri.parse(Url.companyprofile));
    request.bodyFields = {};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      final terminologytext =
          jsonResponse['company_details']['program_terminology_text'];
      if (terminologytext.isNotEmpty) {
        return terminologytext;
      } else {
        print('No data found.');
        return null;
      }
    } else {
      print(response.reasonPhrase);
    }
    return null;
  }

}
