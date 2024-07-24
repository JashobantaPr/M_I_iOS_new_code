import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/homebottombar/campaignscreen/model/campaignmodel.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/campaigndetailstargetmeter/model/calculatedpointsmodel.dart';
import 'package:incentivesgit/presentation/typeD_automated_incentives/campaigndetailstargetmeter/model/programdetailsmodel.dart';

class TypeDService {
  final CacheService _cacheService = CacheService();
  Future<UserData?> programDetails() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=tgqafbohprcl35kkhp23phcmia6mqsiq',
    };
    var request = http.Request('POST', Uri.parse(Url.getprogramdetail));
    request.bodyFields = {
      'company_id': companyId!,
      'program_id': Get.arguments.toString(),
      'own_id': userId!,
      'c_code': 'COMP000080',
    };
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        final jsonResponse = json.decode(responseBody);
        calculatedpoints(
            jsonResponse['data']['program_details'][0]['program_code']);
        return UserData.fromJson(jsonResponse['data']);
      } else {
        throw Exception(
            'Failed to load leaderboard datasss: ${response.reasonPhrase}');
      }
    } catch (error) {
      throw Exception('Failed to fetch program details1: $error');
    }
  }

  Future<Pointscount?> totalpoints() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=9i5tmcr4rkatgv5ge2sv1eu3dpgf3voe'
    };
    var request = http.Request('POST', Uri.parse(Url.pointscount));
    request.bodyFields = {
      'company_id': companyId!,
      'user_id': userId!,
      'program_id': Get.arguments
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      final dataList = jsonResponse['data'] as List<dynamic>;
      if (dataList.isNotEmpty) {
        final Map<String, dynamic> data =
            dataList.first as Map<String, dynamic>;
        return Pointscount.fromJson(data);
      } else {
        print('No data found.');
        return null;
      }
    } else {
      print('Failed to fetch points: ${response.reasonPhrase}');
      return null;
    }
  }

  Future<Employee?> calculatedpoints(String programCode) async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=5vt85mrmrobalualocnn3g6t0f82pht7'
    };
    var request = http.Request('POST', Uri.parse(Url.getmongotabledata));
    request.bodyFields = {
      'company_id': companyId!,
      'table_schema_name':
          'sys_${companyId}_${programCode.toLowerCase()}_incentives_calculations'
    };

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      final List<dynamic> dataList = jsonResponse['data'];

      String targetUserId = userId.toString();
      Employee? employee =
          findEmployee(dataList, companyId, programCode, targetUserId);

      if (employee != null) {
        return employee;
      } else {
        print('Employee data not found for the specified user ID.');
        return null;
      }
    } else {
      print('Failed to fetch data: ${response.reasonPhrase}');
      return null;
    }
  }

  Employee? findEmployee(List<dynamic> dataList, String companyId,
      String programCode, String userId) {
    for (var data in dataList) {
      if (data['sys_${companyId}_${programCode.toLowerCase()}_cms_user_id'] ==
          userId) {
        return Employee.fromJson(data, companyId, programCode);
      }
    }
    return null;
  }
}
