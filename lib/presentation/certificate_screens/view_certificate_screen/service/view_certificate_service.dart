import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/app_export.dart';

import '../../../../core/utils/cache_service.dart';
import '../../../../data/api_secvices/api_url.dart';
import '../controller/view_certificate_controller.dart';

class getCertificateServices {
// Service method to fetch all certificate details
  Future<Map<String, dynamic>?> getCertificatesDetails() async {
    final CacheService _cacheService = CacheService();
    final userId = await _cacheService.getCache(USERID);
    final postData = Get.find<ViewCertificateController>();
    print('POSTID==${postData.postId}');
    print('userIduserId$userId');
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=s1ljhm8gjld687renp9hjsfugpkoag3a'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis/engagements/get_post_details/'));
    request.bodyFields = {
      'user_id': userId,
      'company_id': '80',
      'post_id': postData.postId
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.bytesToString();
      print('Response Body: $responseBody');
      return json.decode(responseBody);
    } else {
      print('Error: ${response.reasonPhrase}');
      return null;
    }
  }
}
