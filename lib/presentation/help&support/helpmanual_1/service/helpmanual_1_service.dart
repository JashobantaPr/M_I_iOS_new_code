import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'dart:convert';

import '../model/helpmanual_1_model.dart';

class HelpUserMAnualListService {
  final CacheService _cacheService = CacheService();

  Future<List<HelpUserManualResponse>> usermodule() async {
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/json',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=tjpkbj5h2m7j423itlm25lclk6rjl6if'
    };

    var body = json.encode({
      "product_id": "2",
      "manual_id": "2",
      "access_code": [
        "NA",
        "AC0001",
        "AC0003",
        "AC0001",
        "AC0001",
        "AC0003",
        "AC0003",
        "AC0002",
        "AC0002",
        "AC0002",
        "AC0002",
        "AC0002",
        "AC0003",
        "AC0003",
        "AC0003",
        "AC0003",
        "AC0003",
        "AC0003",
        "AC0003",
        "AC0003",
        "AC0003",
        "AC0004",
        "AC0004",
        "AC0004",
        "AC0004",
        "AC0004",
        "AC0004",
        "AC0004",
        "AC0004",
        "AC0004",
        "AC0007",
        "AC0006",
        "AC0005",
        "AC0005",
        "AC0016",
        "AC0016",
        "AC0009",
        "AC0009",
        "AC0011",
        "AC0008",
        "AC0017",
        "AC0017",
        "AC0018",
        "AC0018",
        "AC0020",
        "AC0020",
        "AC0020",
        "AC0022",
        "AC0022",
        "AC0022",
        "AC0023",
        "AC0023",
        "AC0024",
        "AC0025"
      ],
      "activity_code": [
        "NA",
        "A0005",
        "A0006",
        "A0011",
        "A0013",
        "A0015",
        "A0016",
        "A0017",
        "A0019",
        "A0020",
        "A0026",
        "A0034",
        "A0041",
        "A0042",
        "A0050",
        "A0064",
        "A0070",
        "A0084",
        "A0088",
        "A0092",
        "M0094",
        "M0095",
        "M0096",
        "M0099",
        "M0098"
      ]
    });

    var response = await http.post(
      Uri.parse('${Url.usermanual}'),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      if (data is List) {
        return data
            .map((json) => HelpUserManualResponse.fromJson(json))
            .toList();
      } else {
        return [HelpUserManualResponse.fromJson(data)];
      }
    } else {
      throw Exception('Failed to load user manuals');
    }
  }
}
