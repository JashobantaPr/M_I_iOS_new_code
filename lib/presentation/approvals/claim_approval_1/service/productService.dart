import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:incentivesgit/presentation/Approvals/claim_approval_1/module/productmodule.dart';

class ProductService {
  Future<ClaimDetails?> getProduct() async {
    try {
      var headers = {
        'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
        'X-API-KEY': 'grgbuzzz',
        'Content-Type': 'application/x-www-form-urlencoded',
        'Cookie':
            '7a2e968c0b376de46a933ec04704fe5ff5f48d42=n90b62qlaplkov9o2qka9ni6lofv11tb'
      };

      var response = await http.post(
        Uri.parse(
            'https://staging.myincentives.co.in/index.php/apis/claims/get_claim_details/'),
        headers: headers,
        body: {
          'company_id': '80',
          'request_id': '2304',
          'company_code': 'COMP000080',
          'entity_id': '641'
        },
      );

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);

        if (jsonResponse == null) {
          print('Response body is null');
          return null; // Handle the case where the response body is null
        }

        // Check for status in the response and handle accordingly
        if (jsonResponse['status'] == true) {
          return ClaimDetails.fromJson(jsonResponse['data']);
        } else {
          print('Failed to fetch product details: ${jsonResponse['error']}');
          return null; // Handle the error response from API
        }
      } else {
        print('Failed to fetch product details: ${response.reasonPhrase}');
        return null; // Handle the error as per your app's logic
      }
    } catch (e) {
      print('Exception during API call: $e');
      return null; // Handle the error as per your app's logic
    }
  }
}
