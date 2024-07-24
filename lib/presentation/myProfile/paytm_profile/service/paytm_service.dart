import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/data/api_secvices/api_url.dart';
import 'package:incentivesgit/presentation/myProfile/paytm_profile/model/paytm_model.dart';
import 'package:incentivesgit/presentation/myProfile/paytm_profile/model/paytm_submit_model.dart';

class PaytmService {
  final CacheService _cacheService = CacheService();
  Future<PaytmDetailsResponse?> paytmData() async {
    String? companyId = await _cacheService.getCompanyId();
    String? userId = await _cacheService.getUserId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=1bqub76f9smnlfgc7fhiam3lsemfikqa'
    };
    var request = http.Request('POST', Uri.parse(Url.userpaytmdetails));
    request.bodyFields = {
      'company_id': companyId!,
      'user_id': userId!,
      'user_type': 'Standard User'
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    print('jhdfhf ${response.statusCode}');

    if (response.statusCode == 200) {
      String json = await response.stream.bytesToString();
      final jsonReponse = jsonDecode(json);
      print('dfhfhf $jsonReponse');
      if (jsonReponse['status'] == true) {
        return PaytmDetailsResponse.fromJson(jsonReponse);
      }
    } else {
      print(response.reasonPhrase);
      return null;
    }
    return null;
  }

  Future<bool?> editPaytm() async {
    String? companyId = await _cacheService.getCompanyId();
    String? userId = await _cacheService.getUserId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=t75quoj7vef0unnl9jcksck6ipbtadr5'
    };
    var request = http.Request('POST', Uri.parse(Url.changepaytmaccountstatus));
    request.bodyFields = {
      'company_id': companyId!,
      'approval_status_code': 'PA004',
      'user_id': userId!
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String json = await response.stream.bytesToString();
      final jsonRepose = jsonDecode(json);
      return jsonRepose['status'];
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

  Future<PaytmProfileResponse?> updatePaytm(
      String firstName, String lastName, String mobileNumber) async {
    String? companyId = await _cacheService.getCompanyId();
    String? userId = await _cacheService.getUserId();
    var headers = {
      'Authorization': 'Basic Z3JnY21zOmdyZ2Ntc0AxMjM0',
      'X-API-KEY': 'grgbuzzz',
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie':
          '7a2e968c0b376de46a933ec04704fe5ff5f48d42=aetipdp671p7nhn52jcsaciugg16thfj'
    };
    var request = http.Request('POST', Uri.parse(Url.saveuserpaytmdetails));
    request.bodyFields = {
      'company_id': companyId!,
      'user_id': userId!,
      'fname': firstName,
      'lname': lastName,
      'mobile': mobileNumber
    };
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String json = await response.stream.bytesToString();
      final jsonResponse = jsonDecode(json);
      if (jsonResponse['status'] == true) {
        return PaytmProfileResponse.fromJson(jsonResponse);
      }
    } else {
      print(response.reasonPhrase);
      return null;
    }
    return null;
  }
}
