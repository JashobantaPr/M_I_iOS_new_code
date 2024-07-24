import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';

import '../model/helpmanual_4_model.dart';

class HelpUserMAnualListService {
  final CacheService _cacheService = CacheService();

  Future<ApiResponse?> usermodule() async {
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/json',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=o57ojs0q9kvsshfq9fhti0vh7jd399tb',
    };
    var request = http.Request(
      'POST',
      Uri.parse('${Url.getsearchdetails}'),
    );
    request.body = json.encode({
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
      ],
      "topic_id": [],
      "keyword": "login"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      var jsonData = json.decode(responseBody);
      return ApiResponse.fromJson(jsonData);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
