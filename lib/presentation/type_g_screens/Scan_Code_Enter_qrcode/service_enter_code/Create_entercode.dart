import 'dart:convert';

import 'package:http/http.dart' as http;

class QrcodeEnterservices {
  Future<Map<String, dynamic>?> enterscancode(
      Map<String, String> bodyFields) async {
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=0i0poj6cjb52vcgdrinp0c4ath6rjgt4'
    };

    var request = http.Request(
      'POST',
      Uri.parse(
          'https://staging.myincentives.co.in/index.php/apis/scan/qrcodeSubmit'),
    );
    request.bodyFields = bodyFields;
    request.headers.addAll(headers);

    try {
      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        var jsonResponse = jsonDecode(responseBody);
        return jsonResponse;
      } else {
        print('Failed with status code: ${response.statusCode}');
        print('Reason: ${response.reasonPhrase}');
        return null;
      }
    } catch (e) {
      print('Exception occurred during API call: $e');
      return null;
    }
  }
}
