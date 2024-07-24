import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../data/api_secvices/api_url.dart';

class getAllCertificateServices {
  Future<Map<String, dynamic>?> getAllCertificatesDetails() async {
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=n1p6gcjqscqmjhpcobk6i7v26tkv1po0'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis/engagements/posts_api/'));
    request.bodyFields = {'company_id': '80', 'posts_type': 'Certificates'};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String responseString = await response.stream.bytesToString();
      print(responseString);
      return json.decode(responseString); // Decode the response and return it
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<String> addlike(Map<String, String> bodyFields) async {
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=198p9taae3p06k6qdl9okropuof51crg'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis//home/addLike'));
    request.bodyFields = bodyFields;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      final addedlike = jsonResponse['status'];
      print('Add Like Response: $jsonResponse'); // Debug print
      return addedlike;
    } else {
      print(response.reasonPhrase);
      return '';
    }
  }

  Future<String?> removeLike(Map<String, String> bodyFields) async {
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=ph2tfru4mbnk5f6ode4ufntucud09vis'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis//home/removeLike'));
    request.bodyFields = bodyFields;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      final removelike = jsonResponse['status'];
      print('Remove Like Response: $jsonResponse'); // Debug print
      return removelike;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<String?> addcomment(Map<String, String> bodyFields) async {
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=05pd8kto00d4fmp6sbiv5nvvkl18k03f'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis//engagements/postComment'));
    request.bodyFields = bodyFields;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      final addcomment = jsonResponse['comment'];
      return addcomment;
    } else {
      print('Error: ${response.reasonPhrase}');
      return null;
    }
  }
}
