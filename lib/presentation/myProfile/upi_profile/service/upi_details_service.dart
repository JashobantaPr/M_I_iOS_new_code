import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/myProfile/upi_profile/module/upiupdate_model.dart';
import 'package:incentivesgit/presentation/myProfile/upi_profile/module/user_details_module.dart';

class UpiDetailsService {
  final CacheService _cacheService = CacheService();

  Future<UpiDetails?> userUpiDetails() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=crrh2jjtdi4n02hskbkaqquvni9mutv1'
    };
    var request = http.Request('POST', Uri.parse(Url.userupidetails));
    request.bodyFields = {
      'company_id': companyId!,
      'user_id': userId!,
      'user_type': 'Standard User'
    };
    print('dkfhfhf ${request.bodyFields}');
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print('sdfb ${response.statusCode}');

    if (response.statusCode == 200) {
      var json = await response.stream.bytesToString();
      var responseData = jsonDecode(json);
      print('dfhf $responseData');
      if (responseData != null && responseData['status'] == true) {
        print('dhfbf');

        return UpiDetails.fromJson(responseData);
      }
    } else {
      print(response.reasonPhrase);
      return null;
    }
    return null;
  }

  Future<bool?> upiData(String statusCode) async {
    String? companyId = await _cacheService.getCompanyId();
    String? userId = await _cacheService.getUserId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=5jioajtk14kd9040vnbrsiv6menhjd2r'
    };
    var request = http.Request('POST', Uri.parse(Url.changeupiaccountstatus));
    request.bodyFields = {
      'company_id': companyId!,
      'approval_status_code': 'BA004',
      'user_id': userId!
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print('dkfg ${response.statusCode}');

    if (response.statusCode == 200) {
      String json = await response.stream.bytesToString();
      final jsonRepose = jsonDecode(json);
      return jsonRepose['status'];
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

  Future<UpiProfileSubmitResponse?> updateUpiData(
      String firstName, String lastName, String upiId) async {
    String? companyId = await _cacheService.getCompanyId();
    String? userId = await _cacheService.getUserId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=sgang5i6c25f1usch8jeea0e382mn9oo'
    };
    var request = http.Request('POST', Uri.parse(Url.saveuserupidetails));
    request.bodyFields = {
      'company_id': companyId!,
      'user_id': userId!,
      'first_name': firstName,
      'last_name': lastName,
      'upi_id': upiId
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String json = await response.stream.bytesToString();
      final jsonResponse = jsonDecode(json);
      if (jsonResponse['status'] == true) {
        return UpiProfileSubmitResponse.fromJson(jsonResponse);
      }
    } else {
      print(response.reasonPhrase);
      return null;
    }
    return null;
  }
}
