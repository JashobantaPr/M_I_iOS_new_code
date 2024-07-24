import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/presentation/certificate_screens/Myprofile/module/myprofilemodule.dart';

class ProfileService {
  final String apiUrl =
      'https://staging.myincentives.co.in/index.php/apis/home/companyuserdet';

  Future<ProfileData?> getProfile() async {
    try {
      String? userId = await CacheService().getUserId();
      String? companyId = await CacheService().getCompanyId();

      if (userId == null || companyId == null) {
        print('User ID or Company ID is null');
        return null; // Handle the case where either ID is null
      }

      var headers = {
        'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
        'X-API-KEY': 'grgbuzzz',
        'Content-Type': 'application/x-www-form-urlencoded',
        'Cookie':
            '7a2e968c0b376de46a933ec04704fe5ff5f48d42=cui0mk9l0i6k3kltal4eauinshrv122f'
      };

      var body = {
        'user_id': '61492',
        'company_id': '80',
        'product_code': 'P00003'
      };

      print('Request body: $body');

      var response =
          await http.post(Uri.parse(apiUrl), headers: headers, body: body);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        if (jsonResponse == null) {
          print('Response body is null');
          return null; // Handle the case where the response body is null
        }

        if (jsonResponse is Map<String, dynamic>) {
          return ProfileData.fromJson(jsonResponse['profile_data']);
        } else {
          throw Exception('Unexpected JSON type');
        }
      } else {
        print('Failed to fetch profiles: ${response.reasonPhrase}');
        return null; // or handle the error as per your app's logic
      }
    } catch (e) {
      print('Exception during API call: $e');
      return null; // or handle the error as per your app's logic
    }
  }
}
