import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/type_A_view_details/model/typeAviewDetailsmodel.dart';

class ViewDetailsForAchievement {
  final CacheService _cacheService = CacheService();

  Future<TargetUserDetail?> viewdetailsforachievement() async {
    String? companyId = await _cacheService.getCompanyId();
    String? userId = await _cacheService.getUserId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=kn02scc78fes3udv1je2khk3qkpacsce'
    };
    var request = http.Request('POST', Uri.parse(Url.gettargetdata));
    request.bodyFields = {
      'company_id': companyId!,
      'program_id': Get.arguments,
      'user_id': userId!
    };
    print('request.bodyFields${request.bodyFields}');
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      final dataList = jsonResponse['target_user_detail'] as List<dynamic>;
      print('dataList11$dataList');
      if (dataList.isNotEmpty) {
        for (var item in dataList) {
          final Map<String, dynamic> data = item as Map<String, dynamic>;
          if (data['user_id_fk'] == userId) {
            return TargetUserDetail.fromJson(data);
          }
        }
        print('No matching data found for user_id: $userId');
        return null;
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
