import 'dart:convert';
import 'dart:io';

import 'package:encrypt/encrypt.dart' as encrypt; // Import encrypt package
import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:path_provider/path_provider.dart';

class getAllCertificateServices {
  final CacheService _cacheService = CacheService();
  Future<Map<String, dynamic>?> getAllCertificatesDetails(
      Map<String, String> bodyFields) async {
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
    // request.bodyFields = {'company_id': '80', 'posts_type': 'Certificates'};
    request.bodyFields = bodyFields;
    request.headers.addAll(headers);
    print('bodyyy${request.bodyFields}');
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

  String encryptData(String data, String key, String ivKey) {
    final keyBytes = utf8.encode(key.padRight(16, '0').substring(0, 16));
    final iv = encrypt.IV.fromBase16(ivKey);

    final encrypter =
        encrypt.Encrypter(encrypt.AES(encrypt.Key.fromLength(16)));
    final encrypted = encrypter.encrypt(data, iv: iv);

    // Base64 encode encrypted data and IV
    final base64Encrypted = encrypted.base64;
    final base64Iv = iv.base64;

    return '$base64Encrypted:$base64Iv';
  }





   Future<Map<String, dynamic>> downloadCertificate(Map<String, String> bodyFields) async {
    try {
      var headers = {
        'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
        'X-API-KEY': 'grgbuzzz',
        'Content-Type': 'application/x-www-form-urlencoded',
        'Cookie': '7a2e968c0b376de46a933ec04704fe5ff5f48d42=80mfln60q7bme6kdj2fstv3s0amdt77v',
      };

      var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis/certificates/pdf_download'),
      );

      request.bodyFields = bodyFields;
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        String responseBody = await response.stream.bytesToString();
        // Parse the JSON response
        final Map<String, dynamic> responseData = jsonDecode(responseBody);
        return responseData;
      } else {
        print('Failed to download certificate: ${response.reasonPhrase}');
        return {};
      }
    } catch (e) {
      print('Error downloading file: $e');
      return {};
    }
  }

  Future<Map<String, dynamic>?> getlikes(Map<String, String> bodyFields) async {
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=ugg62khc60mm1bc372e5k9ctjumsbq6r'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis//home/getallpostlikes_api'));
    request.bodyFields = bodyFields;
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final Map<String, dynamic> jsonResponse = json.decode(responseBody);
      return jsonResponse;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
